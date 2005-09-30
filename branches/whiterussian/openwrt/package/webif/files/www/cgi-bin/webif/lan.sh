#!/usr/bin/haserl
<? 
. /usr/lib/webif/webif.sh
load_settings network

FORM_dns="${lan_dns:-$(nvram get lan_dns)}"
LISTVAL="$FORM_dns"
handle_list "$FORM_dnsremove" "$FORM_dnsadd" "$FORM_dnssubmit" 'ip|FORM_dnsadd|LAN DNS address|required' && {
	FORM_dns="$LISTVAL"
	save_setting network lan_dns "$FORM_dns"
}
FORM_dnsadd=${FORM_dnsadd:-192.168.1.1}


if [ -z "$FORM_submit" -o \! -z "$ERROR" ]; then
	FORM_lan_ipaddr=${lan_ipaddr:-$(nvram get lan_ipaddr)}
	FORM_lan_netmask=${lan_netmask:-$(nvram get lan_netmask)}
	FORM_lan_gateway=${lan_gateway:-$(nvram get lan_gateway)}
else
	SAVED=1
	validate "
ip|FORM_lan_ipaddr|LAN IP|required|$FORM_lan_ipaddr
netmask|FORM_lan_netmask|LAN network mask|required|$FORM_lan_netmask
ip|FORM_lan_gateway|LAN gateway||$FORM_lan_gateway" && {
		save_setting network lan_ipaddr $FORM_lan_ipaddr
		save_setting network lan_netmask $FORM_lan_netmask
		save_setting network lan_gateway $FORM_lan_gateway
	}
fi

header "Network" "LAN" "LAN settings" '' "$SCRIPT_NAME"

display_form "start_form|LAN Configuration
field|IP Address
text|lan_ipaddr|$FORM_lan_ipaddr
field|Netmask
text|lan_netmask|$FORM_lan_netmask
field|Default Gateway
text|lan_gateway|$FORM_lan_gateway
end_form
start_form|DNS Servers
listedit|dns|$SCRIPT_NAME?|$FORM_dns|$FORM_dnsadd
helpitem|Note
helptext|You should save your settings on this page before adding/removing DNS servers
end_form" 

footer ?>
<!--
##WEBIF:name:Network:1:LAN
-->
