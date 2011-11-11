#
# Copyright (C) 2007-2008 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=xsetroot
PKG_RELEASE:=1
PKG_VERSION:=1.0.3

PKG_SOURCE_URL:=http://xorg.freedesktop.org/releases/X11R7.5/src/app
PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.bz2
PKG_BUILD_DIR:=$(BUILD_DIR)/Xorg/$(PKG_NAME)-$(PKG_VERSION)/

PKG_MD5SUM:=cbda9b9b8da5af4614110883d5a276b8
PKG_INSTALL:=1

include $(INCLUDE_DIR)/package.mk


TARGET_LDFLAGS+=-Wl,-rpath-link=$(STAGING_DIR)/usr/lib

define Package/xsetroot
  SECTION:=xorg-app
  CATEGORY:=Xorg
  SUBMENU:=app
  DEPENDS:=+xbitmaps +libXmuu +libX11
  TITLE:=xsetroot
  URL:=http://xorg.freedesktop.org/
endef

define Package/xsetroot/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_BIN) \
		$(PKG_INSTALL_DIR)/usr/bin/* \
		$(1)/usr/bin
endef

$(eval $(call BuildPackage,xsetroot))
