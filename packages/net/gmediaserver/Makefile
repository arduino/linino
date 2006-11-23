#
# Copyright (C) 2006 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
# $Id$

include $(TOPDIR)/rules.mk

PKG_NAME:=gmediaserver
PKG_VERSION:=0.9.0
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=http://savannah.nongnu.org/download/gmediaserver/
PKG_MD5SUM:=93de0f8dcbc1353a0d0dd5b5ab4b3142
PKG_CAT:=zcat

PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)-$(PKG_VERSION)
PKG_INSTALL_DIR:=$(PKG_BUILD_DIR)/ipkg-install

include $(INCLUDE_DIR)/package.mk

define Package/gmediaserver
  SECTION:=net
  CATEGORY:=Network
  DEPENDS:=+id3lib +libupnp
  TITLE:=An UPnP music media server
  URL:=http://www.nongnu.org/gmediaserver/
endef

define Build/Configure
	$(call Build/Configure/Default, \
		--disable-rpath \
		--with-id3lib="$(STAGING_DIR)/usr" \
		--with-libupnp="$(STAGING_DIR)/usr" \
		, \
		LIBS=" -lixml -lthreadutil -lupnp -luClibc++ -lz" \
		am_cv_func_iconv=no \
	)
endef

define Build/Compile
	$(MAKE) -C $(PKG_BUILD_DIR) \
		DESTDIR="$(PKG_INSTALL_DIR)" \
		all install
endef

define Package/gmediaserver/install
	$(INSTALL_DIR) $(1)/usr/sbin
	$(CP) $(PKG_INSTALL_DIR)/usr/bin/gmediaserver $(1)/usr/sbin/
	$(INSTALL_DIR) $(1)/etc/default
	$(INSTALL_DATA) ./files/gmediaserver.default $(1)/etc/default/gmediaserver
	$(INSTALL_DIR) $(1)/etc/init.d
	$(INSTALL_BIN) ./files/gmediaserver.init $(1)/etc/init.d/gmediaserver
endef

$(eval $(call BuildPackage,gmediaserver))
