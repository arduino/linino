#!/bin/sh
# Copyright (C) 2010 Vertical Communications
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.

# Uncomment commented out XML line
fs_uncomment_xml_line() {
	local file="$1"
	local tag="$2"
	local attribute1="$3"
	local value1="$4"
	local attribute2="$5"
	local value2="$6"
	if [ -n "$attribute2" ]; then
		if [ -n "$value2" ]; then
			sed -i -e "/<${tag} ${attribute1}=\"""${value1}""\".*${attribute2}=\"""${value2}""\".*\/>/ s|^\(.*\)<!--.*<${tag}\(.*\)${attribute1}=\"""${value1}""\"\(.*\)${attribute2}\=\"""${value2}""\"\(.*\)/>.*-->\(.*\)\$|\1<${tag}\2${attribute1}=\"${value1}\"\3${attribute2}=\"${value2}\"\4/>\5|" $file
		else
			sed -i -e "/<${tag} ${attribute1}=\"""${value1}""\".*${attribute2}=.*\/>/ s|^\(.*\)<!--.*<${tag}\(.*\)${attribute1}=\"""${value1}""\"\(.*\)${attribute2}\=\(.*\)/>.*-->\(.*\)\$|\1<${tag}\2${attribute1}=\"""${value1}""\"\3${attribute2}=\4/>\5|" $file
		fi
	elif [ -n "$attribute1" ]; then
		sed -i -e "/<${tag} ${attribute1}=\"""${value1}""\".*\/>/ s|^\(.*\)<!--.*<${tag}\(.*\)${attribute1}=\"""${value1}""\"\(.*\)\/>.*-->\(.*\)\$|\1<${tag}\2${attribute1}=\"""${value1}""\"\3\/>\4|" $file
	else 
		logger -t freeswitch "Error uncommenting tag $tag in file $1; no attributes defined"
	fi
}

# Comment previously uncommented XML line
fs_comment_xml_line() {
	local file="$1"
	local tag="$2"
	local attribute1="$3"
	local value1="$4"
	local attribute2="$5"
	local value2="$6"
	if [ -n "$attribute2" ]; then
		sed -i -e "/<[^!]${tag} ${attribute1}=\"""${value1}""\".*${attribute2}=\"""${value2}""\"\/>/ s|\(.*\)<${tag}\(.*\)${attribute1}=\"""${value1}""\"\(.*\)${attribute2}=\"""${value2}""\"\(.*\)/>(.*\)\$|<!-- \1<${tag}\2${attribute1}=\"${value1}\"\3${attribute2}=\"""${value2}""\"\4/>\5 -->|" $file
	elif [ -n "$attribute1" ]; then
		sed -i -e "/<[^!]${tag} ${attribute1}=\"""${value1}""\".*\/>/ s|\(.*\)<${tag}\(.*\)${attribute1}=\"""${value1}""\"\(.*\)/>\(.*\)\$|\1<!-- <${tag}\2${attribute1}=\"""${value1}""\"\3/>\4 -->|" $file
	else 
		logger -t freeswitch "Error uncommenting tag $tag in file $1; no attributes defined"
	fi
}

# Modify second attribute in tag with two attributes (tag and one attribute 
# specified) if tag exists and is comments modifies, if commented, 
# uncomments and and modifies it. 
fs_mod_attribute2() {
	local file="$1"
	local tag="$2"
	local attribute1="$3"
	local value1="$4"
	local attribute2="$5"
	local newvalue="$6"
	fs_uncomment_xml_line "$file" "$tag" "$attribute1" "$value1" "$attribute2"
	sed -i -e "/[^<!-]*<${tag} ${attribute1}=\"""${value1}""\".*${attribute2}=\""".*""\"\/>/ s|\(.*\)<${tag}\(.*\)${attribute1}=\"""${value1}""\"\(.*\)${attribute2}=\""".*""\"\(.*\)/>\(.*\)\$|\1<${tag}\2${attribute1}=\"""${value1}""\"\3${attribute2}=\"""${newvalue}""\"\4/>\5|" $file
}

fs_set_param() {
	local file="$1"
	local param="$2"
	local newvalue="$3"
	
	if [ -n "$newvalue" ]; then
		fs_mod_attribute2 "$file" param name "$param" value "$newvalue"
	else
		fs_comment_xml_line "$file" param name "$param"
	fi
}

fs_set_param_bool() {
	local file="$1"
	local param="$2"
	local boolvalue="$3"

	if [ "$boolvalue" = "0" ]; then
		fs_set_param "$file" "$param" "false"	
	else
		fs_set_param "$file" "$param" "true"
	fi
}

