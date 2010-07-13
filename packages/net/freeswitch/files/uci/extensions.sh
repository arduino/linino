#!/bin/sh
# Copyright (C) 2010 Vertical Communications
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.

fs_escape_slash() {
	local inval="$1"
	[ -z "$inval" ] && return 0
	echo "$inval" | sed -e 's/\([/\\]\)/\\\1/g'
}

fs_ext_entry() {
	local cfg="$1"
	local number
	local userid
	local password
	local vm_password
	local toll_allow
	local account_code
	local effective_callerid_name
	local effective_callerid_number
	local outbound_callerid_name
	local outbound_callerid_number
	local did
	local callgroup
	
	config_get number "$cfg" number	
	[ "$number" = "default" ] && return 1	
	config_get userid "$cfg" userid "$number"
	config_get password "$cfg" password '$${default_password}'
	config_get vm_password "$cfg" vm_password "$number"
	config_get toll_allow "$cfg" toll_allow 'domestic,international,local'
	config_get account_code "$cfg" account_code "$number"
	config_get effective_callerid_name "$cfg" effective_callerid_name "Extension $number"
	config_get effective_callerid_number "$cfg" effective_callerid_number "$number"
	config_get outbound_callerid_name "$cfg" outbound_callerid_name '$${outbound_caller_name}'
	config_get outbound_callerid_number "$cfg" outbound_callerid_number '$${outbound_caller_id}'
	config_get did "$cfg" did
	config_get callgroup "$cfg" callgroup "everyone"
		
	sed -e "s/\[{FS_EXTENSION_ID}\]/$(fs_escape_slash $userid)/
	s/\[{FS_EXTENSION_PASSWORD}\]/$(fs_escape_slash $password)/
	s/\[{FS_EXTENSION_VM_PASSWORD}\]/$(fs_escape_slash $vm_password)/
	s/\[{FS_EXTENSION_TOLL_ALLOW}\]/$(fs_escape_slash $toll_allow)/
	s/\[{FS_EXTENSION_ACCOUNT_CODE}\]/$(fs_escape_slash $account_code)/
	s/\[{FS_EXTENSION_EFFECTIVE_CALLERID_NAME}\]/$(fs_escape_slash $effective_callerid_name)/
	s/\[{FS_EXTENSION_EFFECTIVE_CALLERID_NUMBER}\]/$(fs_escape_slash $effective_callerid_number)/
	s/\[{FS_EXTENSION_OUTBOUND_CALLERID_NAME}\]/$(fs_escape_slash $outbound_callerid_name)/
	s/\[{FS_EXTENSION_OUTBOUND_CALLERID_NUMBER}\]/$(fs_escape_slash $outbound_callerid_number)/
	s/\[{FS_EXTENSION_CALLGROUP}\]/$(fs_escape_slash $callgroup)/
	" /etc/freeswitch/directory/default/extension.xml.template >/etc/freeswitch/directory/default/ext-"$number".xml
	
	[ -n "$did" ] && {
		sed -e "s/\[{FS_INCOMING_DID}\]/$did/
		s/\[{FS_EXTENSION_NUMBER}\]/$number/
		" /etc/freeswitch/dialplan/public/did.xml.template >/etc/freeswitch/dialplan/public/20-did-"$did".xml
	}
	
	append ext_number_list "$number" '|'
}

fs_extensions_all() {
	local ext_number_list=""
	rm -f /etc/freeswitch/directory/default/ext-*.xml
	rm -f /etc/freeswitch/dialplan/public/20-did-*.xml
	config_foreach fs_ext_entry "extension"
	sed -e "s/\[{FS_DIALPLAN_PHONES}\]/$ext_number_list/" /etc/freeswitch/dialplan/public.xml.template >/etc/freeswitch/dialplan/public.xml
	sed -e "s/\[{FS_DIALPLAN_PHONES}\]/$ext_number_list/" /etc/freeswitch/dialplan/default.xml.template >/etc/freeswitch/dialplan/default.xml
}
