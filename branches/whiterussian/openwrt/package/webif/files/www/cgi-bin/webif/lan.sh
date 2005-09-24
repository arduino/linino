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
	validate_ip "$FORM_lan_ipaddr" "LAN IP" 1 && save_setting network lan_ipaddr $FORM_lan_ipaddr
	validate_ip "$FORM_lan_netmask" "LAN Netmask" 1 && save_setting network lan_netmask $FORM_lan_netmask
	validate_ip "$FORM_lan_gateway" "LAN Gateway" && save_setting network lan_gateway $FORM_lan_gateway
	validate_ips "$FORM_lan_dns" "LAN DNS Servers" && save_setting network lan_dns $FORM_lan_dns
}
header "Network" "LAN" "LAN settings"
?>
<?if [ "$SAVED" = "1" ] ?>
	<? [ -z "$ERROR" ] || echo "<h2>Errors occured:</h2><h3>$ERROR</h3>" ?>
	<h2>Settings saved</h2>
	<br />
<?fi?>
<? display_form "start_form:$SCRIPT_NAME
field:IP Address
text:lan_ipaddr:$FORM_lan_ipaddr
field:Netmask
text:lan_netmask:$FORM_lan_netmask
field:Default Gateway
text:lan_gateway:$FORM_lan_gateway
field:DNS Server
text:lan_dns:$FORM_lan_dns
field
submit:action:Save settings
end_form" ?>

<? footer ?>
<!--
##WEBIF:name:Network:1:LAN
-->
