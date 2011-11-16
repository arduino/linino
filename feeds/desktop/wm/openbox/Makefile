#
# Copyright (C) 2008-2011 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=openbox
OB_VERSION:=3.5
OB_PATCH:=0
PKG_VERSION:=$(OB_VERSION).$(OB_PATCH)
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=http://icculus.org/openbox/releases
PKG_MD5SUM:=00441b53cf14c03566c8e82643544ff9

PKG_INSTALL:=1
PKG_BUILD_PARALLEL:=1

include $(INCLUDE_DIR)/package.mk
include $(INCLUDE_DIR)/nls.mk

TARGET_LDFLAGS+= \
        -Wl,-rpath-link=$(STAGING_DIR)/usr/lib

define Package/openbox
  TITLE:=The Openbox Window Manager
  SECTION:=xorg-wm
  CATEGORY:=Xorg
  SUBMENU:=window manager
  DEPENDS:=+glib2 +libxml2 +fontconfig +libXft +libXrandr +libXt \
	+libXcursor +pango +xextproto +xf86vidmodeproto +freedesktop-compliant \
	+imlib2 +libXcursor \
	+dejavu-fonts-ttf \
	+dejavu-fonts-ttf-DejaVuSans \
	+dejavu-fonts-ttf-DejaVuSans-Bold \
	+dejavu-fonts-ttf-DejaVuSerif \
	+dejavu-fonts-ttf-DejaVuSerif-Bold \
	+dejavu-fonts-ttf-DejaVuSerif-Italic
  URL:=http://icculus.org/openbox/
endef

define Package/openbox/description
  Openbox is a highly configurable, next generation window manager 
  with extensive standards support.
endef

CONFIGURE_ARGS+= \
	--disable-startup-notification

define Package/openbox/install
	$(INSTALL_DIR) $(1)/etc/xdg/openbox
	$(INSTALL_DATA) \
		$(PKG_INSTALL_DIR)/etc/xdg/openbox/* \
		$(1)/etc/xdg/openbox/

	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_BIN) \
		$(PKG_INSTALL_DIR)/usr/bin/openbox \
		$(1)/usr/bin/
	$(INSTALL_BIN) \
		$(PKG_INSTALL_DIR)/usr/bin/openbox-session \
		$(1)/usr/bin/

	$(INSTALL_DIR) $(1)/usr/lib
	$(INSTALL_DATA) \
		$(PKG_INSTALL_DIR)/usr/lib/*.so \
		$(1)/usr/lib/
	$(INSTALL_DATA) \
		$(PKG_INSTALL_DIR)/usr/lib/*.so.* \
		$(1)/usr/lib/
	$(INSTALL_DATA) \
		$(PKG_INSTALL_DIR)/usr/lib/openbox-* \
		$(1)/usr/lib/

	$(INSTALL_DIR) $(1)/usr/share/pixmaps
	$(INSTALL_DATA) \
		$(PKG_INSTALL_DIR)/usr/share/pixmaps/* \
		$(1)/usr/share/pixmaps/

	$(INSTALL_DIR) $(1)/usr/share/themes
	$(CP) \
		$(PKG_INSTALL_DIR)/usr/share/themes/* \
		$(1)/usr/share/themes/
endef

define Build/InstallDev
	$(INSTALL_DIR) $(1)/usr/include/openbox/$(OB_VERSION)/
	$(CP) \
		$(PKG_INSTALL_DIR)/usr/include/openbox/$(OB_VERSION)/* \
		$(1)/usr/include/openbox/$(OB_VERSION)/

	$(INSTALL_DIR) $(1)/usr/lib
	$(INSTALL_DATA) \
		$(PKG_INSTALL_DIR)/usr/lib/*.so \
		$(1)/usr/lib/
	$(INSTALL_DATA) \
		$(PKG_INSTALL_DIR)/usr/lib/*.so.* \
		$(1)/usr/lib/
	$(INSTALL_DATA) \
		$(PKG_INSTALL_DIR)/usr/lib/*.la \
		$(1)/usr/lib/
	$(INSTALL_DATA) \
		$(PKG_INSTALL_DIR)/usr/lib/openbox-* \
		$(1)/usr/lib/

	$(INSTALL_DIR) $(1)/usr/lib/pkgconfig/
	$(INSTALL_DATA) \
		$(PKG_INSTALL_DIR)/usr/lib/pkgconfig/* \
		$(1)/usr/lib/pkgconfig/

	$(INSTALL_DIR) $(1)/etc/uci-defaults
	$(INSTALL_DATA) \
		./files/uci-defaults/* \
		$(1)/etc/uci-defaults/
endef

define Package/openbox/postinst
	#!/bin/sh
	[ -n "$${IPKG_INSTROOT}" ] && exit
	. /etc/functions.sh
	uci_apply_defaults
endef

$(eval $(call BuildPackage,openbox))
