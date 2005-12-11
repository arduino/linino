#!/bin/ash
#
# Default handlers for config files
#
HANDLERS_config='
	wireless) reload_wireless;;
	network) reload_network;;
	system) reload_system;;
'
HANDLERS_file='
	hosts) rm -f /etc/hosts; mv $config /etc/hosts; killall -HUP dnsmasq ;;
	ethers) rm -f /etc/ethers; mv $config /etc/ethers; killall -HUP dnsmasq ;;
'

# for some reason a for loop with "." doesn't work
eval "$(cat /usr/lib/webif/apply-*.sh 2>&-)"

reload_network() {
	echo Reloading networking settings ...
	grep '^wan_' config-network >&- 2>&- && {
		ifdown wan
		ifup wan
		killall -HUP dnsmasq
	}
	
	grep '^lan_' config-network >&- 2>&- && {
		ifdown lan
		ifup lan
		killall -HUP dnsmasq
	}
}

reload_wireless() {
	echo Reloading wireless settings ...
	killall nas >&- 2>&- && sleep 2
	/sbin/wifi
	[ -f /etc/init.d/S41wpa ] && /etc/init.d/S41wpa
}

reload_system() {
	echo Applying system settings ...
	echo "$(nvram get wan_hostname)" > /proc/sys/kernel/hostname
}

cd /tmp/.webif

# file-* 		other config files
for config in $(ls file-* 2>&-); do
	name=${config#file-}
	echo "Processing config file: $name"
	eval 'case "$name" in
		'"$HANDLERS_file"'
	esac'
done

# config-*		simple config files
[ -f /etc/nvram.overrides ] && ( # White Russian
	cd /proc/self
	cat /tmp/.webif/config-* 2>&- | grep '=' >&- 2>&- && {
		cat /tmp/.webif/config-* 2>&- | tee fd/1 | xargs -n1 nvram set
		echo "Committing NVRAM ..."
		nvram commit
	}
)
for config in $(ls config-* 2>&-); do 
	name=${config#config-}
	eval 'case "$name" in
		'"$HANDLERS_config"'
	esac'
done
sleep 2
rm -f config-*
