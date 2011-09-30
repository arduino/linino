setup_interface_ahcp() {
	local interface="$1"
	local config="$2"

	local mode=$(uci_get_state ahcpd "@ahcpd[0]" mode "client")
	if [ "$mode" != "client" ]; then
		echo "Warning: ahcp ignored for $interface (mode is $mode, should be client)."
		echo "Fix ahcp mode in /etc/config/ahcpd."
		return
	fi
	setup_interface_none "$interface" "$config"
	/etc/init.d/ahcpd restart
}
