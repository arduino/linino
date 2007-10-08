# 
# Copyright (C) 2007 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=sdparm
PKG_VERSION:=1.02
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tgz
PKG_SOURCE_URL:=http://sg.torque.net/sg/p/
PKG_MD5SUM:=cc6de6fdba91f382d00b9b8a09dd14f2

include $(INCLUDE_DIR)/package.mk

define Package/sdparm
  SECTION:=utils
  CATEGORY:=Utilities
  TITLE:=read or modify scsi or usb disk parameters
  DEPENDS:=+kmod-scsi-generic
  DESCRIPTION:=\
	The sdparm utility outputs and in some cases modifies SCSI device parameters.
endef

define Package/sdparm/install
	$(INSTALL_DIR) $(1)/usr/sbin
	$(CP) $(PKG_BUILD_DIR)/src/sdparm $(1)/usr/sbin/
endef

$(eval $(call BuildPackage,sdparm))
