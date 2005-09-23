echo Reloading wireless settings...
killall nas >&- 2>&- && sleep 2
/sbin/wifi
[ -f /etc/init.d/S41wpa ] && /etc/init.d/S41wpa
