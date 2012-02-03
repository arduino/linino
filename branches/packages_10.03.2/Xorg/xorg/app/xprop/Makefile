#
# Copyright (C) 2011 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=xprop
PKG_RELEASE:=1
PKG_VERSION:=1.2.0

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.bz2
PKG_SOURCE_URL:=http://xorg.freedesktop.org/releases/individual/app/
PKG_MD5SUM:=e6d0673a1e1e469f0a6220a6868fb94b

PKG_BUILD_DIR:=$(BUILD_DIR)/Xorg/$(PKG_NAME)-$(PKG_VERSION)/

PKG_BUILD_DEPENDS:=xproto
PKG_INSTALL:=1

include $(INCLUDE_DIR)/package.mk

TARGET_LDFLAGS+=-Wl,-rpath-link=$(STAGING_DIR)/usr/lib

define Package/xprop
  SECTION:=xorg-app
  CATEGORY:=Xorg
  SUBMENU:=app
  DEPENDS:=+libX11
  TITLE:=xprop
  URL:=http://xorg.freedesktop.org/
endef

define Package/xprop/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_BIN) \
		$(PKG_INSTALL_DIR)/usr/bin/xprop \
		$(1)/usr/bin/
endef

$(eval $(call BuildPackage,xprop))
