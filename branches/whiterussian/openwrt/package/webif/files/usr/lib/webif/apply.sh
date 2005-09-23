cd /tmp/.webif

[ -f /etc/nvram.overrides ] && ( # White Russian
	cd /proc/self
	cat /tmp/.webif/config-* | tee fd/1 | xargs -n1 nvram set
)

nvram commit
for config in config-*; do 
	name="/usr/lib/webif/apply-${config#config-}.sh"
	[ -f "$name" ] && sh $name &
done
sleep 2
rm -f config-*
