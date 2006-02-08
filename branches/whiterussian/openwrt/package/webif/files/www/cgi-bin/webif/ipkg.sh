#!/usr/bin/webif-page
<? 
. /usr/lib/webif/webif.sh
header "System" "Installed Software" "@TR<<Installed Software>>"
?>
<p style="position: absolute; right: 1em; top: 10.5em"><a href="ipkg.sh?action=update">@TR<<Update package lists>></a></p>
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
  <h3>@TR<<Installed Packages>></h3>
  <table style="width: 90%">
<?
ipkg list_installed | awk -F ' ' '
$2 !~ /terminated/ {
	link=$1
	gsub(/\+/,"%2B",link)
	print "<tr><td>" $1 "</td><td><a href=\"ipkg.sh?action=remove&pkg=" link "\">@TR<<Uninstall>></td></tr>"
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
	print "<tr><td>" $3 "</td><td><a href=\"ipkg.sh?action=install&pkg=" link "\">@TR<<Install>></td></tr>"
	current=$1
}
'
?>
  </table>
</div>

<div class="rowOfBoxes"></div>
	  
<? footer ?>
<!--
##WEBIF:name:System:3:Installed Software
-->
