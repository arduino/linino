#!/usr/bin/haserl
<? 
. /usr/lib/webif/webif.sh

load_settings network

[ -z $FORM_submit ] && {
	FORM_wan_proto=${wan_proto:-$(nvram get wan_proto)}
	case "$FORM_wan_proto" in
		# supported types
		static|dhcp|pptp|pppoe) ;;
		# otherwise select "none"
		*) FORM_wan_proto="none";;
	esac
	
	# detect pptp package and compile option
	[ -x /sbin/ifup.pptp ] && {
		PPTP_OPTION="radio:wan_proto:$FORM_wan_proto:pptp:PPTP<br />:onChange=\"modechange()\""
		PPTP_SERVER_OPTION="field:PPTP Server IP:pptp_server_ip
text:pptp_server_ip:$FORM_pptp_server_ip"
	}
	[ -x /sbin/ifup.pppoe ] && {
		PPPOE_OPTION="radio:wan_proto:$FORM_wan_proto:pppoe:PPPoE<br />:onChange=\"modechange()\""
	}
	
	# pptp, dhcp and static common
	FORM_wan_ipaddr=${wan_ipaddr:-$(nvram get wan_ipaddr)}
	FORM_wan_netmask=${wan_netmask:-$(nvram get wan_netmask)}
	FORM_wan_gateway=${wan_gateway:-$(nvram get wan_gateway)}
	FORM_wan_dns=${wan_dns:-$(nvram get wan_dns)}
	
  	# ppp common
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
	
	FORM_pptp_server_ip=${pptp_server_ip:-$(nvram get pptp_server_ip)}
} || {
	SAVED=1

	[ -z $FORM_wan_proto ] && {
		ERROR="No WAN protocol selected" 
		return -1
	}

	save_setting network wan_proto $FORM_wan_proto
	
	# Settings specific to one protocol type
	case "$FORM_wan_proto" in
		static)
			validate_ip "$FORM_wan_dns" "WAN DNS Server" 1 && \
				save_setting network wan_dns $FORM_wan_dns

			validate_ip "$FORM_wan_gateway" "WAN Gateway" && \
				save_setting network wan_gateway $FORM_wan_gateway

			# Requirements for input validation
			REQ_IP=1
			REQ_NETMASK=1
			;;
		pptp)
			validate_ip "$FORM_pptp_server_ip" "PPTP Server" 1 && \
				save_setting network pptp_server_ip "$FORM_pptp_server_ip"
			;;
	esac
	
	# Common settings for PPTP, Static and DHCP 
	[ "$FORM_wan_proto" = "pptp" -o "$FORM_wan_proto" = "static" -o "$FORM_wan_proto" = "dhcp" ] && {
		validate_ip "$FORM_wan_ipaddr" "WAN IP" $REQ_IP && \
			save_setting network wan_ipaddr $FORM_wan_ipaddr
	
		validate_netmask "$FORM_wan_netmask" "WAN Netmask" $REQ_NETMASK && \
			save_setting network wan_netmask $FORM_wan_netmask 
	}
	
	# Common PPP settings
	[ "$FORM_wan_proto" = "pppoe" -o "$FORM_wan_proto" = "pptp" ] && {
		[ -z $FORM_ppp_username ] || save_setting network ppp_username $FORM_ppp_username
		[ -z $FORM_ppp_passwd ] || save_setting network ppp_passwd $FORM_ppp_passwd

		# These can be blank
		save_setting network ppp_idletime $FORM_ppp_idletime
		save_setting network ppp_redialperiod $FORM_ppp_redialperiod
		save_setting network ppp_mtu $FORM_ppp_mtu

		case "$FORM_ppp_redial" in
			demand)
				save_setting network ppp_demand 1
				;;
			persist)
				save_setting network ppp_demand ""
				;;
		esac	
	}

}

header "Network" "WAN" "WAN settings" ' onLoad="modechange()" '
?>
<script type="text/javascript" src="/webif.js "></script>
<script type="text/javascript">
<!--
function modechange()
{
	var v;
	v = (checked('wan_proto_pppoe') || checked('wan_proto_pptp'));
	set_visible('ppp_username', v);
	set_visible('ppp_passwd', v);
	set_visible('ppp_redial', v);
	set_visible('ppp_mtu', v);
	set_visible('ppp_demand_idletime', v && checked('ppp_redial_demand'));
	set_visible('ppp_persist_redialperiod', v && !checked('ppp_redial_demand'));
	
	v = (checked('wan_proto_static') || checked('wan_proto_pptp') || checked('wan_proto_dhcp'));
	set_visible('wan_ipaddr', v);
	set_visible('wan_netmask', v);
	
	v = checked('wan_proto_static');
	set_visible('wan_gateway', v);
	set_visible('wan_dns', v);
}
-->
</script>
<?if [ "$SAVED" = "1" ] ?>
	<? [ -z "$ERROR" ] || echo "<h2>Errors occured:</h2><h3>$ERROR</h3>" ?>
	<h2>Settings Saved</h2>
	<br />
<?fi?>
<? display_form "start_form:$SCRIPT_NAME
field:Internet Connection Type
radio:wan_proto:$FORM_wan_proto:none:None<br />:onchange=\"modechange()\"
radio:wan_proto:$FORM_wan_proto:dhcp:DHCP<br />:onchange=\"modechange()\"
radio:wan_proto:$FORM_wan_proto:static:Static IP<br />:onchange=\"modechange()\"
$PPPOE_OPTION
$PPTP_OPTION

field:Internet IP Address:wan_ipaddr
text:wan_ipaddr:$FORM_wan_ipaddr
field:Subnet Mask:wan_netmask
text:wan_netmask:$FORM_wan_netmask
field:Gateway:wan_gateway
text:wan_gateway:$FORM_wan_gateway
field:DNS Server(s):wan_dns
text:wan_dns:$FORM_wan_dns
$PPTP_SERVER_OPTION

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

<? footer ?>
<!--
##WEBIF:name:Network:2:WAN
-->
