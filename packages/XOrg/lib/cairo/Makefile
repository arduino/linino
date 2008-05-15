# 
# Copyright (C) 2008 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=cairo
PKG_VERSION:=1.6.4
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=http://cairographics.org/releases/
PKG_FIXUP = libtool
PKG_MD5SUM:=a198d509f9e3a35b78de8bb02174ebb9

include $(INCLUDE_DIR)/package.mk

define Package/cairo
  SECTION:=xorg-libs
  CATEGORY:=Xorg
  SUBMENU:=libraries
  TITLE:=2D graphics library with support for multiple output devices
  DEPENDS:=+xorg-server-essentials +fontconfig +libpng +libexpat
endef

CONFIGURE_VARS += FONTCONFIG_LIBS="-lfreetype -lfontconfig -lz -lexpat"
CONFIGURE_ARGS += --enable-freetype=yes
TARGET_CFLAGS += -L$(STAGING_DIR)/usr/lib

define Build/Compile
	$(MAKE) -C $(PKG_BUILD_DIR)
	$(MAKE) -C $(PKG_BUILD_DIR)/ install DESTDIR=$(PKG_INSTALL_DIR)
endef

define Build/InstallDev
	$(INSTALL_DIR) $(1)
	$(CP) $(PKG_INSTALL_DIR)/* $(1)/
	$(SED) "s,-L/usr/local/lib,,g" $(1)/usr/lib/libcairo.la
	$(SED) "s,/usr/lib/libfontconfig.la,$(STAGING_DIR)/usr/lib/libfontconfig.la,g" $(1)/usr/lib/libcairo.la
	$(SED)  "s,$(STAGING_DIR)$(STAGING_DIR),$(STAGING_DIR),g" $(1)/usr/lib/libcairo.la
endef

define Package/cairo/Install
	$(INSTALL_DIR) $(1)/usr/lib
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/lib*so* $(1)/usr/lib/
endef

$(eval $(call BuildPackage,cairo))
