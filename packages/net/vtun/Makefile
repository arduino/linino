#
# Copyright (C) 2006 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
# $Id$

include $(TOPDIR)/rules.mk

PKG_NAME:=vtun
PKG_VERSION:=2.6
PKG_RELEASE:=1
PKG_MD5SUM:=309534fd03c5d13a19c43916f61f4bbf

PKG_SOURCE_URL:=@SF/vtun
PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_CAT:=zcat

PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)

include $(INCLUDE_DIR)/package.mk

define Package/vtun
  SECTION:=net
  CATEGORY:=Network
  DEPENDS:=+kmod-tun +liblzo +libopenssl +zlib
  TITLE:=VPN tunneling daemon
  DESCRIPTION:=VPN tunneling daemon
  URL:=http://vtun.sourceforge.net
endef

define Package/vtun/conffiles
/etc/vtund.conf
endef

define Build/Configure
$(call Build/Configure/Default,,LIBS="-L$(STAGING_DIR)/usr/lib" \
		BLOWFISH_HDR_DIR="$(STAGING_DIR)/usr/include/openssl" \
		LZO_HDR_DIR="$(STAGING_DIR)/usr/include/lzo" \
		SSL_HDR_DIR="$(STAGING_DIR)/usr/include/openssl")
endef

define Build/Compile	
$(call Build/Compile/Default,vtund)
endef

define Package/vtun/install	
	install -m0755 -d $(1)/etc
	install -m0600 $(PKG_BUILD_DIR)/vtund.conf $(1)/etc/
	install -m0755 -d $(1)/usr/sbin
	install -m0755 $(PKG_BUILD_DIR)/vtund $(1)/usr/sbin/
endef

$(eval $(call BuildPackage,vtun))
