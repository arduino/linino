#!/bin/sh

. /etc/functions.sh

save_print_table_chain() {
	local table="$1"
	local chain="$2"
	local fsave="$3"
	local fsavetmp="$fsave"".tmp"
	local next_table_line
	local cur_table_line
	local table_line
	table_line="$(($(grep -n "^*$table" "$fsave" | cut -f1 -d: ) + 1))"
	tail -n+$table_line $fsave >"$fsavetmp"
	for cur_table_line in $(grep -n "^*" "$fsavetmp"); do
		[ -z "$next_table_line" ] && {
			local lineno="$(echo $cur_table_line | cut -f1 -d:)"
			[ -n "$lineno" ] && [ "$lineno" -gt $(($table_line - 1)) ] && {
				next_table_line=$lineno
			}
		}
	done
	[ -z "$next_table_line" ] && {
		next_table_line="$(cat $fsavetmp|wc -l)"
	}
	next_table_line=$(($next_table_line - 1))
	head -n $next_table_line "$fsave.tmp" | grep $chain | grep -Ev "^:$chain" 
        rm -f "$fsavetmp"
}

save_save_fw_chain() {
	local chain
	local table
	local fsave="/tmp/.firewall/save"

	config_get chain $1 chain
	config_get table $1 table filter
	[ -z "$chain" ] && return 0
	mkdir -p /tmp/.firewall
	iptables-save >"$fsave"
	save_print_table_chain $table $chain "$fsave" > /tmp/.firewall/save-$table-$chain

}

save_load_fw_chain() {
	local chain
	local table

	config_get chain $1 chain
	config_get table $1 table filter 
	[ -e /tmp/.firewall/save-$table-$chain ] && [ "$(cat /tmp/.firewall/save-$table-$chain | wc -l)" -ge 1 ] && {
		iptables -t $table -N $chain
		while read line; do
			sh -c "iptables -t $table $line"
		done < /tmp/.firewall/save-$table-$chain
		rm /tmp/.firewall/save-$table-$chain
	}
}

save_pre_stop_cb() {
	echo "Saving dynamic firewall chains"
	config_load firewall

	config_foreach save_save_fw_chain save
}

save_post_core_cb() {
	echo "Loading dynamic firewall chains"

	config_load firewall
	config_foreach save_load_fw_chain save
}

