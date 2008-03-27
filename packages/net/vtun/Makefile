#
# Copyright (C) 2006 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
# $Id$

include $(TOPDIR)/rules.mk

PKG_NAME:=vtun
PKG_VERSION:=3.0.1
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=@SF/vtun
PKG_MD5SUM:=c342ffe77055d4248a38f0b380f28c1b

include $(INCLUDE_DIR)/package.mk

define Package/vtun
  SECTION:=net
  CATEGORY:=Network
  DEPENDS:=+kmod-tun +liblzo +libopenssl +zlib
  TITLE:=VPN tunneling daemon
  URL:=http://vtun.sourceforge.net
  SUBMENU:=VPN
endef

define Package/vtun/conffiles
/etc/vtund.conf
endef

define Build/Configure
	$(call Build/Configure/Default, \
		--with-lzo-headers="$(STAGING_DIR)/usr/include/lzo" \
		--with-lzo-lib="$(STAGING_DIR)/usr/lib/" \
		--with-ssl-headers="$(STAGING_DIR)/usr/include/openssl" \
		, \
		LIBS="-L$(STAGING_DIR)/usr/lib" \
		BLOWFISH_HDR_DIR="$(STAGING_DIR)/usr/include/openssl" \
		LZO_HDR_DIR="$(STAGING_DIR)/usr/include/lzo" \
		SSL_HDR_DIR="$(STAGING_DIR)/usr/include/openssl" \
	)
endef

define Build/Compile	
	$(call Build/Compile/Default,vtund)
endef

define Package/vtun/install	
	$(INSTALL_DIR) $(1)/etc
	$(INSTALL_CONF) $(PKG_BUILD_DIR)/vtund.conf $(1)/etc/
	$(INSTALL_DIR) $(1)/usr/sbin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/vtund $(1)/usr/sbin/
endef

$(eval $(call BuildPackage,vtun))
