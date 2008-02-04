#
# Copyright (C) 2006 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
# $Id: Makefile 9695 2007-12-09 18:59:01Z nbd $

include $(TOPDIR)/rules.mk

PKG_NAME:=siproxd
PKG_VERSION:=0.7.0
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=@SF/siproxd
PKG_MD5SUM:=6c978eef0d00160e50073e2e2fd8c23d

PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)-$(PKG_VERSION)
PKG_INSTALL_DIR:=$(PKG_BUILD_DIR)/ipkg-install

include $(INCLUDE_DIR)/package.mk

define Package/siproxd
  SECTION:=net
  CATEGORY:=Network
  DEPENDS:=+libosip2
  TITLE:=SIP (Session Initiation Protocol) proxy
  URL:=http://siproxd.sourceforge.net/
endef

#define Package/siproxd/conffiles
#/etc/siproxd.conf
#endef

# uses GNU configure

define Build/Compile
	$(MAKE) -C $(PKG_BUILD_DIR) \
		DESTDIR="$(PKG_INSTALL_DIR)" \
		SUBDIRS="src scripts contrib" \
		all install
endef

define Package/siproxd/install
	$(INSTALL_DIR) $(1)/usr/sbin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/usr/sbin/siproxd $(1)/usr/sbin/
#	$(INSTALL_DIR) $(1)/etc
#	$(INSTALL_DATA) $(PKG_BUILD_DIR)/doc/siproxd.conf.example $(1)/etc/siproxd.conf
#	$(INSTALL_CONF) $(PKG_BUILD_DIR)/doc/siproxd_passwd.cfg $(1)/etc/
	$(INSTALL_DIR) $(1)/etc/config
	$(INSTALL_DATA) ./files/siproxd.config $(1)/etc/config/siproxd
	$(INSTALL_DIR) $(1)/etc/init.d
	$(INSTALL_BIN) ./files/siproxd.init $(1)/etc/init.d/siproxd
endef

$(eval $(call BuildPackage,siproxd))
