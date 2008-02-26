#
# Copyright (C) 2007-2008 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
# $Id$

include $(TOPDIR)/rules.mk

PKG_NAME:=sdparm
PKG_VERSION:=1.02
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tgz
PKG_SOURCE_URL:=http://sg.torque.net/sg/p/
PKG_MD5SUM:=cc6de6fdba91f382d00b9b8a09dd14f2

PKG_FIXUP = libtool

include $(INCLUDE_DIR)/package.mk

define Package/sdparm
  SECTION:=utils
  CATEGORY:=Utilities
  TITLE:=Read or modify SCSI or USB disk parameters
  DEPENDS:=+kmod-scsi-generic
  SUBMENU:=disc
endef

define Package/sdparm/description
	The sdparm utility outputs and in some cases modifies SCSI device parameters.
endef

define Package/sdparm/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/src/sdparm $(1)/usr/bin/
endef

$(eval $(call BuildPackage,sdparm))
