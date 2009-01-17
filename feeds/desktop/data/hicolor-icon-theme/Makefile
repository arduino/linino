#
# Copyright (C) 2009 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
# $Id$

include $(TOPDIR)/rules.mk

PKG_NAME:=hicolor-icon-theme
PKG_VERSION:=0.10
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=http://icon-theme.freedesktop.org/releases/
PKG_MD5SUM:=3534f7b8e59785c7d5bfa923e85510a7
PKG_INSTALL:=1

include $(INCLUDE_DIR)/package.mk

define Package/hicolor-icon-theme
  SECTION:=xorg-data
  CATEGORY:=Xorg
  SUBMENU:=data
  TITLE:=freedesktop.org icon theme default layout
  URL:=http://icon-theme.freedesktop.org/wiki/HicolorTheme
endef

define Package/hicolor-icon-theme/install
	$(INSTALL_DIR) $(1)/usr/share/icons
	$(CP) $(PKG_INSTALL_DIR)/usr/share/icons/* $(1)/usr/share/icons/
endef

$(eval $(call BuildPackage,hicolor-icon-theme))
