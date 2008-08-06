# 
# Copyright (C) 2006 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
# $Id$

include $(TOPDIR)/rules.mk

PKG_NAME:=libmcrypt
PKG_VERSION:=2.5.7
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=@SF/mcrypt
PKG_MD5SUM:=b1be163143f8e8ed0474beeb642b3bad

include $(INCLUDE_DIR)/package.mk

define Package/libmcrypt
  SECTION:=libs
  CATEGORY:=Libraries
  TITLE:=Cryptographic library
  URL:=http://mcrypt.sourceforge.net/
endef

define Package/libmcrypt/description
	libmcrypt is a cryptographic library that conveniently brings 
	together a variety of ciphers for convenient use.
endef

define Build/Configure
	$(call Build/Configure/Default, \
		--enable-shared \
		--enable-static \
	)
endef

TARGET_CFLAGS += $(FPIC)

define Build/Compile
	$(MAKE) -C $(PKG_BUILD_DIR) \
		DESTDIR="$(PKG_INSTALL_DIR)" \
		all install
endef

define Build/InstallDev
	mkdir -p $(1)/usr/include
	$(CP) $(PKG_INSTALL_DIR)/usr/include/mcrypt.h $(1)/usr/include/
	mkdir -p $(1)/usr/lib
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/libmcrypt.{a,so*} $(1)/usr/lib/
	mkdir -p $(1)/usr/bin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/usr/bin/libmcrypt-config $(1)/usr/bin/
	$(SED) 's,-I$$$${prefix}/include,,g' $(1)/usr/bin/libmcrypt-config
	$(SED) 's,-L$$$${exec_prefix}/lib,,g' $(1)/usr/bin/libmcrypt-config
endef

define Package/libmcrypt/install
	$(INSTALL_DIR) $(1)/usr/lib
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/libmcrypt.so.* $(1)/usr/lib/
endef

$(eval $(call BuildPackage,libmcrypt))
