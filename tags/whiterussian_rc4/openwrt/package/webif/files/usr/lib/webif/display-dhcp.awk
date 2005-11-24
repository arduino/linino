BEGIN {
	FS="[ \t]"
	print "<form enctype=\"multipart/form-data\" method=\"post\">"
	start_form("Static IP addresses (for DHCP)")
	print "<table width=\"70%\" summary=\"Settings\">"
	print "<tr><th>MAC address</th><th>IP</th><th></th></tr>"
}

# only for valid MAC addresses
($1 ~ /^[0-9A-Fa-f][0-9A-Fa-f]:[0-9A-Fa-f][0-9A-Fa-f]:[0-9A-Fa-f][0-9A-Fa-f]:[0-9A-Fa-f][0-9A-Fa-f]:[0-9A-Fa-f][0-9A-Fa-f]:[0-9A-Fa-f][0-9A-Fa-f]$/) {
	gsub(/#.*$/, "");
	print "<tr><td>" $1 "</td><td>" $2 "</td><td align=\"right\" width=\"10%\"><a href=\"" url "?remove_dhcp=1&remove_mac=" $1 "\">Remove</a></td></tr>"
}

END {
	print "<tr><td><input type\"text\" name=\"dhcp_mac\" value=\"" mac "\" /></td><td><input type=\"text\" name=\"dhcp_ip\" value=\"" ip "\" /></td><td style=\"width: 10em\"><input type=\"submit\" name=\"add_dhcp\" value=\"Add\" /></td></tr>"
	print "</table>"
	print "</form>"
	end_form();
}

