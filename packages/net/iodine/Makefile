#
# Copyright (C) 2006 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
# $Id: $

include $(TOPDIR)/rules.mk

PKG_NAME:=iodine
PKG_VERSION:=0.3.4
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=http://code.kryo.se/iodine/
PKG_MD5SUM:=dfbc5037fe0229e15f6f15775117aef5
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
		OS=Linux \
		CFLAGS="$(TARGET_CFLAGS) -I$(STAGING_DIR)/usr/include -c -DLinux" \
		LDFLAGS="-L$(STAGING_DIR)/usr/lib -lz" \
		iodine iodined \
	)
endef

define Package/iodine/install
	$(INSTALL_DIR) $(1)/usr/sbin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/iodine $(1)/usr/sbin
endef

define Package/iodined/install
	$(INSTALL_DIR) $(1)/usr/sbin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/iodined $(1)/usr/sbin
endef

$(eval $(call BuildPackage,iodine))
$(eval $(call BuildPackage,iodined))
