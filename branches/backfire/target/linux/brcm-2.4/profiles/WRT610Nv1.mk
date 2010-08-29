#
# Copyright (C) 2010 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

define Profile/WRT610Nv1
  NAME:=Linksys WRT610N v1
  PACKAGES:=kmod-brcm-wl-mimo wlc nas kmod-wlcompat kmod-brcm-57xx kmod-usb-core kmod-usb-ohci kmod-usb2
endef

define Profile/WRT610Nv1/Description
	Package set optimized for the WRT610N v1
endef
$(eval $(call Profile,WRT610Nv1))

