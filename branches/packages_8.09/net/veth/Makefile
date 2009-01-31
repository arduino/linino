#
# Copyright (C) 2008 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
# $Id: $

include $(TOPDIR)/rules.mk

PKG_NAME:=veth
PKG_VERSION:=1.0
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=http://www.geocities.com/nestorjpg/veth/
PKG_MD5SUM:=11536388d9c76552a4b736638a458361

PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)-$(PKG_VERSION)

include $(INCLUDE_DIR)/package.mk

define Package/veth
  SECTION:=net
  CATEGORY:=Network
  DEPENDS:=+kmod-tun
  TITLE:=Virtual Ethernet Device for Linux
  URL:=http://www.geocities.com/nestorjpg/veth/
endef

define Package/veth/description
	VETH is a daemon that virtualizes a ethernet card in Linux. 
	The virtualization is done via Universal TUN/TAP Driver.
endef

define Build/Compile	
	$(MAKE) -C $(PKG_BUILD_DIR)/veth \
		CC="$(TARGET_CC)" \
		CFLAGS="$(TARGET_CFLAGS) $(TARGET_CPPFLAGS)" \
		LDFLAGS="$(TARGET_LDFLAGS)"
endef

define Package/veth/install
	$(INSTALL_DIR) $(1)/usr/sbin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/veth/vethd $(1)/usr/sbin/
endef

$(eval $(call BuildPackage,veth))
