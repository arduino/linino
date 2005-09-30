#!/usr/bin/haserl
<? 
. /usr/lib/webif/webif.sh

load_settings network

FORM_dns="${wan_dns:-$(nvram get wan_dns)}"
LISTVAL="$FORM_dns"
handle_list "$FORM_dnsremove" "$FORM_dnsadd" "$FORM_dnssubmit" 'ip|FORM_dnsadd|WAN DNS address|required' && {
	FORM_dns="$LISTVAL"
	save_setting network wan_dns "$FORM_dns"
}
FORM_dnsadd=${FORM_dnsadd:-192.168.1.1}


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
		PPTP_OPTION="radio|wan_proto|$FORM_wan_proto|pptp|PPTP<br />|onChange=\"modechange()\""
		PPTP_SERVER_OPTION="field|PPTP Server IP|pptp_server_ip|hidden
text|pptp_server_ip|$FORM_pptp_server_ip"
	}
	[ -x /sbin/ifup.pppoe ] && {
		PPPOE_OPTION="radio|wan_proto|$FORM_wan_proto|pppoe|PPPoE<br />|onChange=\"modechange()\""
	}
	
	# pptp, dhcp and static common
	FORM_wan_ipaddr=${wan_ipaddr:-$(nvram get wan_ipaddr)}
	FORM_wan_netmask=${wan_netmask:-$(nvram get wan_netmask)}
	FORM_wan_gateway=${wan_gateway:-$(nvram get wan_gateway)}
	
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

	case "$FORM_wan_proto" in
		static)
			V_IP="required"
			V_NM="required"
			;;
		pptp)
			V_PPTP="required"
			;;
	esac

	# FIXME: add validation for DNS server list
	validate "
ip|FORM_wan_ipaddr|IP address|$V_IP|$FORM_wan_ipaddr
netmask|FORM_wan_netmask|network mask|$V_NM|$FORM_wan_netmask
ip|FORM_wan_gateway|gateway address||$FORM_wan_gateway
ip|FORM_pptp_server_ip|PPTP server IP|$V_PPTP|$FORM_pptp_server_ip" && {
		save_setting network wan_proto $FORM_wan_proto
		
		# Settings specific to one protocol type
		case "$FORM_wan_proto" in
			static)
				save_setting network wan_gateway $FORM_wan_gateway
				;;
			pptp)
				save_setting network pptp_server_ip "$FORM_pptp_server_ip"
				;;
		esac
		
		# Common settings for PPTP, Static and DHCP 
		[ "$FORM_wan_proto" = "pptp" -o "$FORM_wan_proto" = "static" -o "$FORM_wan_proto" = "dhcp" ] && {
			save_setting network wan_ipaddr $FORM_wan_ipaddr
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
}

header "Network" "WAN" "WAN settings" ' onLoad="modechange()" ' "$SCRIPT_NAME"
?>
<script type="text/javascript" src="/webif.js "></script>
<script type="text/javascript">
<!--
function modechange()
{
	var v;
	v = (checked('wan_proto_pppoe') || checked('wan_proto_pptp'));
	set_visible('ppp_settings', v);
	set_visible('ppp_username', v);
	set_visible('ppp_passwd', v);
	set_visible('ppp_redial', v);
	set_visible('ppp_mtu', v);
	set_visible('ppp_demand_idletime', v && checked('ppp_redial_demand'));
	set_visible('ppp_persist_redialperiod', v && !checked('ppp_redial_demand'));
	
	v = (checked('wan_proto_static') || checked('wan_proto_pptp') || checked('wan_proto_dhcp'));
	set_visible('ip_settings', v);
	set_visible('wan_ipaddr', v);
	set_visible('wan_netmask', v);
	
	v = checked('wan_proto_static');
	set_visible('wan_gateway', v);
	set_visible('wan_dns', v);
}
-->
</script>
<? display_form "start_form|WAN Configuration
field|Internet Connection Type
radio|wan_proto|$FORM_wan_proto|none|None<br />|onchange=\"modechange()\"
radio|wan_proto|$FORM_wan_proto|dhcp|DHCP<br />|onchange=\"modechange()\"
radio|wan_proto|$FORM_wan_proto|static|Static IP<br />|onchange=\"modechange()\"
$PPPOE_OPTION
$PPTP_OPTION
end_form

start_form|IP Settings|ip_settings|hidden
field|Internet IP Address|wan_ipaddr|hidden
text|wan_ipaddr|$FORM_wan_ipaddr
field|Subnet Mask|wan_netmask|hidden
text|wan_netmask|$FORM_wan_netmask
field|Gateway|wan_gateway|hidden
text|wan_gateway|$FORM_wan_gateway
$PPTP_SERVER_OPTION
end_form

start_form|DNS Servers|wan_dns|hidden
listedit|dns|$SCRIPT_NAME?wan_proto=static&|$FORM_dns|$FORM_dnsadd
helpitem|Note
helptext|You should save your settings on this page before adding/removing DNS servers
end_form

start_form|PPP Settings|ppp_settings|hidden
field|PPP Redial Policy|ppp_redial|hidden
radio|ppp_redial|$FORM_ppp_redial|demand|Connect on Demand<br />|onChange=\"modechange()\"
radio|ppp_redial|$FORM_ppp_redial|persist|Keep Alive|onChange=\"modechange()\"
field|Maximum Idle Time|ppp_demand_idletime|hidden
text|ppp_idletime|$FORM_ppp_idletime
field|Redial Timeout|ppp_persist_redialperiod|hidden
text|ppp_redialperiod|$FORM_ppp_redialperiod
field|PPP Username|ppp_username|hidden
text|ppp_username|$FORM_ppp_username
field|PPP Password|ppp_passwd|hidden
text|ppp_passwd|$FORM_ppp_passwd
field|PPP MTU|ppp_mtu|hidden
text|ppp_mtu|$FORM_ppp_mtu
end_form" 

footer ?>
<!--
##WEBIF:name:Network:2:WAN
-->
