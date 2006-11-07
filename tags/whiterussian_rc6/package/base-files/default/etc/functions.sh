#!/bin/sh
# Copyright (C) 2006 OpenWrt.org
# Copyright (C) 2006 Fokus Fraunhofer <carsten.tittel@fokus.fraunhofer.de>

# newline
N="
"

_C=0

alias debug=${DEBUG:-:}

# valid interface?
if_valid () (
  ifconfig "$1" >&- 2>&- ||
  [ "${1%%[0-9]}" = "br" ] ||
  {
    [ "${1%%[0-9]*}" = "vlan" ] && ( 
      i=${1#vlan}
      hwname=$(nvram get vlan${i}hwname)
      hwaddr=$(nvram get ${hwname}macaddr)
      [ -z "$hwaddr" ] && return 1

      vif=$(ifconfig -a | awk '/^eth.*'$hwaddr'/ {print $1; exit}' IGNORECASE=1)
      debug "# vlan$i => $vif"

      $DEBUG ifconfig $vif up
      $DEBUG vconfig add $vif $i 2>&-
    )
  } ||
  { debug "# missing interface '$1' ignored"; false; }
)

do_ifup() {
	if_proto=$(nvram get ${2}_proto)
	if=$(nvram get ${2}_ifname)
	[ "${if%%[0-9]}" = "ppp" ] && if=$(nvram get ${2}_device)
	
	pidfile=/var/run/${if}.pid
	[ -f $pidfile ] && $DEBUG kill $(cat $pidfile)

	case "$1" in
	static)
		ip=$(nvram get ${2}_ipaddr)
		netmask=$(nvram get ${2}_netmask)
		gateway=$(nvram get ${2}_gateway)
		mtu=$(nvram get ${2}_mtu)
		static_route=$(nvram get ${2}_static_route)

		$DEBUG ifconfig $if $ip ${netmask:+netmask $netmask} ${mtu:+mtu $(($mtu))} broadcast + up
		${gateway:+$DEBUG route add default gw $gateway}

		[ -n "$static_route" ] && {
			for route in $static_route; do {
			eval "set $(echo $route | sed 's/:/ /g')"
				if [ "$2" = "255.255.255.255" ]; then
					opt="-host"
				fi
				$DEBUG route add ${opt:-"-net"} $1 netmask $2 gw $3 metric $4 
			} done
		}

		[ -f /tmp/resolv.conf.auto ] || {
			debug "# --- creating /tmp/resolv.conf.auto ---"
			for dns in $(nvram get ${2}_dns); do
				echo "nameserver $dns" >> /tmp/resolv.conf.auto
			done
		}
		
		env -i ACTION="ifup" INTERFACE="${2}" PROTO=static /sbin/hotplug "iface" &
	;;
	dhcp*)
		DHCP_IP=$(nvram get ${2}_ipaddr)
		DHCP_NETMASK=$(nvram get ${2}_netmask)
		mtu=$(nvram get ${2}_mtu)
		$DEBUG ifconfig $if $DHCP_IP ${DHCP_NETMASK:+netmask $DHCP_NETMASK} ${mtu:+mtu $(($mtu))} broadcast + up

		DHCP_ARGS="-i $if ${DHCP_IP:+-r $DHCP_IP} -b -p $pidfile"
		DHCP_HOSTNAME=$(nvram get ${2}_hostname)
		DHCP_HOSTNAME=${DHCP_HOSTNAME%%.*}
		[ -z $DHCP_HOSTNAME ] || DHCP_ARGS="$DHCP_ARGS -H $DHCP_HOSTNAME"
		[ "$if_proto" = "pptp" ] && DHCP_ARGS="$DHCP_ARGS -n -q" || DHCP_ARGS="$DHCP_ARGS -R &"
		[ -r $pidfile ] && oldpid=$(cat $pidfile 2>&-)
		${DEBUG:-eval} "udhcpc $DHCP_ARGS"
		[ -n "$oldpid" ] && pidof udhcpc | grep "$oldpid" >&- 2>&- && {
			sleep 1
			kill -9 $oldpid
		}
		# hotplug events are handled by /usr/share/udhcpc/default.script
	;;
	none|"")
	;;
	*)
		[ -x "/sbin/ifup.$1" ] && { $DEBUG /sbin/ifup.$1 ${2}; exit; }
		echo "### ifup ${2}: ignored ${2}_proto=\"$1\" (not supported)"
	;;
	esac
}

append() {
	local var="$1"
	local value="$2"
	local sep="${3:- }"
	eval "export ${var}=\"\${${var}:+\${${var}}${value:+$sep}}\$value\""
}

reset_cb() {
	config_cb() {
		return 0
	}
	option_cb() {
		return 0
	}
}
reset_cb

config () {
    local cfgtype="$1"
    local name="$2"
    _C=$(($_C + 1))
    name="${name:-cfg${_C}}"
    config_cb "$cfgtype" "$name"
    export CONFIG_SECTION="$name"
    export CONFIG_${CONFIG_SECTION}_TYPE="$cfgtype"
}

option () {
	local varname="$1"; shift
	export CONFIG_${CONFIG_SECTION}_${varname}="$*"
	option_cb "$varname" "$*"
}

config_clear() {
	[ -z "$CONFIG_SECTION" ] && return
	for oldsetting in `set | grep ^CONFIG_${CONFIG_SECTION}_ | \
		sed -e 's/\(.*\)=.*$/\1/'` ; do 
		unset $oldsetting 
	done
	unset CONFIG_SECTION
}

config_load() {
	CONFIG_SECTION=
	local DIR="./"
	_C=0
	[ \! -e "$1" -a -e "/etc/config/$1" ] && {
		DIR="/etc/config/"
	}
	[ -e "$DIR$1" ] && {
		CONFIG_FILENAME="$DIR$1"
		. ${CONFIG_FILENAME}
	} || return 1
	${CD:+cd -} >/dev/null
	${CONFIG_SECTION:+config_cb}
}

config_get() {
	case "$3" in
		"") eval "echo \${CONFIG_${1}_${2}}";;
		*) eval "$1=\"\${CONFIG_${2}_${3}}\"";;
	esac
}

config_set() {
	export CONFIG_${1}_${2}="${3}"
}

include() {
	for file in $(ls /lib/$1/*.sh 2>/dev/null); do
		. $file
	done
}

set_led() {
	local led="$1"
	local state="$2"
	[ -f "/proc/diag/led/$1" ] && echo "$state" > "/proc/diag/led/$1"
}

set_state() {
	case "$1" in
		preinit)
			set_led dmz 1
			set_led diag 1
			set_led power 0
		;;
		failsafe)
			set_led diag f
			set_led power f
			set_led dmz f
		;;
		done)
			set_led dmz 0
			set_led diag 0
			set_led power 1
		;;
	esac
}
