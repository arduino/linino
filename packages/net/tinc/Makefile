#
# Copyright (C) 2006 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
# $Id$

include $(TOPDIR)/rules.mk

PKG_NAME:=tinc
PKG_VERSION:=1.0.4
PKG_RELEASE:=1
PKG_MD5SUM:=63887373dd763f8d90cecc5a3616c363

PKG_SOURCE_URL:=http://www.tinc-vpn.org/packages \
	http://ftp.yi.se/pub/tinc/ \
	http://www.mirrors.wiretapped.net/security/network-security/tinc/
PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_CAT:=zcat

PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)-$(PKG_VERSION)
PKG_INSTALL_DIR:=$(PKG_BUILD_DIR)/ipkg-install

include $(INCLUDE_DIR)/package.mk

define Package/tinc
  SECTION:=net
  CATEGORY:=Network
  DEPENDS:=+liblzo +libopenssl +zlib
  TITLE:=VPN tunneling daemon
  DESCRIPTION:=A VPN tunneling daemon
  URL:=http://www.tinc-vpn.org/
endef

define Build/Configure
$(call Build/Configure/Default,--with-kernel=$(LINUX_DIR) \
		  --with-zlib=$(STAGING_DIR)/usr/ \
		  --with-lzo-include=$(STAGING_DIR)/usr/include/lzo \
)
endef

define Build/Compile
$(call Build/Compile/Default,CC="$(TARGET_CC)" \
		CFLAGS="$(TARGET_CFLAGS)" \
		DESTDIR="$(PKG_INSTALL_DIR)" \
		all install)
endef

define Package/tinc/install	
	install -m0755 -d $(1)/usr/sbin
	$(CP) $(PKG_INSTALL_DIR)/usr/sbin/tincd $(1)/usr/sbin/
endef

$(eval $(call BuildPackage,tinc))
