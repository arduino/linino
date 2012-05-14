find_gw() {
	route -n | awk '$1 == "0.0.0.0" { print $2; exit }'
}

scan_openconnect() {
	config_set "$1" device "vpn-$1"
}

stop_interface_openconnect() {
	local config="$1"
	local lock="/var/lock/openconnect-$config"

        uci_set_state network "$config" up 0

	lock "$lock"

	SERVICE_PID_FILE="/var/run/openconnect-${config}.pid" \
	  SERVICE_SIG=HUP service_stop /bin/sh

	remove_dns "$config"

	lock -u "$lock"
}

setup_interface_openconnect() {
	local config="$2"

	/sbin/insmod tun 2>&- >&-

	# creating the tunnel below will trigger a net subsystem event
        # prevent it from touching or iface by disabling .auto here
        uci_set_state network "$config" ifname "vpn-$config"
        uci_set_state network "$config" auto 0
        uci_set_state network "$config" up 1

	SERVICE_PID_FILE="/var/run/openconnect-${config}.pid" \
          SERVICE_WRITE_PID=1  SERVICE_DAEMONIZE=1 \
        service_start /usr/sbin/run-openconnect $config
}
