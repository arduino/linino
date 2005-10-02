cd /tmp/.webif


# file-* 		other config files
for config in $(ls file-* 2>&-); do
	name=${config#file-}
	echo "Processing config file: $name"
	case "$name" in
		hosts) mv $config /etc/hosts;;
		ethers) mv $config /etc/ethers;;
		*)	# FIXME: add other config handlers
			;;
	esac
done


# config-*		simple config files
[ -f /etc/nvram.overrides ] && ( # White Russian
	cd /proc/self
	cat /tmp/.webif/config-* 2>&- | tee fd/1 | xargs -n1 nvram set
)

nvram commit
for config in $(ls config-* 2>&-); do 
	name="/usr/lib/webif/apply-${config#config-}.sh"
	sh $name &
done
sleep 2
rm -f config-*
