#
# Copyright (C) 2006 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
# $Id$

include $(TOPDIR)/rules.mk

PKG_NAME:=ttcp
PKG_VERSION:=3.8
PKG_RELEASE:=1

PKG_BUILD_DIR:=$(BUILD_DIR)/ttcp

include $(INCLUDE_DIR)/package.mk

define Package/ttcp
  SECTION:=net
  CATEGORY:=Network
  TITLE:=A TCP connection performance tester
  DESCRIPTION:=A small utility to test TCP connection performance
  URL:=https://dev.openwrt.org/browser/packages/net/ttcp/
endef

define Build/Compile		
	$(TARGET_CC) $(TARGET_CFLAGS) -o $(PKG_BUILD_DIR)/ttcp ttcp.c
endef

define Package/ttcp/install	
	install -d -m0755 $(1)/usr/bin
	install -m0755 $(PKG_BUILD_DIR)/ttcp $(1)/usr/bin/
endef

$(eval $(call BuildPackage,ttcp))
