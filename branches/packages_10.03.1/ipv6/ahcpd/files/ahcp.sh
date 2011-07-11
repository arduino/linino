append_bool() {
	local section="$1"
	local option="$2"
	local value="$3"
	local _loctmp
	config_get_bool _loctmp "$section" "$option" 0
	[ "$_loctmp" -gt 0 ] && append args "$value"
}

append_parm() {
	local section="$1"
	local option="$2"
	local switch="$3"
	local _loctmp
	config_get _loctmp "$section" "$option"
	[ -z "$_loctmp" ] && return 0
	append args "$switch $_loctmp"
}

append_stmt() {
	local name="$1"
	local switch="$2"
	append args "-C '$switch $name'"
}

append_opt_stmt() {
	local section="$1"
	local option="$2"
	local switch="$3"
	local _loctmp
	config_get _loctmp "$section" "$option"
	[ -z "$_loctmp" ] && return 0
	append args "-C '$switch $_loctmp'"
}

ahcp_addif() {
	local ifname=$(uci_get_state network "$1" ifname "$1")
	append interfaces "$ifname"
}

ahcp_server() {
	local cfg="$1"

	append_opt_stmt "$cfg" 'mode' 'mode'
	append_opt_stmt "$cfg" 'lease_dir' 'lease-dir'
	config_list_foreach "$cfg" 'prefix' append_stmt 'prefix'
	config_list_foreach "$cfg" 'name_server' append_stmt 'name-server'
	config_list_foreach "$cfg" 'ntp_server' append_stmt 'ntp-server'

	append_parm "$cfg" 'id_file' '-i'
	append_parm "$cfg" 'log_file' '-L'
}

ahcp_config() {
	local cfg="$1"

	config_list_foreach "$cfg" 'interface' ahcp_addif

	append_bool "$cfg" 'ipv4_only' '-4'
	append_bool "$cfg" 'ipv6_only' '-6'
	append_bool "$cfg" 'no_dns' '-N'

	append_parm "$cfg" 'multicast_address' '-m'
	append_parm "$cfg" 'port' '-p'
	append_parm "$cfg" 'lease_time' '-t'
	append_parm "$cfg" 'debug' '-d'
	append_parm "$cfg" 'conf_file' '-c'
	append_parm "$cfg" 'script' '-s'
}

setup_interface_ahcp() {
	local interface="$1"
	local config="$2"
	local pid_file="/var/run/ahcpd-$interface.pid"
	local id_file="/var/lib/ahcp-unique-id-$interface"
	local log_file="/var/log/ahcpd-$interface.log"
	unset args

	mkdir -p /var/lib

	ahcp_config "$config"
	eval "/usr/sbin/ahcpd -D -I $pid_file -i $id_file -L $log_file $args $interface"
}

stop_interface_ahcp() {
	local cfg="$1"
	local interface
	config_get interface "$cfg" device
	local pid_file="/var/run/ahcpd-$interface.pid"
	[ -f "$pid_file" ] && kill $(cat "$pid_file")
}
