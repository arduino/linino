#!/bin/sh
# Copyright (C) 2006 OpenWrt.org
# Copyright (C) 2006 Fokus Fraunhofer <carsten.tittel@fokus.fraunhofer.de>

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

		[ -f /tmp/resolv.conf.auto ] || {
			debug "# --- creating /tmp/resolv.conf.auto ---"
			for dns in $(nvram get ${2}_dns); do
				echo "nameserver $dns" >> /tmp/resolv.conf.auto
			done
		}
		
		[ -n "$static_route" ] && {
			for route in $static_route; do {
			eval "set $(echo $route | sed 's/:/ /g')"
				if [ "$2" = "255.255.255.255" ]; then
					opt="-host"
				fi
				$DEBUG route add ${opt:-"-net"} $1 netmask $2 gw $3 metric $4 
			} done
		}

		env -i ACTION="ifup" INTERFACE="${2}" PROTO=static /sbin/hotplug "iface" &
	;;
	dhcp*)
		DHCP_IP=$(nvram get ${2}_ipaddr)
		DHCP_NETMASK=$(nvram get ${2}_netmask)
		mtu=$(nvram get ${2}_mtu)
		$DEBUG ifconfig $if $DHCP_IP ${DHCP_NETMASK:+netmask $DHCP_NETMASK} ${mtu:+mtu $(($mtu))} broadcast + up

		DHCP_ARGS="-i $if ${DHCP_IP:+-r $DHCP_IP} -b -p $pidfile -t 0"
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

# newline
N="
"

_C=0

hotplug_dev() {
	env -i ACTION=$1 INTERFACE=$2 /sbin/hotplug net
}

append() {
	local var="$1"
	local value="$2"
	local sep="${3:- }"
	
	eval "export -n -- \"$var=\${$var:+\${$var}\${value:+\$sep}}\$value\""
}

reset_cb() {
	config_cb() { return 0; }
	option_cb() { return 0; }
}
reset_cb

config () {
	local cfgtype="$1"
	local name="$2"
	
	CONFIG_NUM_SECTIONS=$(($CONFIG_NUM_SECTIONS + 1))
	name="${name:-cfg$CONFIG_NUM_SECTIONS}"
	append CONFIG_SECTIONS "$name"
	config_cb "$cfgtype" "$name"
	CONFIG_SECTION="$name"
	export -n "CONFIG_${CONFIG_SECTION}_TYPE=$cfgtype"
}

option () {
	local varname="$1"; shift
	local value="$*"
	
	export -n "CONFIG_${CONFIG_SECTION}_${varname}=$value"
	option_cb "$varname" "$*"
}

config_rename() {
	local OLD="$1"
	local NEW="$2"
	local oldvar
	local newvar
	
	[ "$OLD" -a "$NEW" ] || return
	for oldvar in `set | grep ^CONFIG_${OLD}_ | \
		sed -e 's/\(.*\)=.*$/\1/'` ; do
		newvar="CONFIG_${NEW}_${oldvar##CONFIG_${OLD}_}"
		eval "export -n \"$newvar=\${$oldvar}\""
		unset "$oldvar"
	done
	CONFIG_SECTIONS="$(echo " $CONFIG_SECTIONS " | sed -e "s, $OLD , $NEW ,")"
	
	[ "$CONFIG_SECTION" = "$OLD" ] && CONFIG_SECTION="$NEW"
}

config_unset() {
	config_set "$1" "$2" ""
}

config_clear() {
	local SECTION="$1"
	local oldvar
	
	CONFIG_SECTIONS="$(echo " $CONFIG_SECTIONS " | sed -e "s, $OLD , ,")"
	CONFIG_SECTIONS="${SECTION:+$CONFIG_SECTIONS}"

	for oldvar in `set | grep ^CONFIG_${SECTION:+$SECTION_} | \
		sed -e 's/\(.*\)=.*$/\1/'` ; do 
		unset $oldvar 
	done
}

config_load() {
	local file="/etc/config/$1"
	_C=0
	CONFIG_SECTIONS=
	CONFIG_NUM_SECTIONS=0
	CONFIG_SECTION=
	
	[ -e "$file" ] && {
		. $file
	} || return 1
	
	${CONFIG_SECTION:+config_cb}
}

config_get() {
	case "$3" in
		"") eval "echo \"\${CONFIG_${1}_${2}}\"";;
		*)  eval "export -n -- \"$1=\${CONFIG_${2}_${3}}\"";;
	esac
}

config_set() {
	local section="$1"
	local option="$2"
	local value="$3"
	export -n "CONFIG_${section}_${option}=$value"
}

config_foreach() {
	local function="$1"
	local section
	
	[ -z "$CONFIG_SECTIONS" ] && return 0
	for section in ${CONFIG_SECTIONS}; do
		eval "$function \"\$section\""
	done
}

load_modules() {
	cd /etc/modules.d
	sed 's/^[^#]/insmod &/' $* | ash 2>&- || :
}

include() {
	local file
	
	for file in $(ls $1/*.sh 2>/dev/null); do
		. $file
	done
}

find_mtd_part() {
	local PART="$(grep "\"$1\"" /proc/mtd | awk -F: '{print $1}')"
	
	PART="${PART##mtd}"
	echo "${PART:+/dev/mtdblock/$PART}"
}

strtok() { # <string> { <variable> [<separator>] ... }
	local tmp
	local val="$1"
	local count=0

	shift

	while [ $# -gt 1 ]; do
		tmp="${val%%$2*}"

		[ "$tmp" = "$val" ] && break

		val="${val#$tmp$2}"

		export -n "$1=$tmp"; count=$((count+1))
		shift 2
	done

	if [ $# -gt 0 -a "$val" ]; then
		export -n "$1=$val"; count=$((count+1))
	fi

	return $count
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
