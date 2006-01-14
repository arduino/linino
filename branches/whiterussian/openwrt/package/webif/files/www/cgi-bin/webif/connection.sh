#!/usr/bin/haserl
<? 
. /usr/lib/webif/webif.sh
header "Status" "Connections" "Connection status"
?>
<table style="width: 90%; text-align: left;" border="0" cellpadding="2" cellspacing="2" align="center">
<tbody>
	<tr>
		<th><b>Ethernet/Wireless physical connections</b></th>
	</tr>
	<tr>
		<td><pre><? cat /proc/net/arp ?></pre></td>
	</tr>
	
	<tr><td><br /><br /></td></tr>

	<tr>
		<th><b>Connections to the router</b></th>
	</tr>
	<tr>
		<td><pre><? netstat -n 2>&- ?></pre></td>
	</tr>
</tbody>
</table>

<? footer ?>
<!--
##WEBIF:name:Status:1:Connections
-->
