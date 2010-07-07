#!/bin/sh

# Copyright (C) 2010 Vertical Communications
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.

fs_parse_param_action() {
	local cfg="$1"
	local param_file="$2"
	local param="$3"
	local param_type="$4"
	local default="$5"
	local value
	
	if [ -z "$default" ]; then
		config_get value "$cfg" "$(echo $param|tr - _ )"
	else
		config_get value "$cfg" "$(echo $param|tr - _ )" "$default"
	fi
	
	if [ "$param_type" = "bool" ]; then
		if [ "$value" = "0" ] || [ "$value" = "false" ] || [ "$value" = "no" ]; then
			value="false"
		elif [ "$value" = "1" ] || [ "$value" = "true" ] || [ "$value" = "yes" ]; then
			value="true"
		fi
	fi
	
	fs_set_param "$param_file" "$param" "$value"
}

fs_to_xml_param_list() {
	local cfg="$1"
	local param_list="$2"
	local param_file="$3"
	local i=0
	local param
	local default
	local list_item
	local param_type
	echo "$param_list" | {
		local list_item 
		read -t 1 list_item 
		while [ "$list_item" != '[FS-EOF]' ]; do
			if [ $i -eq 0 ]; then
				param="$list_item"
				i=1
			elif [ $i -eq 1 ]; then
				param_type="$list_item"
				i=2
			else
				default="$list_item"
				fs_parse_param_action "$cfg" "$param_file" "$param" "$param_type" "$default"
				i=0
			fi
			read -t 1 list_item
		done
	}
}
