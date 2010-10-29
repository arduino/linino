#
# Copyright (C) 2008 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=karmen
PKG_VERSION:=0.15
PKG_RELEASE:=2

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=http://prdownloads.sourceforge.net/sourceforge/$(PKG_NAME)/
PKG_MD5SUM:=8f800b71b454d6f0de2e9dd5ad34f9e3

TARGET_LDFLAGS+= \
        -Wl,-rpath-link=$(STAGING_DIR)/usr/lib 

include $(INCLUDE_DIR)/package.mk

define Package/karmen
  TITLE:=karmen window manager
  SECTION:=xorg-wm
  CATEGORY:=Xorg
  SUBMENU:=window manager
  DEPENDS:=+libX11 +libSM +libICE +freedesktop-compliant
  URL:=http://karmen.sourceforge.net/
endef

define Package/karmen/description
  Karmen is a window manager for x, written by Johan Veenhuizen. 
  It is designed to just work. There is no configuration file and no 
  library dependencies other than Xlib/libSM/libICE. The input focus model is 
  click-to-focus. Karmen aims at icccm and ewmh compliance.
endef

define Build/Compile
	$(MAKE) -C $(PKG_BUILD_DIR) DESTDIR="$(PKG_INSTALL_DIR)" install
endef

define Package/karmen/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_BIN) \
		$(PKG_INSTALL_DIR)/usr/bin/* \
		$(1)/usr/bin/
	$(INSTALL_DIR) $(1)/etc/uci-defaults
	$(INSTALL_DATA) \
		./files/uci-defaults/x11 \
		$(1)/etc/uci-defaults/
endef

define Package/karmen/postinst
	#!/bin/sh
	[ -n "$${IPKG_INSTROOT}" ] && exit
	. /etc/functions.sh
	uci_apply_defaults
endef

$(eval $(call BuildPackage,karmen))
