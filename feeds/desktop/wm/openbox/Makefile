#
# Copyright (C) 2008 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=openbox
PKG_VERSION:=3.4.7.2
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=http://icculus.org/openbox/releases
PKG_MD5SUM:=9e7589e90519bc6ac2f4656ea6869439

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
	+libXcursor +pango +xextproto +xf86vidmodeproto +dejavu-fonts-ttf \
	+freedesktop-compliant
  URL:=http://icculus.org/openbox/
endef

define Package/openbox/description
  Openbox is a highly configurable, next generation window manager 
  with extensive standards support.
endef

define Build/Compile
	$(MAKE) -C $(PKG_BUILD_DIR) DESTDIR="$(PKG_INSTALL_DIR)" install
endef

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

	$(INSTALL_DIR) $(1)/usr/lib/openbox
	$(INSTALL_DATA) \
		$(PKG_INSTALL_DIR)/usr/lib/openbox/* \
		$(1)/usr/lib/openbox/

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
	$(INSTALL_DIR) $(1)/usr/include/openbox/3.4/openbox
	$(INSTALL_DATA) \
		$(PKG_INSTALL_DIR)/usr/include/openbox/3.4/openbox/* \
		$(1)/usr/include/openbox/3.4/openbox/

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

	$(INSTALL_DIR) $(1)/usr/lib/openbox
	$(INSTALL_DATA) \
		$(PKG_INSTALL_DIR)/usr/lib/openbox/* \
		$(1)/usr/lib/openbox/

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
