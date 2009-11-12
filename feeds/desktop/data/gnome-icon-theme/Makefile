#
# Copyright (C) 2008 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
# $Id$

include $(TOPDIR)/rules.mk

PKG_NAME:=gnome-icon-theme
PKG_VERSION:=2.28.0
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.bz2
PKG_SOURCE_URL:=@GNOME/$(PKG_NAME)/2.28
PKG_MD5SUM:=

PKG_BUILD_DEPENDS:=icon-naming-utils intltool/host

PKG_INSTALL=1

include $(INCLUDE_DIR)/package.mk

define Package/gnome-icon-theme
  SECTION:=xorg-data
  CATEGORY:=Xorg
  SUBMENU:=data
  TITLE:=gnome-icon-theme
  DEPENDS:=+hicolor-icon-theme
endef

define Build/InstallDev
	$(INSTALL_DIR) $(1)/usr/lib/pkgconfig
	$(INSTALL_DATA) \
		$(PKG_INSTALL_DIR)/usr/share/pkgconfig/* \
		$(1)/usr/lib/pkgconfig/
endef

define Package/gnome-icon-theme/install
	$(INSTALL_DIR) $(1)/usr/share/icons/gnome
	$(CP) \
		$(PKG_INSTALL_DIR)/usr/share/icons/gnome/* \
		$(1)/usr/share/icons/gnome/
endef

$(eval $(call BuildPackage,gnome-icon-theme))
