#
# Copyright (C) 2008 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
# $Id$

include $(TOPDIR)/rules.mk

PKG_NAME:=libpthread-stubs
PKG_VERSION:=0.1
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.bz2
PKG_SOURCE_URL:=http://xcb.freedesktop.org/dist/
PKG_MD5SUM:=
PKG_INSTALL:=1

include $(INCLUDE_DIR)/package.mk


define Package/libpthread-stubs
  SECTION:=libs
  CATEGORY:=Libraries
  TITLE:=libpthread-stubs
  URL:=http://xcb.freedesktop.org/
endef

define Package/libpthread-stubs/description
endef

define Build/InstallDev
	$(INSTALL_DIR) $(1)/usr/lib/pkgconfig
	$(INSTALL_DATA) \
		$(PKG_INSTALL_DIR)/usr/lib/pkgconfig/* \
		$(1)/usr/lib/pkgconfig/
endef

define Package/libpthread-stubs/install
	true
endef

$(eval $(call BuildPackage,libpthread-stubs))
