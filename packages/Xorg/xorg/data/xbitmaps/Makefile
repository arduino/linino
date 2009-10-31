#
# Copyright (C) 2008 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=xbitmaps
PKG_RELEASE:=1
PKG_VERSION:=1.1.0

PKG_SOURCE_URL:=http://xorg.freedesktop.org/releases/X11R7.5/src/data/
PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.bz2
PKG_BUILD_DIR:=$(BUILD_DIR)/Xorg/$(PKG_NAME)-$(PKG_VERSION)/

PKG_MD5SUM:=f9ddd4e70a5375508b3acaf17be0d0ab
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

define Package/xbitmaps/install
	$(INSTALL_DIR) $(1)/usr/include/X11/bitmaps
	$(INSTALL_DATA) \
		$(PKG_INSTALL_DIR)/usr/include/X11/bitmaps/* \
		$(1)/usr/include/X11/bitmaps
endef

$(eval $(call BuildPackage,xbitmaps))
