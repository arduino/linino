# 
# Copyright (C) 2008 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
# $Id: $

include $(TOPDIR)/rules.mk

PKG_NAME:=pepperspot
PKG_VERSION:=0.1
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.bz2
PKG_SOURCE_URL:=@SF/pepperspot
PKG_MD5SUM:=52e5861f6cae05a972b8a159be270bf7

include $(INCLUDE_DIR)/package.mk

define Package/pepperspot
  SUBMENU:=Captive Portals
  SECTION:=net
  CATEGORY:=Network
  DEPENDS:=+kmod-tun
  TITLE:=Wireless LAN HotSpot controller
  URL:=http://www.pepperspot.org/
endef

define Package/pepperspot/description
  PepperSpot is a captive portal or wireless LAN access point controller
  which support the IPv6 protocol. It supports web based login and it
  supports Wireless Protected Access (WPA). Authentication is handled by
  your favorite radius server (over IPv4/IPv6).
endef

define Package/pepperspot/conffiles
/etc/pepper.conf
endef

# uses GNU configure

define Build/Compile
	$(MAKE) -C $(PKG_BUILD_DIR) \
		DESTDIR="$(PKG_INSTALL_DIR)" \
		all install
endef

define Package/pepperspot/install
	$(INSTALL_DIR) $(1)/etc/init.d
	$(INSTALL_BIN) ./files/$(PKG_NAME).init $(1)/etc/init.d/pepper
	$(INSTALL_DIR) $(1)/etc
	$(INSTALL_DATA) $(PKG_BUILD_DIR)/doc/pepper.conf $(1)/etc/
	$(INSTALL_DIR) $(1)/usr/sbin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/usr/sbin/pepper $(1)/usr/sbin/
endef

$(eval $(call BuildPackage,pepperspot))
