#
# Copyright (C) 2009-2011 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=xfwm4
PKG_VERSION:=4.6.1
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.bz2
PKG_SOURCE_URL:=http://archive.xfce.org/xfce/$(PKG_VERSION)/src/
PKG_MD5SUM:=538ff2554a23bf877d336e573884da9a

PKG_FIXUP:=libtool
PKG_INSTALL:=1

include $(INCLUDE_DIR)/package.mk
include $(INCLUDE_DIR)/nls.mk

TARGET_LDFLAGS+= \
	-Wl,-rpath-link=$(STAGING_DIR)/usr/lib \
	-Wl,-rpath=/usr/lib

define Package/xfwm4
  SECTION:=xorg-app
  CATEGORY:=Xorg
  SUBMENU:=app
  TITLE:=xfwm4
  DEPENDS:=+libxfce4util +libxfcegui4 +libxfconf +libdbus-glib +libwnck +freedesktop-compliant
endef

define Package/xfwm4/install
	$(INSTALL_DIR) $(1)/usr/lib/xfce4/xfwm4
	$(INSTALL_BIN) \
		$(PKG_INSTALL_DIR)/usr/lib/xfce4/xfwm4/helper-dialog \
		$(1)/usr/lib/xfce4/xfwm4/

	$(INSTALL_DIR) $(1)/usr/bin/
	$(INSTALL_BIN) \
		$(PKG_INSTALL_DIR)/usr/bin/* \
		$(1)/usr/bin/

	$(INSTALL_DIR) $(1)/usr/share/icons/hicolor
	$(CP) \
		$(PKG_INSTALL_DIR)/usr/share/icons/hicolor/* \
		$(1)/usr/share/icons/hicolor/

	$(INSTALL_DIR) $(1)/usr/share/applications
	$(INSTALL_DATA) \
		$(PKG_INSTALL_DIR)/usr/share/applications/* \
		$(1)/usr/share/applications/

	$(INSTALL_DIR) $(1)/usr/share/themes
	$(CP) \
		$(PKG_INSTALL_DIR)/usr/share/themes/* \
		$(1)/usr/share/themes/

	$(INSTALL_DIR) $(1)/usr/share/xfwm4
	$(INSTALL_DATA) \
		$(PKG_INSTALL_DIR)/usr/share/xfwm4/* \
		$(1)/usr/share/xfwm4/

	$(INSTALL_DIR) $(1)/etc/uci-defaults
	$(INSTALL_DATA) \
		./files/uci-defaults/x11 \
		$(1)/etc/uci-defaults/
endef

define Package/xfwm4/postinst
	#!/bin/sh
	[ -n "$${IPKG_INSTROOT}" ] && exit
	. /etc/functions.sh
	uci_apply_defaults
endef

$(eval $(call BuildPackage,xfwm4))
