#
# Copyright (C) 2009 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=tangogps
PKG_VERSION:=0.9.6
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=http://tangogps.org/downloads
PKG_INSTALL:=1

include $(INCLUDE_DIR)/package.mk
include $(INCLUDE_DIR)/nls.mk

TARGET_LDFLAGS+= \
	-Wl,-rpath-link=$(STAGING_DIR)/usr/lib

define Package/tangogps
  SECTION:=xorg-apps
  CATEGORY:=Xorg
  SUBMENU:=app
  TITLE:=Mapping application
  URL:=http://tangogps.org
  DEPENDS:=+libgconf2 +gtk2 +libcurl +libexif +libsqlite3
endef

define Package/tangogps/install
	$(INSTALL_DIR) $(1)/usr/bin $(1)/usr/share/applications $(1)/usr/share/pixmaps
	$(INSTALL_BIN) \
		$(PKG_INSTALL_DIR)/usr/bin/tangogps \
		$(1)/usr/bin/
	$(INSTALL_DATA) \
		$(PKG_INSTALL_DIR)/usr/share/applications/tangogps.desktop \
		$(1)/usr/share/applications/
	$(INSTALL_BIN) \
		$(PKG_INSTALL_DIR)/usr/share/pixmaps/*.png \
		$(1)/usr/share/pixmaps/
endef

$(eval $(call BuildPackage,tangogps))
