#
# Copyright (C) 2006-2009 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
# $Id$

include $(TOPDIR)/rules.mk

PKG_NAME:=tinyproxy
PKG_VERSION:=1.6.4
PKG_RELEASE:=1.2

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=http://www.banu.com/pub/tinyproxy/1.6/
PKG_MD5SUM:=3157b9159a8d005f4248cf4d4d6c65e2

include $(INCLUDE_DIR)/package.mk

define Package/tinyproxy
  SECTION:=net
  CATEGORY:=Network
  TITLE:=Tinyproxy is a lightweight HTTP and HTTPS proxy.
  URL:=http://tinyproxy.sourceforge.net/
endef

define Package/tinyproxy/conffiles
/etc/config/tinyproxy
endef

define Build/Configure
	$(call Build/Configure/Default,\
		--enable-filter \
		--enable-transparent-proxy \
	)
endef

define Build/Compile
	$(MAKE) -C $(PKG_BUILD_DIR) \
		DESTDIR="$(PKG_INSTALL_DIR)" \
		all install
endef

define Package/tinyproxy/install
	$(INSTALL_DIR) $(1)/usr/sbin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/usr/sbin/tinyproxy $(1)/usr/sbin/
	$(INSTALL_DIR) $(1)/usr/share/tinyproxy
	$(CP) $(PKG_INSTALL_DIR)/usr/share/tinyproxy/*.html $(1)/usr/share/tinyproxy/
	$(INSTALL_DIR) $(1)/etc/config
	$(CP) ./files/tinyproxy.config $(1)/etc/config/tinyproxy
	$(INSTALL_DIR) $(1)/etc/init.d
	$(INSTALL_BIN) ./files/tinyproxy.init $(1)/etc/init.d/tinyproxy
endef

$(eval $(call BuildPackage,tinyproxy))
