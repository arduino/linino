#
# Copyright (C) 2007 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
# $Id: $

include $(TOPDIR)/rules.mk

PKG_NAME:=qolyester
PKG_VERSION:=20070910
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.bz2
PKG_SOURCE_URL:=http://downloads.openwrt.org/sources/
PKG_MD5SUM:=9c1cf1868e085f47e135a86945d93ce0

PKG_BUILD_DEPENDS:=libnotimpl

include $(INCLUDE_DIR)/package.mk

define Package/qolyester
  SECTION:=net
  CATEGORY:=Network
  DEPENDS:=+libpthread @!TARGET_avr32 @!powerpc
  TITLE:=OLSR implementation with QoS
  URL:=http://qolsr.lri.fr/code/
endef

define Package/qolyester/description
	This is an implementation from scratch of the OLSR protocol.
	It is written in the C++ programming language and its goals
	are modularity, efficiency and conformance to RFC 3626 (OLSR).
endef

# uses GNU configure
define Build/Compile	
	$(MAKE) -C $(PKG_BUILD_DIR) \
		DESTDIR="$(PKG_INSTALL_DIR)" \
		LIBS="-L$(STAGING_DIR)/usr/lib -lnotimpl" \
		all install
endef

define Package/qolyester/install	
	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/usr/bin/qolsrd $(1)/usr/bin/
endef

$(eval $(call BuildPackage,qolyester))
