#
# Copyright (C) 2009 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
# $Id$

include $(TOPDIR)/rules.mk

PKG_NAME:=lxmenu-data
PKG_VERSION:=0.1.1
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=@SF/lxde
PKG_MD5SUM:=cee3181dd22088f3db0e99ffbedc986d
PKG_FIXUP:=libtool
PKG_INSTALL:=1

include $(INCLUDE_DIR)/package.mk
include $(INCLUDE_DIR)/nls.mk

TARGET_LDFLAGS+= \
	-Wl,-rpath-link=$(STAGING_DIR)/usr/lib

define Package/lxmenu-data
  SECTION:=xorg-app
  CATEGORY:=Xorg
  SUBMENU:=app
  TITLE:=lxmenu-data
endef

define Package/lxmenu-data/install
	$(INSTALL_DIR) $(1)/usr/share/desktop-directories
	$(INSTALL_DATA) \
		$(PKG_INSTALL_DIR)/usr/share/desktop-directories/* \
		$(1)/usr/share/desktop-directories/

	$(INSTALL_DIR) $(1)/etc/xdg/menus
	$(INSTALL_DATA) \
		$(PKG_INSTALL_DIR)/etc/xdg/menus/* \
		$(1)/etc/xdg/menus/
endef

$(eval $(call BuildPackage,lxmenu-data))
