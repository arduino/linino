#!/usr/bin/haserl
<? 
. /usr/lib/webif/webif.sh
header "Info" "Router Info" "Router Info"

?>
<pre><?
_version=$( grep "(" /etc/banner )
_version="${_version%% ---*}"
_kversion="$( cat /proc/version )"
_date="$(date)"
_mac="$(/sbin/ifconfig eth0 | grep HWaddr | cut -b39-)"
sed -e 's/&/&amp;/g' < /etc/banner
cat <<EOF
</pre>
<br />
<br />
<table style="width: 90%; text-align: left;" border="0" cellpadding="2" cellspacing="2" align="center">
<tbody>
	<tr>
		<td>Firmware Version</td>
		<td>$_version</td>
	</tr>
	<tr>
		<td>Kernel Version</td>
		<td>$_kversion</td>
	</tr>
	<tr>
		<td>Current Date/Time</td>
		<td>$_date</td>
	</tr>
	<tr>
		<td>MAC-Address</td>
		<td>$_mac</td>
	</tr>
</tbody>
</table>
EOF

footer
?>
<!--
##WEBIF:name:Info:2:Router Info
-->
