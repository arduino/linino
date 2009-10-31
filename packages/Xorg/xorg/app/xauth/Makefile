#
# Copyright (C) 2008 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=xauth
PKG_RELEASE:=1
PKG_VERSION:=1.0.4
PKG_SOURCE_URL:=http://xorg.freedesktop.org/releases/X11R7.5/src/app
PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.bz2
PKG_BUILD_DIR:=$(BUILD_DIR)/Xorg/$(PKG_NAME)-$(PKG_VERSION)/

PKG_MD5SUM:=fa00078c414c4a57cab7a6d89a0c8734
PKG_INSTALL:=1

include $(INCLUDE_DIR)/package.mk


TARGET_LDFLAGS+=-Wl,-rpath-link=$(STAGING_DIR)/usr/lib

define Package/xauth
  SECTION:=xorg-app
  CATEGORY:=Xorg
  SUBMENU:=app
  DEPENDS:=+libX11 +libXau +libXext +libXmuu
  TITLE:=xauth
  URL:=http://xorg.freedesktop.org/
endef

define Package/xauth/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_BIN) \
		$(PKG_INSTALL_DIR)/usr/bin/* \
		$(1)/usr/bin/
endef

$(eval $(call BuildPackage,xauth))
