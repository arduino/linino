#!/usr/bin/haserl
<? 
. /usr/lib/webif/webif.sh
header "System" "Installed software" "Installed software"
?>
<p style="position: absolute; right: 1em; top: 10.5em"><a href="ipkg.sh?action=update">Update package lists</a></p>
<pre><?
if [ "$FORM_action" = "update" ]; then
	ipkg update
elif [ "$FORM_action" = "install" ]; then
	yes n | ipkg install `echo "$FORM_pkg" | sed -e 's, ,+,g'`
elif [ "$FORM_action" = "remove" ]; then
	ipkg remove `echo "$FORM_pkg" | sed -e 's, ,+,g'`
fi
?></pre>
<div class="half noBorderOnLeft">
  <h3>Installed packages</h3>
  <table style="width: 90%">
<?
ipkg list_installed | awk -F ' ' '
$2 !~ /terminated/ {
	link=$1
	gsub(/\+/,"%2B",link)
	print "<tr><td>" $1 "</td><td><a href=\"ipkg.sh?action=remove&pkg=" link "\">Remove</td></tr>"
}
'
?>
  </table>
</div>
<div class="half noBorderOnLeft">
  <h3>Available packages</h3>
  <table style="width: 90%">
<?
grep Package: /usr/lib/ipkg/status /usr/lib/ipkg/lists/* 2>&- | sed -e 's, ,,' -e 's,/usr/lib/ipkg/lists/,,' | awk -F: '
$1 ~ /status/ {
	installed[$3]++;
}
($1 !~ /terminated/) && ($1 !~ /\/status/) && (!installed[$3]) {
	if (current != $1) print "<tr><th>" $1 "</th><td></td></tr>"
	link=$3
	gsub(/\+/,"%2B",link)
	print "<tr><td>" $3 "</td><td><a href=\"ipkg.sh?action=install&pkg=" link "\">Install</td></tr>"
	current=$1
}
'
?>
  </table>
</div>

<div class="rowOfBoxes"></div>
	  
<? footer ?>
<!--
##WEBIF:name:System:2:Installed software
-->
