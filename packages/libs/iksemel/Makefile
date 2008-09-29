# 
# Copyright (C) 2006 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
# $Id$

include $(TOPDIR)/rules.mk

PKG_NAME:=iksemel
PKG_VERSION:=1.3
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=http://iksemel.googlecode.com/files/
PKG_MD5SUM:=36ab2d9f11980a19217b6f79a19ef8e7

PKG_FIXUP = libtool

include $(INCLUDE_DIR)/package.mk

define Package/libiksemel
  SECTION:=libs
  CATEGORY:=Libraries
  TITLE:=Iksemel Jabber Library
  URL:=http://code.google.com/p/iksemel/
  DEPENDS:= +libgnutls +libtasn1
endef

TARGET_CFLAGS += $(FPIC)

CONFIGURE_ARGS += \
	--enable-shared \
	--enable-static \
	--with-libgnutls-prefix="$(STAGING_DIR)/usr" \

CONFIGURE_VARS += \
	LIBS="-L$(STAGING_DIR)/usr/lib -Wl,-rpath-link,$(STAGING_DIR)/usr/lib -lgnutls -lgcrypt -lgpg-error" \

define Build/Compile
	$(MAKE) -C $(PKG_BUILD_DIR) DESTDIR="$(PKG_INSTALL_DIR)" all install
endef

define Build/InstallDev
	mkdir -p $(1)/usr/include/
	$(CP) $(PKG_INSTALL_DIR)/usr/include/iksemel.h $(1)/usr/include/
	mkdir -p $(1)/usr/lib
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/libiksemel.{a,so*} $(1)/usr/lib/
	mkdir -p $(1)/usr/lib/pkgconfig
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/pkgconfig/iksemel.pc $(1)/usr/lib/pkgconfig/
endef

define Package/libiksemel/install
	$(INSTALL_DIR) $(1)/usr/lib
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/libiksemel.so.* $(1)/usr/lib/
endef

$(eval $(call BuildPackage,libiksemel))
