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

empty "$FORM_add_host" || {
	# add a host to /etc/hosts
	validate "ip|FORM_host_ip|IP Address|required|$FORM_host_ip
hostname|FORM_host_name|Hostname|required|$FORM_host_name" && update_hosts add "$FORM_host_ip" "$FORM_host_name"
}
empty "$FORM_add_dhcp" || {
	# add a host to /etc/ethers
	validate "mac|FORM_dhcp_mac|MAC Address|required|$FORM_dhcp_mac
ip|FORM_dhcp_ip|IP|required|$FORM_dhcp_ip" && update_ethers add "$FORM_dhcp_mac" "$FORM_dhcp_ip"
}
empty "$FORM_remove_host" || update_hosts del "$FORM_remove_ip" "$FORM_remove_name"
empty "$FORM_remove_dhcp" || update_ethers del "$FORM_remove_mac"

header "Network" "Hosts" "Configured hosts" ''

# Hosts in /etc/hosts
awk -v "url=$SCRIPT_NAME" \
	-v "ip=$FORM_host_ip" \
	-v "name=$FORM_host_name"  -f /usr/lib/webif/common.awk -f /usr/lib/webif/display-hosts.awk $HOSTS_FILE

# Static DHCP mappings (/etc/ethers)
awk -v "url=$SCRIPT_NAME" \
	-v "mac=$FORM_dhcp_mac" \
	-v "ip=$FORM_dhcp_ip" -f /usr/lib/webif/common.awk -f /usr/lib/webif/display-dhcp.awk $ETHERS_FILE

footer ?>
<!--
##WEBIF:name:Network:4:Hosts
-->
