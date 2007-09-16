#
# Copyright (C) 2006 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
# $Id$

include $(TOPDIR)/rules.mk

PKG_NAME:=iodine
PKG_VERSION:=0.4.0
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=http://code.kryo.se/iodine/
PKG_MD5SUM:=82d331f75a99d1547e0ccc3c3efd0a7a
PKG_CAT:=zcat

PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)-$(PKG_VERSION)
PKG_INSTALL_DIR:=$(PKG_BUILD_DIR)/ipkg-install

include $(INCLUDE_DIR)/package.mk

define Package/iodine/Default
  SECTION:=net
  CATEGORY:=Network
  DEPENDS:=+zlib
  TITLE:=IP over DNS tunneling
  URL:=http://code.kryo.se/iodine/
  DESCRIPTION:=\
	iodine
endef

define Package/iodine
  $(call Package/iodine/Default)
  TITLE+= client version
  DESCRIPTION+= client version
endef

define Package/iodined
  $(call Package/iodine/Default)
  TITLE+= server version
  DESCRIPTION+= server version
endef

define Build/Configure
endef

define Build/Compile
	$(call Build/Compile/Default,\
		CFLAGS="$(TARGET_CFLAGS) -I$(STAGING_DIR)/usr/include -c -DLINUX" \
		LDFLAGS="-L$(STAGING_DIR)/usr/lib -lz" \
		all \
	)
endef

define Package/iodine/install
	$(INSTALL_DIR) $(1)/usr/sbin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/bin/iodine $(1)/usr/sbin
endef

define Package/iodined/install
	$(INSTALL_DIR) $(1)/etc/init.d
	$(INSTALL_BIN) ./files/iodined.init $(1)/etc/init.d/iodined
	$(INSTALL_DIR) $(1)/etc/config
	$(INSTALL_DATA) ./files/iodined.config $(1)/etc/config/iodined
	$(INSTALL_DIR) $(1)/usr/sbin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/bin/iodined $(1)/usr/sbin
endef

$(eval $(call BuildPackage,iodine))
$(eval $(call BuildPackage,iodined))
