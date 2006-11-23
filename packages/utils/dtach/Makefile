#
# Copyright (C) 2006 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
# $Id$

include $(TOPDIR)/rules.mk

PKG_NAME:=dtach
PKG_VERSION:=0.6
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=@SF/dtach
PKG_MD5SUM:=13d5b834a7855f2448dbf33e0d3d3af8
PKG_CAT:=zcat

PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)-$(PKG_VERSION)

include $(INCLUDE_DIR)/package.mk

define Package/dtach
  SECTION:=utils
  CATEGORY:=Utilities
  TITLE:=A program that emulates the dtach feature of screen
  URL:=http://dtach.sourceforge.net/
endef

define Build/Configure	
	$(call Build/Configure/Default)
endef

define Build/Compile	
	$(MAKE) -C $(PKG_BUILD_DIR)
endef

define Package/dtach/install	
	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/dtach $(1)/usr/bin/
endef

$(eval $(call BuildPackage,dtach))
