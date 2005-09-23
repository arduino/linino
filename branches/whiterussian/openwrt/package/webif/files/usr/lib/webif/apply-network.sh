echo Reloading networking settings...
grep '^wan_' config-network >&- 2>&- && {
	ifdown wan
	ifup wan
}

grep '^lan_' config-network >&- 2>&- && {
	ifdown lan
	ifup lan
}
