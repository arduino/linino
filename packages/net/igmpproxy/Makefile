# Copyright (C) 2006 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
# $Id$

include $(TOPDIR)/rules.mk

PKG_NAME:=igmpproxy
PKG_VERSION:=0.1-beta2
PKG_RELEASE:=1
PKG_MD5SUM:=2a5a59480f44d4b14077a6b5319e9940

PKG_SOURCE_URL:=@SF/igmpproxy
PKG_SOURCE:=$(PKG_NAME)-src-$(PKG_VERSION).tar.gz
PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)
PKG_CAT:=zcat

include $(INCLUDE_DIR)/package.mk

define Package/igmpproxy
  SECTION:=net
  CATEGORY:=Network
  TITLE:=Multicast Routing Daemon
  DESCRIPTION:=IGMPproxy is a simple dynamic Multicast Routing Daemon using\\\
only IGMP signalling (Internet Group Management Protocol).\\\
  URL:=http://sourceforge.net/projects/igmpproxy
endef

define Build/Compile	
	$(MAKE) CC="$(TARGET_CC)" CFLAGS="$(TARGET_CFLAGS)" -C $(PKG_BUILD_DIR)/src
endef


define Package/igmpproxy/install	
	mkdir -p $(1)/usr/sbin $(1)/etc
	$(CP) $(PKG_BUILD_DIR)/src/$(PKG_NAME) $(1)/usr/sbin/
	$(CP) $(PKG_BUILD_DIR)/src/$(PKG_NAME).conf $(1)/etc
endef

$(eval $(call BuildPackage,igmpproxy))
