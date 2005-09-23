#!/usr/bin/haserl
<? 
. /usr/lib/webif/webif.sh
header "Status" "Wireless" "Wireless status"
?>

<pre><? iwconfig 2>&1 | grep -v 'no wireless' | grep '\w' ?></pre>

<? footer ?>
<!--
##WEBIF:name:Status:2:Wireless
-->
