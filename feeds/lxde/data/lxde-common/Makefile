#
# Copyright (C) 2009 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
# $Id$

include $(TOPDIR)/rules.mk

PKG_NAME:=lxde-common
PKG_VERSION:=0.5.0
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=@SF/lxde
PKG_MD5SUM:=23606ab3d6e1039386d62a4b68b4ffc6
PKG_FIXUP:=libtool
PKG_INSTALL:=1

include $(INCLUDE_DIR)/package.mk
include $(INCLUDE_DIR)/nls.mk

TARGET_LDFLAGS+= \
	-Wl,-rpath-link=$(STAGING_DIR)/usr/lib

define Package/lxde-common
  SECTION:=xorg-app
  CATEGORY:=Xorg
  SUBMENU:=app
  TITLE:=lxde-common
  DEPENDS:=+smproxy +openbox +lxsession-lite +hicolor-icon-theme
endef

define Package/lxde-common/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_BIN) \
		$(PKG_INSTALL_DIR)/usr/bin/* \
		$(1)/usr/bin

	$(INSTALL_DIR) $(1)/usr/share
	$(CP) \
		$(PKG_INSTALL_DIR)/usr/share/* \
		$(1)/usr/share/

	$(INSTALL_DIR) $(1)/etc/xdg/lxsession/LXDE
	$(INSTALL_DATA) \
		$(PKG_INSTALL_DIR)/etc/xdg/lxsession/LXDE/* \
		$(1)/etc/xdg/lxsession/LXDE/
endef

$(eval $(call BuildPackage,lxde-common))
