#!/bin/ash
#
# Default handlers for config files
#
HANDLERS_config='
	wireless) reload_wireless;;
	network) reload_network;;
'
HANDLERS_file='
	hosts) rm -f /etc/hosts; mv $config /etc/hosts;;
	ethers) rm -rf /etc/ethers; mv $config /etc/ethers;;
'

reload_network() {
	echo Reloading networking settings...
	grep '^wan_' config-network >&- 2>&- && {
		ifdown wan
		ifup wan
	}
	
	grep '^lan_' config-network >&- 2>&- && {
		ifdown lan
		ifup lan
	}
}

reload_wireless() {
	echo Reloading wireless settings...
	killall nas >&- 2>&- && sleep 2
	/sbin/wifi
	[ -f /etc/init.d/S41wpa ] && /etc/init.d/S41wpa
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
	cat /tmp/.webif/config-* 2>&- | tee fd/1 | xargs -n1 nvram set
)
echo "Committing NVRAM..."
nvram commit
for config in $(ls config-* 2>&-); do 
	name=${config#config-}
	eval 'case "$name" in
		'"$HANDLERS_config"'
	esac'
done
sleep 2
rm -f config-*
