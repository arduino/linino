#
# Copyright (C) 2008 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=xbitmaps
PKG_RELEASE:=2
PKG_VERSION:=1.0.1

PKG_SOURCE_URL:=http://xorg.freedesktop.org/releases/X11R7.4/src/data/
PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.bz2
PKG_BUILD_DIR=$(BUILD_DIR)/Xorg/$(_CATEGORY)/$(PKG_NAME)-$(PKG_VERSION)/
PKG_MD5SUM:=b28a9840cde3c38d7c09716372fea257
PKG_INSTALL:=1

include $(INCLUDE_DIR)/package.mk

define Package/xbitmaps
  SECTION:=xorg-data
  CATEGORY:=Xorg
  SUBMENU:=data
  TITLE:=xbitmaps
  URL:=http://xorg.freedesktop.org/
endef

define Build/InstallDev
	$(INSTALL_DIR) $(1)/usr/{lib/pkgconfig,include/X11/bitmaps}
	$(INSTALL_DATA) \
		$(PKG_INSTALL_DIR)/usr/lib/pkgconfig/* \
		$(1)/usr/lib/pkgconfig/
	$(INSTALL_DATA) \
		$(PKG_INSTALL_DIR)/usr/include/X11/bitmaps/* \
		$(1)/usr/include/X11/bitmaps/
endef

define Package/xbitmaps/install/Default
	$(INSTALL_DIR) $(1)/usr/include/X11/bitmaps
	$(INSTALL_DATA) \
		$(PKG_INSTALL_DIR)/usr/include/X11/bitmaps/* \
		$(1)/usr/include/X11/bitmaps
endef

$(eval $(call BuildPackage,xbitmaps))
