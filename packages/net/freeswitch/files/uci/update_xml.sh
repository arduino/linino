#!/bin/sh
# Copyright (C) 2010 Vertical Communications
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.

# Note that the fs_profile_* functions require the FS XML files contains
# commented out sections for the parameters that are not currently in use, but
# which are to be available to the UCI FS config
fs_init_xml() {
	config_load freeswitch
	fs_profile_internal_top "internal_top" "/etc/freeswitch/sip_profiles/internal.xml"
	fs_profile_external_top "external_top" "/etc/freeswitch/sip_profiles/external.xml"
	fs_profile_gateway "external_example" "/etc/freeswitch/sip_profiles/external/example.xml"
	fs_profile_gateway "internal_example" "/etc/freeswitch/sip_profiles/internal/example.xml"
	fs_extensions_all
}
