#!/usr/bin/haserl
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

if empty "$FORM_macmode_set"; then
	FORM_macmode="${wl0_macmode:-$(nvram get wl0_macmode)}"
else
	save_setting wireless wl0_macmode "$FORM_macmode"
fi

header "Network" "Advanced Wireless" "Advanced Wireless Settings" ' onLoad="modechange()"'
cat <<EOF
<script type="text/javascript" src="/webif.js"></script>
<script type="text/javascript">

function modechange() {
	var v = (value("macmode") == "allow") || (value("macmode") == "deny");
	set_visible('mac_list', v);
}

</script>
<form enctype="multipart/form-data" method="post" action="$SCRIPT_NAME">
EOF

display_form <<EOF
onchange|modechange
start_form|WDS connections
listedit|wds|$SCRIPT_NAME?|$FORM_wds|$FORM_wdsadd
end_form
start_form|MAC filter list
listedit|maclist|$SCRIPT_NAME?|$FORM_maclist|$FORM_maclistadd
field
caption|Filter mode: 
select|macmode|$FORM_macmode
option|disabled
option|allow
option|deny
submit|macmode_set|Set
end_form
EOF

?>

</form>
<? footer ?>
<!--
##WEBIF:name:Network:4:Advanced Wireless
-->
