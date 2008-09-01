# 
# Copyright (C) 2008 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=pixman
PKG_VERSION:=0.11.8
PKG_RELEASE:=2

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=http://cairographics.org/releases/
PKG_MD5SUM:=7b5db768c51337b5e5e954fc9c961cd3
PKG_FIXUP:=libtool

include $(INCLUDE_DIR)/package.mk

EXTRA_LDFLAGS:="-Wl,-rpath-link=$(STAGING_DIR)/usr/lib"
TARGET_CFLAGS+=-I$(STAGING_DIR)/usr/include/gtk-2.0/gdk

define Package/pixman
  SECTION:=xorg-libs
  CATEGORY:=Xorg
  SUBMENU:=libraries
  TITLE:=pixman
endef

define Package/pixman/description
pixman is a library that provides low-level pixel manipulation
features such as image compositing and trapezoid rasterization.
endef

define Build/Compile
	$(MAKE) -C $(PKG_BUILD_DIR)
	$(MAKE) -C $(PKG_BUILD_DIR)/ install DESTDIR=$(PKG_INSTALL_DIR)
endef

define Build/InstallDev
	$(INSTALL_DIR) $(1)
	$(CP) $(PKG_INSTALL_DIR)/* $(1)/
endef

define Package/pixman/install
	$(INSTALL_DIR) $(1)/usr/lib
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/lib*so* $(1)/usr/lib/
endef

$(eval $(call BuildPackage,pixman))
