# 
# Copyright (C) 2006 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
# $Id$

include $(TOPDIR)/rules.mk

PKG_NAME:=icmptx
PKG_VERSION:=0.01
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=http://thomer.com/icmptx/
PKG_MD5SUM:=f83d1d7789a1b100abcc00d1a56ee95d

PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)-$(PKG_VERSION)

include $(INCLUDE_DIR)/package.mk

define Package/icmptx
  SECTION:=net
  CATEGORY:=Network
  TITLE:=allows you to pass IP packets via ICMP queries 
  URL:=http://thomer.com/icmptx/
endef

define Build/Configure
endef

define Build/Compile
	$(MAKE) -C $(PKG_BUILD_DIR) CC="$(TARGET_CC)"
endef

define Package/icmptx/install
	$(INSTALL_DIR) $(1)/usr/sbin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/icmptx $(1)/usr/sbin/
endef

$(eval $(call BuildPackage,icmptx))
