#
# Copyright (C) 2009-2011 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=orage
PKG_VERSION:=4.6.1
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.bz2
PKG_SOURCE_URL:=http://archive.xfce.org/xfce/$(PKG_VERSION)/src/
PKG_MD5SUM:=24fa43dd86ec5af5a4766620fd972cf2

PKG_FIXUP:=libtool
PKG_INSTALL:=1

include $(INCLUDE_DIR)/package.mk
include $(INCLUDE_DIR)/nls.mk

TARGET_LDFLAGS+= \
	-Wl,-rpath-link=$(STAGING_DIR)/usr/lib \
	-Wl,-rpath=/usr/lib

define Package/orage
  SECTION:=xorg-app
  CATEGORY:=Xorg
  SUBMENU:=app
  TITLE:=orage
  DEPENDS:=+perl +xfce4-panel
endef

define Package/orage/install
	$(INSTALL_DIR) $(1)/usr/lib/xfce4/panel-plugins
	$(INSTALL_BIN) \
		$(PKG_INSTALL_DIR)/usr/lib/xfce4/panel-plugins/* \
		$(1)/usr/lib/xfce4/panel-plugins/

	$(INSTALL_DIR) $(1)/usr/bin/
	$(INSTALL_BIN) \
		$(PKG_INSTALL_DIR)/usr/bin/* \
		$(1)/usr/bin/

	$(INSTALL_DIR) $(1)/usr/share/icons/*
	$(CP) \
		$(PKG_INSTALL_DIR)/usr/share/icons/* \
		$(1)/usr/share/icons/

	$(INSTALL_DIR) $(1)/usr/share/xfce4/panel-plugins/*
	$(INSTALL_DATA) \
		$(PKG_INSTALL_DIR)/usr/share/xfce4/panel-plugins/* \
		$(1)/usr/share/xfce4/panel-plugins/

	$(INSTALL_DIR) $(1)/usr/share/applications
	$(INSTALL_DATA) \
		$(PKG_INSTALL_DIR)/usr/share/applications/* \
		$(1)/usr/share/applications

	$(INSTALL_DIR) $(1)/usr/share/orage/sounds
	$(INSTALL_DATA) \
		$(PKG_INSTALL_DIR)/usr/share/orage/sounds/* \
		$(1)/usr/share/orage/sounds/

	$(INSTALL_DIR) $(1)/usr/share/orage/zoneinfo
	$(CP) \
		$(PKG_INSTALL_DIR)/usr/share/orage/zoneinfo/* \
		$(1)/usr/share/orage/zoneinfo/
endef

$(eval $(call BuildPackage,orage))
