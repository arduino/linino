BEGIN {
	FS="[ \t]"
	start_form("Hostnames")
	print "<table width=\"70%\" summary=\"Settings\">"
	print "<tr><th>IP</th><th>Hostname</th><th></th></tr>"
	print "<tr><td colspan=\"3\"><hr class=\"separator\" /></td></tr>"
}

# only for valid IPv4 addresses
($1 ~ /^[0-9][0-9]*\.[0-9][0-9]*\.[0-9][0-9]*\.[0-9][0-9]*$/) {
	gsub(/#.*$/, "");
	output = ""
	names_found = 0
	n = split($0, names, "[ \t]")
	first = 1
	for (i = 2; i <= n; i++) {
		if (names[i] != "") {
			if (first != 1) output = output "<tr>"
			output = output "<td>" names[i] "</td><td align=\"right\" width=\"10%\"><a href=\"" url "?remove_host=1&remove_ip=" $1 "&remove_name=" names[i] "\">Remove</a></td></tr>"
			first = 0
			names_found++
		}
	}
	if (names_found > 0) {
		print "<tr><td rowspan=\"" names_found "\">" $1 "</td>" output
		print "<tr><td colspan=\"3\"><hr class=\"separator\" /></td></tr>"
	}
}

END {
	print "<form enctype=\"multipart/form-data\" method=\"post\">"
	print "<tr><td><input type\"text\" name=\"host_ip\" value=\"" ip "\" /></td><td><input type=\"text\" name=\"host_name\" value=\"" name "\" /></td><td style=\"width: 10em\"><input type=\"submit\" name=\"add_host\" value=\"Add\" /></td></tr>"
	print "</form>"
	print "</table>"
	end_form()
}

