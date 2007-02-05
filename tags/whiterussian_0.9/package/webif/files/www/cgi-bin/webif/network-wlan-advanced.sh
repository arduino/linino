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
	FORM_wdstimeout=${wl0_wdstimeout:-$(nvram get wl0_wdstimeout)}
	FORM_antdiv="${wl0_antdiv:-$(nvram get wl0_antdiv)}"
	case "$FORM_antdiv" in
		-1|auto) FORM_antdiv=-1;;
		0|main|left) FORM_antdiv=0;;
		1|aux|right) FORM_antdiv=1;;
		3|diversity) FORM_antdiv=3;;
		*) FORM_antdiv=-1;;
	esac
	FORM_distance="${wl0_distance:-$(nvram get wl0_distance)}"
else
	SAVED=1

	validate <<EOF
int|FORM_lazywds|Lazy WDS On/Off|required min=0 max=1|$FORM_lazywds
int|FORM_wdstimeout|WDS watchdog timeout|optional min=0 max=3600|$FORM_wdstimeout
int|FORM_distance|Distance|optional min=1|$FORM_distance
EOF
	equal "$?" 0 && {
		save_setting wireless wl0_lazywds "$FORM_lazywds"
		save_setting wireless wl0_wdstimeout "$FORM_wdstimeout"
		save_setting wireless wl0_macmode "$FORM_macmode"
		save_setting wireless wl0_antdiv "$FORM_antdiv"
		save_setting wireless wl0_distance "$FORM_distance"
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
field|@TR<<WDS watchdog timeout>>
text|wdstimeout|$FORM_wdstimeout
field|@TR<<Filter Mode>>:
select|macmode|$FORM_macmode
option|disabled|@TR<<Disabled>>
option|allow|@TR<<Allow>>
option|deny|@TR<<Deny>>
field|@TR<<Antenna selection>>:
select|antdiv|$FORM_antdiv
option|-1|@TR<<Automatic>>
option|0|@TR<<Left>>
option|1|@TR<<Right>>
option|3|@TR<<Diversity>>
field|@TR<<Distance>>
text|distance|$FORM_distance
end_form
EOF

footer ?>
<!--
##WEBIF:name:Network:250:Advanced Wireless
-->
