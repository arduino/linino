#
# Copyright (C) 2006 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
# $Id$

include $(TOPDIR)/rules.mk

PKG_NAME:=srelay
PKG_VERSION:=0.4.6
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=@SF/socks-relay
PKG_MD5SUM:=4a9f3298b38d8588f0ffde31b946a47f
PKG_CAT:=zcat

PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)-$(PKG_VERSION)

include $(INCLUDE_DIR)/package.mk

define Package/srelay
  SECTION:=net
  CATEGORY:=Network
  TITLE:=A socks 4/5 proxy server
  URL:=http://www.c-wind.com/srelay/
endef

define Package/srelay/conffiles
/etc/srelay.conf
endef

define Build/Configure
	$(call Build/Configure/Default, \
		--disable-thread \
	)
endef

define Build/Compile
	$(MAKE) -C $(PKG_BUILD_DIR)
endef

define Package/srelay/install	
	install -d -m0755 $(1)/usr/bin
	install -m0755 $(PKG_BUILD_DIR)/srelay $(1)/usr/bin/
	install -d -m0755 $(1)/etc
	install -m0644 files/srelay.conf $(1)/etc/
	install -d -m0755 $(1)/etc/init.d
	install -m0755 files/srelay.init $(1)/etc/init.d/srelay
endef

$(eval $(call BuildPackage,srelay))
