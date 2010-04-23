#!/bin/sh 

PIDFILE="/tmp/run/sshtunnel"

args=$1
retrydelay=$2

while true
do
	logger -p daemon.info -t "sshtunnel[$$]" "connecting: ssh $args"
	
	start-stop-daemon -S -p "$PIDFILE"_"$$".pid -mx ssh -- $args &>/tmp/log/sshtunnel_$$ 
	logger -p daemon.err -t "sshtunnel[$$]" < /tmp/log/sshtunnel_$$
	rm /tmp/log/sshtunnel_$$
	
	logger -p daemon.info -t "sshtunnel[$$]" "ssh exited with code $?, retrying in $retrydelay seconds"
	
	sleep "$retrydelay" & wait
done
