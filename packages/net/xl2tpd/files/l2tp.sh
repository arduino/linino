find_route() {
	ip route get $1 | sed -e 's/ /\n/g' | \
            sed -ne '1p;/via/{N;p};/dev/{N;p};/src/{N;p};/mtu/{N;p}'
}

scan_l2tp() {
	config_set "$1" device "l2tp-$1"
}

stop_interface_l2tp() {
	local config="$1"
	local lock="/var/lock/l2tp-${config}"
	local optfile="/tmp/l2tp/options.${config}"
	local l2tpcontrol=/var/run/xl2tpd/l2tp-control

	lock "$lock"

	[ -p ${l2tpcontrol} ] && echo "r l2tp-${config}" > ${l2tpcontrol}
	rm -f ${optfile}

	for ip in $(uci_get_state network "$1" serv_addrs); do
	    ip route del "$ip" 2>/dev/null
	done

	lock -u "$lock"
}

setup_interface_l2tp() {
	local config="$2"
	local lock="/var/lock/l2tp-${config}"
	local optfile="/tmp/l2tp/options.${config}"

	lock "$lock"

	if [ ! -p /var/run/xl2tpd/l2tp-control ]; then
	    /etc/init.d/xl2tpd start
	fi
	
	local device
	config_get device "$config" device "l2tp-$config"

	local server
	config_get server "$config" server

	local username
	config_get username "$config" username

	local password
	config_get password "$config" password

	local keepalive
	config_get keepalive "$config" keepalive

	local pppd_options
	config_get pppd_options "$config" pppd_options

	local defaultroute
	config_get_bool defaultroute "$config" defaultroute 1
	[ "$defaultroute" -eq 1 ] && \
		defaultroute="defaultroute replacedefaultroute" || defaultroute="nodefaultroute"

	local interval="${keepalive##*[, ]}"
	[ "$interval" != "$keepalive" ] || interval=5

	local dns
	config_get dns "$config" dns

	local has_dns=0
	local peer_default=1
	[ -n "$dns" ] && {
		has_dns=1
		peer_default=0
	}

	local peerdns
	config_get_bool peerdns "$config" peerdns $peer_default

	[ "$peerdns" -eq 1 ] && {
		peerdns="usepeerdns"
	} || {
		peerdns=""
		add_dns "$config" $dns
	}

	local ipv6
	config_get ipv6 "$config" ipv6 1
	[ "$ipv6" -eq 1 ] && ipv6="+ipv6" || ipv6=""

	local serv_addrs=""
	for ip in $(resolveip -t 3 "$server"); do
		append serv_addrs "$ip"
		ip route replace $(find_route $ip)
	done
	uci_toggle_state network "$config" serv_addrs "$serv_addrs"

	# fix up the netmask
	config_get netmask "$config" netmask
	[ -z "$netmask" -o -z "$device" ] || ifconfig $device netmask $netmask

	config_get mtu "$config" mtu

	mkdir -p /tmp/l2tp

	echo ${keepalive:+lcp-echo-interval $interval lcp-echo-failure ${keepalive%%[, ]*}} > "${optfile}"
	echo "$peerdns" >> "${optfile}"
	echo "$defaultroute" >> "${optfile}"
	echo "${username:+user \"$username\" password \"$password\"}" >> "${optfile}"
	echo "ipparam \"$config\"" >> "${optfile}"
	echo "ifname \"l2tp-$config\"" >> "${optfile}"
	# Don't wait for LCP term responses; exit immediately when killed.
	echo "lcp-max-terminate 0" >> "${optfile}"
	echo "${ipv6} ${pppd_options}" >> "${optfile}"

	xl2tpd-control remove l2tp-${config}
	# Wait and ensure pppd has died.
	while [ -d /sys/class/net/l2tp-${config} ]; do
	    sleep 1
	done
	
	xl2tpd-control add l2tp-${config} pppoptfile=${optfile} lns=${server} redial=yes redial timeout=20
	xl2tpd-control connect l2tp-${config}

	lock -u "${lock}"
}
