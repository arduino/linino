#
# Copyright (C) 2009-2011 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=xfce4-settings
PKG_VERSION:=4.6.1
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.bz2
PKG_SOURCE_URL:=http://archive.xfce.org/xfce/$(PKG_VERSION)/src/
PKG_MD5SUM:=dc1c8704471c5b0104fa10c30eb60cb6

PKG_FIXUP:=libtool
PKG_INSTALL:=1

include $(INCLUDE_DIR)/package.mk
include $(INCLUDE_DIR)/nls.mk

TARGET_LDFLAGS+= \
	-Wl,-rpath-link=$(STAGING_DIR)/usr/lib \
	-Wl,-rpath=/usr/lib

define Package/xfce4-settings
  SECTION:=xorg-app
  CATEGORY:=Xorg
  SUBMENU:=app
  TITLE:=xfce4-settings
  DEPENDS:=+libxfce4util +libxfcegui4 +libexo +xfconf +libglade +libdbus-glib \
  +libXi +libXrandr +xrdb
endef

define Package/xfce4-settings/install
	$(INSTALL_DIR) $(1)/etc/xdg/{autostart,xfce4/xfconf/xfce-perchannel-xml}
	$(INSTALL_DATA) \
		$(PKG_INSTALL_DIR)/etc/xdg/autostart/* \
		$(1)/etc/xdg/autostart/
	$(INSTALL_DATA) \
		$(PKG_INSTALL_DIR)/etc/xdg/xfce4/xfconf/xfce-perchannel-xml/* \
		$(1)/etc/xdg/xfce4/xfconf/xfce-perchannel-xml/

	$(INSTALL_DIR) $(1)/usr/bin/
	$(INSTALL_BIN) \
		$(PKG_INSTALL_DIR)/usr/bin/* \
		$(1)/usr/bin/

	$(INSTALL_DIR) $(1)/usr/share/applications
	$(INSTALL_DATA) \
		$(PKG_INSTALL_DIR)/usr/share/applications/* \
		$(1)/usr/share/applications
endef

$(eval $(call BuildPackage,xfce4-settings))
