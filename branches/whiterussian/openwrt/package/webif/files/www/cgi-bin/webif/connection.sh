#!/usr/bin/haserl
<? 
. /usr/lib/webif/webif.sh
header "Status" "Connections" "Connection status"
?>
<table style="width: 90%; text-align: left;" border="0" cellpadding="2" cellspacing="2" align="center">
<tbody>
	<tr>
		<td><b>Ethernet/Wireless physical connections</b></td>
		<tbody>
			<tr>
				<td><pre><? cat /proc/net/arp | head -1 ?></pre></td>
			</tr>
			<tr>
				<td><pre><? cat /proc/net/arp | grep -v IP ?></pre></td>
			</tr>
		</tbody>
	</tr>
	<tr>
		<td><br /><br /></td>
	</tr>
	<tr>
		<td><b>Connections to the router</b></td>
		<tbody>
			<tr>
				<td><pre><? netstat -n ?></pre></td>
			</tr>
		</tbody>
	</tr>
</tbody>

<? footer ?>
<!--
##WEBIF:name:Status:1:Connections
-->
