#
# Copyright (C) 2009 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
# $Id$

include $(TOPDIR)/rules.mk

PKG_NAME:=lxshortcut
PKG_VERSION:=0.1.1
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=@SF/lxde
PKG_MD5SUM:=68419579deaecf696111bef97d3985bc
PKG_FIXUP:=libtool
PKG_INSTALL:=1

include $(INCLUDE_DIR)/package.mk
include $(INCLUDE_DIR)/nls.mk

TARGET_LDFLAGS+= \
	-Wl,-rpath-link=$(STAGING_DIR)/usr/lib

define Package/lxshortcut
  SECTION:=xorg-app
  CATEGORY:=Xorg
  SUBMENU:=app
  TITLE:=lxshortcut
  DEPENDS:=+glib2 +vte
endef

define Package/lxshortcut/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_BIN) \
		$(PKG_INSTALL_DIR)/usr/bin/lxshortcut \
		$(1)/usr/bin

	$(INSTALL_DIR) $(1)/usr/share/lxshortcut
	$(INSTALL_DATA) \
		$(PKG_INSTALL_DIR)/usr/share/lxshortcut/* \
		$(1)/usr/share/lxshortcut/

endef

$(eval $(call BuildPackage,lxshortcut))
