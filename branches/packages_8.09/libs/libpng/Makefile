# 
# Copyright (C) 2006-2009 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
# $Id$

include $(TOPDIR)/rules.mk

PKG_NAME:=libpng
PKG_VERSION:=1.2.29
PKG_RELEASE:=1.2

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.bz2
PKG_SOURCE_URL:=@SF/libpng
PKG_MD5SUM:=f588cb4ee39e3a333604096f937ea157

include $(INCLUDE_DIR)/package.mk

define Package/libpng
  SECTION:=libs
  CATEGORY:=Libraries
  DEPENDS:=+zlib
  TITLE:=A PNG format files handling library
  URL:=http://www.libpng.org/pub/png/libpng.html
endef

define Build/Configure
	$(call Build/Configure/Default, \
		--enable-shared \
		--enable-static \
		--with-zlib="$(STAGING_DIR)/usr" \
	)
endef

TARGET_CFLAGS += $(FPIC)

define Build/Compile
	$(MAKE) -C $(PKG_BUILD_DIR) \
		DESTDIR="$(PKG_INSTALL_DIR)" \
		all install
endef

define Build/InstallDev
	mkdir -p $(2)/bin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/usr/bin/libpng{,12}-config $(2)/bin/
	mkdir -p $(1)/usr/include
	$(CP) $(PKG_INSTALL_DIR)/usr/include/png{,conf}.h $(1)/usr/include/
	$(CP) $(PKG_INSTALL_DIR)/usr/include/libpng12 $(1)/usr/include/
	mkdir -p $(1)/usr/lib
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/libpng{,12}.{a,so*} $(1)/usr/lib/
	mkdir -p $(1)/usr/lib/pkgconfig
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/pkgconfig/libpng{,12}.pc $(1)/usr/lib/pkgconfig/
	$(SED) 's,^[ILR]_opts=".\+",,g' $(2)/bin/libpng*-config
endef

define Package/libpng/install
	$(INSTALL_DIR) $(1)/usr/lib
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/libpng{,12}.so.* $(1)/usr/lib/
endef

$(eval $(call BuildPackage,libpng))
