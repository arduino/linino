#!/usr/bin/haserl
<? 
. /usr/lib/webif/webif.sh

[ -f /tmp/.webif/file-hosts ] && HOSTS_FILE=/tmp/.webif/file-hosts || HOSTS_FILE=/etc/hosts
[ -f /tmp/.webif/file-ethers ] && ETHERS_FILE=/tmp/.webif/file-ethers || ETHERS_FILE=/etc/ethers
touch $HOSTS_FILE $ETHERS_FILE >&- 2>&-

update_hosts() {
	mkdir -p /tmp/.webif
	awk -v "mode=$1" -v "ip=$2" -v "name=$3" '
BEGIN {
	FS="[ \t]"
	host_added = 0
}
{ processed = 0 }
(mode == "del") && (ip == $1) {
	names_found = 0
	n = split($0, names, "[ \t]")
	output = $1 "	"
	for (i = 2; i <= n; i++) {
		if ((names[i] != "") && (names[i] != name)) {
			output = output names[i] " "
			names_found++
		}
	}
	if (names_found > 0) print output
	processed = 1
}
(mode == "add") && (ip == $1) {
	print $0 " " name
	host_added = 1
	processed = 1
}
processed == 0 {
	print $0
}
END {
	if ((mode == "add") && (host_added == 0)) print ip "	" name
}' - < "$HOSTS_FILE" > /tmp/.webif/file-hosts-new
	mv "/tmp/.webif/file-hosts-new" "/tmp/.webif/file-hosts"
	HOSTS_FILE=/tmp/.webif/file-hosts
}

update_ethers() {
	mkdir -p /tmp/.webif
	case "$1" in
		add)
			grep -E -v "^[ \t]*$2" $ETHERS_FILE > /tmp/.webif/file-ethers-new
			echo "$2	$3" >> /tmp/.webif/file-ethers-new
			mv /tmp/.webif/file-ethers-new  /tmp/.webif/file-ethers
		;;
		del)
			grep -E -v "^[ \t]*$2" $ETHERS_FILE > /tmp/.webif/file-ethers-new
			mv /tmp/.webif/file-ethers-new  /tmp/.webif/file-ethers
		;;	
	esac
	ETHERS_FILE=/tmp/.webif/file-ethers
}

[ ! -z "$FORM_add_host" ] && {
	# add a host to /etc/hosts
	validate "ip|FORM_host_ip|IP Address|required|$FORM_host_ip
hostname|FORM_host_name|Hostname|required|$FORM_host_name" && update_hosts add "$FORM_host_ip" "$FORM_host_name"
}
[ ! -z "$FORM_add_dhcp" ] && {
	# add a host to /etc/ethers
	validate "mac|FORM_dhcp_mac|MAC Address|required|$FORM_dhcp_mac
ip|FORM_dhcp_ip|IP|required|$FORM_dhcp_ip" && update_ethers add "$FORM_dhcp_mac" "$FORM_dhcp_ip"
}
[ ! -z "$FORM_remove_host" ] && update_hosts del "$FORM_remove_ip" "$FORM_remove_name"
[ ! -z "$FORM_remove_dhcp" ] && update_ethers del "$FORM_remove_mac"

header "Network" "Hosts" "Configured hosts" ''

# Hosts in /etc/hosts
# FIXME: move formatting code in form.awk if possible
awk -v "url=$SCRIPT_NAME" '
BEGIN {
	FS="[ \t]"
	title = "Hostnames"
	'"$AWK_START_FORM"'
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
	print "<tr><td><input type\"text\" name=\"host_ip\" value=\"'"$FORM_host_ip"'\" /></td><td><input type=\"text\" name=\"host_name\" value=\"'"$FORM_host_name"'\" /></td><td style=\"width: 10em\"><input type=\"submit\" name=\"add_host\" value=\"Add\" /></td></tr>"
	print "</form>"
	print "</table>"
	'"$AWK_END_FORM"'
}
' $HOSTS_FILE

# Static DHCP mappings (/etc/ethers)
# FIXME: move formatting code in form.awk if possible
awk -v "url=$SCRIPT_NAME" '
BEGIN {
	FS="[ \t]"
	title = "Static IP addresses (for DHCP)"
	'"$AWK_START_FORM"'
	print "<form enctype=\"multipart/form-data\" method=\"post\">"
	print "<table width=\"70%\" summary=\"Settings\">"
	print "<tr><th>MAC address</th><th>IP</th><th></th></tr>"
}

# only for valid MAC addresses
($1 ~ /^[0-9A-Fa-f][0-9A-Fa-f]:[0-9A-Fa-f][0-9A-Fa-f]:[0-9A-Fa-f][0-9A-Fa-f]:[0-9A-Fa-f][0-9A-Fa-f]:[0-9A-Fa-f][0-9A-Fa-f]:[0-9A-Fa-f][0-9A-Fa-f]$/) {
	gsub(/#.*$/, "");
	print "<tr><td>" $1 "</td><td>" $2 "</td><td align=\"right\" width=\"10%\"><a href=\"" url "?remove_dhcp=1&remove_mac=" $1 "\">Remove</a></td></tr>"
}

END {
	print "<tr><td><input type\"text\" name=\"dhcp_mac\" value=\"'"$FORM_dhcp_mac"'\" /></td><td><input type=\"text\" name=\"dhcp_ip\" value=\"'"$FORM_dhcp_ip"'\" /></td><td style=\"width: 10em\"><input type=\"submit\" name=\"add_dhcp\" value=\"Add\" /></td></tr>"
	print "</table>"
	print "</form>"
	'"$AWK_END_FORM"'
}
' - < $ETHERS_FILE

footer ?>
<!--
##WEBIF:name:Network:4:Hosts
-->
