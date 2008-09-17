#
# Copyright (C) 2007-2008 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
# blogic@openwrt.org
# $Id$

include $(TOPDIR)/rules.mk

PKG_BASE_NAME:=xsetroot
PKG_NAME:=xsetroot
PKG_RELEASE:=2
PKG_VERSION:=1.0.2
PKG_SOURCE_URL:=http://xorg.freedesktop.org/releases/X11R7.3/src/app
PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.bz2
PKG_BUILD_DIR=$(BUILD_DIR)/Xorg/$(_CATEGORY)/$(PKG_NAME)-$(PKG_VERSION)/

_DEPEND:= +libX11 +xbitmaps
ifneq (xsetroot,xinit)
_DEPEND+=xorg-server-essentials
endif

include $(INCLUDE_DIR)/package.mk

TARGET_LDFLAGS+=-Wl,-rpath-link=$(STAGING_DIR)/usr/lib

PKG_INSTALL=1

define Package/xsetroot
  SECTION:=xorg-app
  CATEGORY:=Xorg
  SUBMENU:=app
  DEPENDS:=+libX11 +xbitmaps @DISPLAY_SUPPORT
  TITLE:=xsetroot
  URL:=http://xorg.freedesktop.org/
endef

define Build/InstallDev
	DESTDIR=$(1) $(MAKE) -C $(PKG_BUILD_DIR) $(MAKE_FLAGS) install
endef

define Package/xsetroot/install
	$(INSTALL_DIR) $(1)
	$(CP) $(PKG_INSTALL_DIR)/* $(1)
	rm -rf $(1)/usr/man/
endef

$(eval $(call BuildPackage,xsetroot))
