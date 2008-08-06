# 
# Copyright (C) 2006 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
# $Id$

include $(TOPDIR)/rules.mk

PKG_NAME:=libexif
PKG_VERSION:=0.6.13
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.bz2
PKG_SOURCE_URL:=@SF/libexif
PKG_MD5SUM:=1b1e2b495c5aa20c08725f30545a110b

include $(INCLUDE_DIR)/package.mk

define Package/libexif
  SECTION:=libs
  CATEGORY:=Libraries
  TITLE:=library for jpeg files with exif tags
  URL:=http://libexif.sourceforge.net/
endef

define Build/Configure
	$(call Build/Configure/Default, \
		--enable-shared \
		--enable-static \
		--disable-rpath \
		--without-libiconv-prefix \
		--without-libintl-prefix \
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
	$(CP) $(PKG_INSTALL_DIR)/usr/include/libexif $(1)/usr/include/
	mkdir -p $(1)/usr/lib
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/libexif*.{a,so*} $(1)/usr/lib/
endef

define Package/libexif/install
	$(INSTALL_DIR) $(1)/usr/lib
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/libexif*.so.* $(1)/usr/lib/
endef

$(eval $(call BuildPackage,libexif))
