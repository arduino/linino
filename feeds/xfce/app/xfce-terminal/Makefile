#
# Copyright (C) 2009 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
# $Id$

include $(TOPDIR)/rules.mk

PKG_NAME:=xfce-terminal
PKG_VERSION:=0.2.5.8rc2
PKG_RELEASE:=1

PKG_SOURCE:=Terminal-$(PKG_VERSION).tar.bz2
PKG_BUILD_DIR:=$(BUILD_DIR)/Terminal-$(PKG_VERSION)
PKG_SOURCE_URL:=http://download.berlios.de/xfce-goodies/
PKG_MD5SUM:=d2785c1b11c48ed012042faa708bbf94
PKG_INSTALL:=1

include $(INCLUDE_DIR)/package.mk

TARGET_CFLAGS+=-I$(STAGING_DIR)/usr/lib/libintl/include/

TARGET_LDFLAGS+= \
	-Wl,-rpath-link=$(STAGING_DIR)/usr/lib \
	-L$(STAGING_DIR)/usr/lib/libintl/lib

define Package/xfce-terminal
  SECTION:=xorg-app
  CATEGORY:=Xorg
  SUBMENU:=app
  TITLE:=xfce-terminal
  DEPENDS:=+libxfcegui4
endef

define Package/xfce-terminal/install
	$(INSTALL_DIR) $(1)/usr/bin/
	$(INSTALL_BIN) \
		$(PKG_INSTALL_DIR)/usr/bin/Terminal \
		$(1)/usr/bin/
	(cd $(1)/usr/bin; ln -sf Terminal terminal)

	$(INSTALL_DIR) $(1)/usr/share/icons
	$(CP) \
		$(PKG_INSTALL_DIR)/usr/share/icons/* \
		$(1)/usr/share/icons/

	$(INSTALL_DIR) $(1)/usr/share/pixmaps
	$(INSTALL_DATA) \
		$(PKG_INSTALL_DIR)/usr/share/pixmaps/* \
		$(1)/usr/share/pixmaps/

	$(INSTALL_DIR) $(1)/usr/share/applications
	$(INSTALL_DATA) \
		$(PKG_INSTALL_DIR)/usr/share/applications/* \
		$(1)/usr/share/applications/

	$(INSTALL_DIR) $(1)/usr/share/Terminal/apps
	$(INSTALL_DATA) \
		$(PKG_INSTALL_DIR)/usr/share/Terminal/*.ui \
		$(1)/usr/share/Terminal/
	$(INSTALL_DATA) \
		$(PKG_INSTALL_DIR)/usr/share/Terminal/apps/* \
		$(1)/usr/share/Terminal/apps/
endef

$(eval $(call BuildPackage,xfce-terminal))
