#
# Copyright (C) 2006,2007 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
# $Id$

include $(TOPDIR)/rules.mk

PKG_NAME:=dircproxy
PKG_VERSION:=1.2.0-beta2
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.bz
PKG_SOURCE_URL:=http://dircproxy.securiweb.net/pub/1.2/
PKG_MD5SUM:=850443437f709276ff21a173bbf98456

include $(INCLUDE_DIR)/package.mk

define Package/dircproxy
  SUBMENU:=Instant Messaging
  SECTION:=net
  CATEGORY:=Network
  TITLE:=An IRC proxy server
  URL:=http://dircproxy.securiweb.net/
endef

# uses Build/Configure/Default

define Build/Compile
	$(MAKE) -C $(PKG_BUILD_DIR) \
		DESTDIR="$(PKG_INSTALL_DIR)" \
		all install
endef

define Package/dircproxy/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/usr/bin/dircproxy{,-crypt} $(1)/usr/bin/
endef

$(eval $(call BuildPackage,dircproxy))
