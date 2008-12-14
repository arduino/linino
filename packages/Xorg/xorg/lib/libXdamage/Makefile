#
# Copyright (C) 2008 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
# $Id$

include $(TOPDIR)/rules.mk

PKG_NAME:=libXdamage
PKG_RELEASE:=1
PKG_VERSION:=1.1.1
PKG_SOURCE_URL:=http://xorg.freedesktop.org/releases/X11R7.4/src/lib/
PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.bz2
PKG_BUILD_DIR=$(BUILD_DIR)/Xorg/$(_CATEGORY)/$(PKG_NAME)-$(PKG_VERSION)/
PKG_FIXUP:=libtool
PKG_BUILD_DEPENDS:=xproto xextproto fixesproto

include $(INCLUDE_DIR)/package.mk

PKG_INSTALL:=1

define Package/libXdamage
  SECTION:=xorg-lib
  CATEGORY:=Xorg
  SUBMENU:=lib
  DEPENDS:=+libX11 +libXfixes
  TITLE:=libXdamage
  URL:=http://xorg.freedesktop.org/
endef

define Package/libXdamage/install
	$(INSTALL_DIR) $(1)/usr/lib
	$(INSTALL_DATA) \
		$(PKG_INSTALL_DIR)/usr/lib/*.so* \
		$(1)/usr/lib/
endef

define Build/InstallDev
	$(INSTALL_DIR) $(1)
	$(CP) $(PKG_INSTALL_DIR)/* $(1)/
endef

$(eval $(call BuildPackage,libXdamage))
