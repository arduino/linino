#
# Copyright (C) 2006 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
# $Id$

include $(TOPDIR)/rules.mk

PKG_NAME:=wifidog
PKG_VERSION:=1.1.3_beta2
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:= @SF/$(PKG_NAME)
PKG_MD5SUM:=ba1611c7eb959f9c6f93e12b97d70b82
PKG_CAT:=zcat

PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)-$(PKG_VERSION)
PKG_INSTALL_DIR:=$(PKG_BUILD_DIR)/ipkg-install

include $(INCLUDE_DIR)/package.mk

define Package/wifidog
  SECTION:=net
  CATEGORY:=Network
  DEPENDS:=+iptables-mod-extra +iptables-mod-ipopt +iptables-mod-nat +libgcc
  TITLE:=A wireless captive portal solution
  DESCRIPTION:=\
	The Wifidog project is a complete and embeddable captive \\\
	portal solution for wireless community groups or individuals \\\
	who wish to open a free Hotspot while still preventing abuse \\\
	of their Internet connection.
  URL:=http://www.wifidog.org
endef

define Package/wifidog/conffiles
/etc/wifidog.conf
endef

# uses GNU configure

define Build/Compile
	$(MAKE) -C $(PKG_BUILD_DIR) \
		DESTDIR="$(PKG_INSTALL_DIR)" \
		all install
endef
	
define Package/wifidog/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/scripts/init.d/wifidog $(1)/usr/bin/wifidog-init
	$(CP) $(PKG_INSTALL_DIR)/usr/bin/wifidog $(1)/usr/bin/
	$(CP) $(PKG_INSTALL_DIR)/usr/bin/wdctl $(1)/usr/bin/
	$(INSTALL_DIR) $(1)/usr/lib
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/libhttpd.so* $(1)/usr/lib/
	$(INSTALL_DIR) $(1)/etc
	$(INSTALL_DATA) ./files/wifidog.conf $(1)/etc/
	$(INSTALL_DIR) $(1)/etc/init.d
	$(INSTALL_BIN) ./files/$(PKG_NAME).init $(1)/etc/init.d/wifidog
endef

$(eval $(call BuildPackage,wifidog))
