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
PKG_MD5SUM:=4a9f3298b38d8588f0ffde31b946a47f

PKG_SOURCE_URL:=@SF/socks-relay
PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_CAT:=zcat

PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)-$(PKG_VERSION)
PKG_INSTALL_DIR:=$(PKG_BUILD_DIR)/ipkg-install
PKG_INIT_LEVEL:=60

include $(INCLUDE_DIR)/package.mk

define Package/srelay
  SECTION:=net
  CATEGORY:=Network
  TITLE:=A socks 4/5 proxy server
  DESCRIPTION:=A socks 4/5 protocol proxy server
  URL:=http://www.c-wind.com/srelay/
endef

define Package/srelay/conffiles
/etc/srelay.conf
endef

define Build/Configure
$(call Build/Configure/Default,--disable-thread)
endef

define Package/srelay/install	
	install -m0755 -d $(1)/usr/bin
	install -m0755 -d $(1)/etc/init.d
	$(CP) $(PKG_BUILD_DIR)/srelay $(1)/usr/bin/
	$(CP) files/srelay.init $(1)/etc/init.d/S$(PKG_INIT_LEVEL)srelay
	$(CP) files/srelay.conf $(1)/etc
	chmod 755 $(1)/etc/init.d/S$(PKG_INIT_LEVEL)srelay
endef

$(eval $(call BuildPackage,srelay))
