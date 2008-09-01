# 
# Copyright (C) 2008 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=cairo
PKG_VERSION:=1.6.4
PKG_RELEASE:=2

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=http://cairographics.org/releases/
PKG_MD5SUM:=a198d509f9e3a35b78de8bb02174ebb9
PKG_FIXUP:=libtool

include $(INCLUDE_DIR)/package.mk

define Package/cairo
  SECTION:=xorg-libs
  CATEGORY:=Xorg
  SUBMENU:=libraries
  TITLE:=Multi-platform 2D graphics library
  DEPENDS:=+xorg-server-essentials +fontconfig +libpng +libexpat +pixman
endef

define Package/cairo/description
Cairo is a 2D graphics library. The cairo API provides operations similar
to the drawing operators of PostScript and PDF. Operations in cairo
include stroking and filling cubic Bézier splines, transforming and
compositing translucent images, and antialiased text rendering. All
drawing operations can be transformed by any affine transformation
(scale, rotation, shear, etc.).
endef

CONFIGURE_VARS+=FONTCONFIG_LIBS="-lfreetype -lfontconfig -lz -lexpat"
CONFIGURE_ARGS+=--enable-freetype=yes
TARGET_CFLAGS+=-L$(STAGING_DIR)/usr/lib

define Build/Compile
	$(MAKE) -C $(PKG_BUILD_DIR)
	$(MAKE) -C $(PKG_BUILD_DIR)/ install DESTDIR=$(PKG_INSTALL_DIR)
endef

define Build/InstallDev
	$(INSTALL_DIR) $(1)/usr/lib/
	$(INSTALL_DATA) $(PKG_INSTALL_DIR)/usr/lib/*.{so*,la} $(1)/usr/lib/
	$(INSTALL_DIR) $(1)/usr/lib/pkgconfig/
	$(INSTALL_DATA) $(PKG_INSTALL_DIR)/usr/lib/pkgconfig/* $(1)/usr/lib/pkgconfig/
	$(INSTALL_DIR) $(1)/usr/include/cairo/
	$(INSTALL_DATA) $(PKG_INSTALL_DIR)/usr/include/cairo/* $(1)/usr/include/cairo/
endef

define Package/cairo/install
	$(INSTALL_DIR) $(1)/usr/lib/
	$(INSTALL_DATA) $(PKG_INSTALL_DIR)/usr/lib/*.{so*,a} $(1)/usr/lib/
endef

$(eval $(call BuildPackage,cairo))
