#!/usr/bin/haserl
<? 
. /usr/lib/webif/webif.sh
header "Info" "Router Info" "Router Info"
?>
<table style="width: 90%; text-align: left;" border="0" cellpadding="2" cellspacing="2" align="center">
<tbody>
	<tr>
		<td>Firmware Version</td>
		<td><? cat /etc/banner | grep "(" | cut -b-20 | cut -b2- ?></td>
	</tr>
	<tr>
		<td>Kernel Version</td>
		<td><? cat /proc/version ?></td>
	</tr>
	<tr>
		<td>Current Date/Time</td>
		<td><? date ?></td>
	</tr>
	<tr>
		<td>MAC-Address</td>
		<td><? ifconfig eth0 | grep HWaddr | cut -b39-  ?></td>
	</tr>
</tbody>
</table>

<? footer ?>
<!--
##WEBIF:name:Info:2:Router Info
-->
