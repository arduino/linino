#!/usr/bin/haserl
<? 
. /usr/lib/webif/webif.sh
load_settings network

[ -z $FORM_submit ] && {
	FORM_lan_ipaddr=${lan_ipaddr:-$(nvram get lan_ipaddr)}
	FORM_lan_netmask=${lan_netmask:-$(nvram get lan_netmask)}
	FORM_lan_gateway=${lan_gateway:-$(nvram get lan_gateway)}
	FORM_lan_dns=${lan_dns:-$(nvram get lan_dns)}
} || {
	SAVED=1
	validate "
ip|FORM_lan_ipaddr|LAN IP|required|$FORM_lan_ipaddr
netmask|FORM_lan_netmask|LAN network mask|required|$FORM_lan_netmask
ip|FORM_lan_gateway|LAN gateway||$FORM_lan_gateway" && {
		save_setting network lan_ipaddr $FORM_lan_ipaddr
		save_setting network lan_netmask $FORM_lan_netmask
		save_setting network lan_gateway $FORM_lan_gateway
		save_setting network lan_dns $FORM_lan_dns
	}
}

header "Network" "LAN" "LAN settings" '' "$SCRIPT_NAME"

display_form "start_form|LAN Configuration
field|IP Address
text|lan_ipaddr|$FORM_lan_ipaddr
field|Netmask
text|lan_netmask|$FORM_lan_netmask
field|Default Gateway
text|lan_gateway|$FORM_lan_gateway
field|DNS Server
text|lan_dns|$FORM_lan_dns
end_form" 

footer ?>
<!--
##WEBIF:name:Network:1:LAN
-->
