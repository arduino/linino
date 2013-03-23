#
# Copyright (C) 2009-2010 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

define Profile/Linino
	NAME:=Linino reference board based on Atheros AR9331
	PACKAGES:=kmod-usb-core kmod-usb2
endef

define Profile/Linino/Description
	Package set optimized for the Linino reference board.
endef

$(eval $(call Profile,Linino))

