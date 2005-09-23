#!/usr/bin/haserl
<? 
. /usr/lib/webif/webif.sh

load_settings network

[ -z $FORM_submit ] && {
	# common
	FORM_wan_proto=${wan_proto:-$(nvram get wan_proto)}
	FORM_wan_proto=${FORM_wan_proto:-none}
	
	# pptp and static common
	FORM_wan_ipaddr=${wan_ipaddr:-$(nvram get wan_ipaddr)}
	FORM_wan_netmask=${wan_netmask:-$(nvram get wan_netmask)}
	FORM_wan_gateway=${wan_gateway:-$(nvram get wan_gateway)}
	
  	# pppoe and pptp common
	FORM_ppp_username=${ppp_username:-$(nvram get ppp_username)}
	FORM_ppp_passwd=${ppp_passwd:-$(nvram get ppp_passwd)}
	FORM_ppp_idletime=${ppp_idletime:-$(nvram get ppp_idletime)}
	FORM_ppp_redialperiod=${ppp_redialperiod:-$(nvram get ppp_redialperiod)}
	FORM_ppp_mtu=${ppp_mtu:-$(nvram get ppp_mtu)}
	redial=${ppp_demand:-$(nvram get ppp_demand)}
	case "$redial" in
		1|enabled|on)
			FORM_ppp_redial="demand"
		;;	
		*)
			FORM_ppp_redial="persist"
		;;	
	esac
	
	# static specific
	FORM_wan_dns=${wan_dns:-$(nvram get wan_dns)}
} || {
	SAVED=1
	# common 
	[ -z $FORM_wan_proto ] || save_setting network wan_proto $FORM_wan_proto
	
	# pptp and static common
	[ "$FORM_wan_proto" = "pptp" -o "$FORM_wan_proto" = "static" -o "$FORM_wan_proto" = "dhcp" ] && {
		[ -z $FORM_wan_ipaddr ] || save_setting network wan_ipaddr $FORM_wan_ipaddr
		[ -z $FORM_wan_netmask ] || save_setting network wan_netmask $FORM_wan_netmask
		[ -z $FORM_wan_gateway ] || save_setting network wan_gateway $FORM_wan_gateway
	}
	
	# pppoe and pptp common
	[ "$FORM_wan_proto" = "pppoe" -o "$FORM_wan_proto" = "pptp" ] && {
		[ -z $FORM_ppp_username ] || save_setting network ppp_username $FORM_ppp_username
		[ -z $FORM_ppp_passwd ] || save_setting network ppp_passwd $FORM_ppp_passwd
		[ -z $FORM_ppp_idletime ] || save_setting network ppp_idletime $FORM_ppp_idletime
		[ -z $FORM_ppp_redialperiod ] || save_setting network ppp_redialperiod $FORM_ppp_redialperiod
		[ -z $FORM_ppp_mtu ] || save_setting network ppp_mtu $FORM_ppp_mtu
		case "$FORM_ppp_redial" in
			demand)
				save_setting network ppp_demand 1
				;;
			persist)
				save_setting network ppp_demand 0
				;;
		esac	
	}	
	# static specific	
	[ "$FORM_wan_proto" = "static" ] && {
		[ -z $FORM_wan_dns ]  || save_setting network wan_dns $FORM_wan_dns
	}	
}

header "Network" "WAN" "WAN settings" ' onLoad="modechange()" '
?>
<script type="text/javascript" src="/webif.js "></script>
<script type="text/javascript">
<!--
function modechange()
{
	// pppoe and pptp common
	if (checked('wan_proto_pppoe') || checked('wan_proto_pptp')) {
		show('ppp_username');
		show('ppp_passwd');
		show('ppp_redial');
		show('ppp_mtu');
		
		if (checked('ppp_redial_demand')) {
			show('ppp_demand_idletime');
			hide('ppp_persist_redialperiod');
		} else { 	
			hide('ppp_demand_idletime');
			show('ppp_persist_redialperiod');
		}	
	} else {
		hide('ppp_username');
		hide('ppp_passwd');
		hide('ppp_demand_idletime');
		hide('ppp_persist_redialperiod');
		hide('ppp_redial');
		hide('ppp_mtu');
		
	}	
	
	// pptp and static common
	if(checked('wan_proto_static') || checked('wan_proto_pptp')) {
		show('wan_ipaddr');
		show('wan_netmask');
		show('wan_gateway');
	} else {
		if (checked('wan_proto_dhcp')) {
			show('wan_ipaddr');
		} else {
			hide('wan_ipaddr');
		}
		hide('wan_netmask');
		hide('wan_gateway');
	}
	
	// static specific
	if(checked('wan_proto_static')) {
		show('wan_dns');
	} else {	
		hide('wan_dns');
	}
}
-->
</script>
<?if [ "$SAVED" = "1" ] ?>
	<h2>Settings Saved</h2>
<?el?>
<? display_form "start_form:$SCRIPT_NAME
field:Internet Connection Type
radio:wan_proto:$FORM_wan_proto:none:None<br />:onchange=\"modechange()\"
radio:wan_proto:$FORM_wan_proto:dhcp:DHCP<br />:onchange=\"modechange()\"
radio:wan_proto:$FORM_wan_proto:static:Static IP<br />:onchange=\"modechange()\"
radio:wan_proto:$FORM_wan_proto:pppoe:PPPoE<br />:onChange=\"modechange()\"
radio:wan_proto:$FORM_wan_proto:pptp:PPTP<br />:onChange=\"modechange()\"

field:Internet IP Address:wan_ipaddr
text:wan_ipaddr:$FORM_wan_ipaddr
field:Subnet Mask:wan_netmask
text:wan_netmask:$FORM_wan_netmask
field:Gateway:wan_gateway
text:wan_gateway:$FORM_wan_gateway
field:DNS Server(s):wan_dns
text:wan_dns:$FORM_wan_dns

field:PPP Redial Policy:ppp_redial
radio:ppp_redial:$FORM_ppp_redial:demand:Connect on Demand<br />:onChange=\"modechange()\"
radio:ppp_redial:$FORM_ppp_redial:persist:Keep Alive:onChange=\"modechange()\"
field:Maximum Idle Time:ppp_demand_idletime
text:ppp_idletime:$FORM_ppp_idletime
field:Redial Timeout:ppp_persist_redialperiod
text:ppp_redialperiod:$FORM_ppp_redialperiod
field:PPP Username:ppp_username
text:ppp_username:$FORM_ppp_username
field:PPP Password:ppp_passwd
text:ppp_passwd:$FORM_ppp_passwd
field:PPP MTU:ppp_mtu
text:ppp_mtu:$FORM_ppp_mtu

field
submit:action:Save Settings
end_form" ?>


<?fi?>

<? footer ?>
<!--
##WEBIF:name:Network:2:WAN
-->
