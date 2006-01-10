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

if empty "$FORM_submit"; then
	FORM_wan_proto=${wan_proto:-$(nvram get wan_proto)}
	case "$FORM_wan_proto" in
		# supported types
		static|dhcp|pptp|pppoe) ;;
		# otherwise select "none"
		*) FORM_wan_proto="none";;
	esac
	
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
		1|enabled|on) FORM_ppp_redial="demand";;	
		*) FORM_ppp_redial="persist";;	
	esac
	
	FORM_pptp_server_ip=${pptp_server_ip:-$(nvram get pptp_server_ip)}
else
	SAVED=1

	empty "$FORM_wan_proto" && {
		ERROR="No WAN protocol selected" 
		return 255
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

validate <<EOF
ip|FORM_wan_ipaddr|IP address|$V_IP|$FORM_wan_ipaddr
netmask|FORM_wan_netmask|network mask|$V_NM|$FORM_wan_netmask
ip|FORM_wan_gateway|gateway address||$FORM_wan_gateway
ip|FORM_pptp_server_ip|PPTP server IP|$V_PPTP|$FORM_pptp_server_ip
EOF
	equal "$?" 0 && {
		save_setting network wan_proto $FORM_wan_proto
		
		# Settings specific to one protocol type
		case "$FORM_wan_proto" in
			static) save_setting network wan_gateway $FORM_wan_gateway ;;
			pptp) save_setting network pptp_server_ip "$FORM_pptp_server_ip" ;;
		esac
		
		# Common settings for PPTP, Static and DHCP 
		case "$FORM_wan_proto" in
			pptp|static|dhcp)
				save_setting network wan_ipaddr $FORM_wan_ipaddr
				save_setting network wan_netmask $FORM_wan_netmask 
			;;
		esac
		
		# Common PPP settings
		case "$FORM_wan_proto" in
			pppoe|pptp)
				empty "$FORM_ppp_username" || save_setting network ppp_username $FORM_ppp_username
				empty "$FORM_ppp_passwd" || save_setting network ppp_passwd $FORM_ppp_passwd
		
				# These can be blank
				save_setting network ppp_idletime "$FORM_ppp_idletime"
				save_setting network ppp_redialperiod "$FORM_ppp_redialperiod"
				save_setting network ppp_mtu "$FORM_ppp_mtu"

				save_setting network wan_ifname "ppp0"
				save_setting network pptp_ifname "vlan1"
				save_setting network pppoe_ifname "vlan1"
		
				case "$FORM_ppp_redial" in
					demand)
						save_setting network ppp_demand 1
						;;
					persist)
						save_setting network ppp_demand ""
						;;
				esac	
			;;
			*)
				save_setting network wan_ifname "vlan1"
			;;
		esac
	}
fi

# detect pptp package and compile option
[ -x /sbin/ifup.pptp ] && {
	PPTP_OPTION="radio|wan_proto|$FORM_wan_proto|pptp|PPTP<br />"
	PPTP_SERVER_OPTION="field|PPTP Server IP|pptp_server_ip|hidden
text|pptp_server_ip|$FORM_pptp_server_ip"
}
[ -x /sbin/ifup.pppoe ] && {
	PPPOE_OPTION="radio|wan_proto|$FORM_wan_proto|pppoe|PPPoE<br />"
}


header "Network" "WAN" "WAN settings" ' onLoad="modechange()" ' "$SCRIPT_NAME"

cat <<EOF
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

	v = checked('wan_proto_pptp');
	set_visible('pptp_server_ip',v);
}
-->
</script>
EOF

display_form <<EOF
onchange|modechange
start_form|WAN Configuration
field|Internet Connection Type
radio|wan_proto|$FORM_wan_proto|none|None<br />
radio|wan_proto|$FORM_wan_proto|dhcp|DHCP<br />
radio|wan_proto|$FORM_wan_proto|static|Static IP<br />
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
radio|ppp_redial|$FORM_ppp_redial|demand|Connect on Demand<br />
radio|ppp_redial|$FORM_ppp_redial|persist|Keep Alive
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
end_form
EOF

footer ?>
<!--
##WEBIF:name:Network:2:WAN
-->
