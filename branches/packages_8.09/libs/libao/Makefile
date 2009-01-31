# 
# Copyright (C) 2006 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
# $Id$

include $(TOPDIR)/rules.mk

PKG_NAME:=libao
PKG_VERSION:=0.8.6
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=http://downloads.xiph.org/releases/ao/
PKG_MD5SUM:=12e136a4c0995068ff134997c84421ed

include $(INCLUDE_DIR)/package.mk

define Package/libao
  SECTION:=libs
  DEPENDS:=+alsa-lib
  CATEGORY:=Libraries
  TITLE:=A cross platform audio library
  URL:=http://www.xiph.org/ao/
endef

define Package/libao/description
	Libao is a cross-platform audio library that allows programs to 
	output audio using a simple API on a wide variety of platforms.
endef

CONFIGURE_ARGS += \
	--enable-shared \
	--enable-static \
	--disable-esd \
	--disable-arts \
	--disable-nas \
	--disable-polyp

TARGET_CFLAGS += $(FPIC)

define Build/Compile
	$(MAKE) -C $(PKG_BUILD_DIR) \
		DESTDIR="$(PKG_INSTALL_DIR)" \
		all install
endef

define Build/InstallDev
	mkdir -p $(1)/usr/include
	$(CP) $(PKG_INSTALL_DIR)/usr/include/ao $(1)/usr/include/
	mkdir -p $(1)/usr/lib
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/libao.{a,so*} $(1)/usr/lib/
	mkdir -p $(1)/usr/lib/pkgconfig
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/pkgconfig/ao.pc $(1)/usr/lib/pkgconfig/
endef

define Package/libao/install
	$(INSTALL_DIR) $(1)/usr/lib
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/libao.so.* $(1)/usr/lib/
endef

$(eval $(call BuildPackage,libao))
