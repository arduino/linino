#!/usr/bin/webif-page
<? 
. /usr/lib/webif/webif.sh
load_settings "wireless"

FORM_wds="${wl0_wds:-$(nvram get wl0_wds)}"
LISTVAL="$FORM_wds"
handle_list "$FORM_wdsremove" "$FORM_wdsadd" "$FORM_wdssubmit" 'mac|FORM_wdsadd|WDS MAC address|required' && {
	FORM_wds="$LISTVAL"
	save_setting wireless wl0_wds "$FORM_wds"
}
FORM_wdsadd=${FORM_wdsadd:-00:00:00:00:00:00}

FORM_maclist="${wl0_maclist:-$(nvram get wl0_maclist)}"
LISTVAL="$FORM_maclist"
handle_list "$FORM_maclistremove" "$FORM_maclistadd" "$FORM_maclistsubmit" 'mac|FORM_maclistadd|WDS MAC address|required' && {
	FORM_maclist="$LISTVAL"
	save_setting wireless wl0_maclist "$FORM_maclist"
}
FORM_maclistadd=${FORM_maclistadd:-00:00:00:00:00:00}

if empty "$FORM_submit"; then
	FORM_macmode="${wl0_macmode:-$(nvram get wl0_macmode)}"
	FORM_lazywds=${wl0_lazywds:-$(nvram get wl0_lazywds)}
	case "$FORM_lazywds" in
		1|on|enabled) FORM_lazywds=1;;
		*) FORM_lazywds=0;;
	esac
else
	SAVED=1

	validate <<EOF
int|FORM_lazywds|Lazy WDS On/Off|required min=0 max=1|$FORM_lazywds
EOF
	equal "$?" 0 && {
		save_setting wireless wl0_lazywds "$FORM_lazywds"
		save_setting wireless wl0_macmode "$FORM_macmode"
	}
fi

header "Network" "Advanced Wireless" "@TR<<Advanced Wireless Configuration>>" ' onLoad="modechange()"' "$SCRIPT_NAME"

cat <<EOF
<script type="text/javascript" src="/webif.js"></script>
<script type="text/javascript">

function modechange() {
	var v = (value("macmode") == "allow") || (value("macmode") == "deny");
	set_visible('mac_list', v);
}

</script>
EOF

display_form <<EOF
onchange|modechange
start_form|@TR<<WDS Connections>>
listedit|wds|$SCRIPT_NAME?|$FORM_wds|$FORM_wdsadd
end_form
start_form|@TR<<MAC Filter List>>
listedit|maclist|$SCRIPT_NAME?|$FORM_maclist|$FORM_maclistadd
end_form
start_form|@TR<<Settings>>
field|@TR<<Automatic WDS>>
select|lazywds|$FORM_lazywds
option|1|@TR<<Enabled>>
option|0|@TR<<Disabled>>
field|@TR<<Filter Mode>>:
select|macmode|$FORM_macmode
option|disabled|@TR<<Disabled>>
option|allow|@TR<<Allow>>
option|deny|@TR<<Deny>>
end_form
EOF

footer ?>
<!--
##WEBIF:name:Network:4:Advanced Wireless
-->
