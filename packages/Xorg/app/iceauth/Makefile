#
# Copyright (C) 2007-2008 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
# blogic@openwrt.org
# $Id: Makefile 12619 2008-09-17 18:31:15Z lars $

include $(TOPDIR)/rules.mk

PKG_BASE_NAME:=iceauth
PKG_NAME:=iceauth
PKG_RELEASE:=2
PKG_VERSION:=1.0.2
PKG_SOURCE_URL:=http://xorg.freedesktop.org/releases/X11R7.3/src/app
PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.bz2
PKG_BUILD_DIR=$(BUILD_DIR)/Xorg/$(_CATEGORY)/$(PKG_NAME)-$(PKG_VERSION)/

_DEPEND:=
ifneq (iceauth,xinit)
_DEPEND+=xorg-server-essentials
endif

include $(INCLUDE_DIR)/package.mk

TARGET_LDFLAGS+=-Wl,-rpath-link=$(STAGING_DIR)/usr/lib

PKG_INSTALL=1

define Package/iceauth
  SECTION:=xorg-app
  CATEGORY:=Xorg
  SUBMENU:=app
  DEPENDS:= @DISPLAY_SUPPORT
  TITLE:=iceauth
  URL:=http://xorg.freedesktop.org/
endef

define Build/InstallDev
	DESTDIR=$(1) $(MAKE) -C $(PKG_BUILD_DIR) $(MAKE_FLAGS) install
endef

define Package/iceauth/install
	$(INSTALL_DIR) $(1)
	$(CP) $(PKG_INSTALL_DIR)/* $(1)
	rm -rf $(1)/usr/man/
endef

define Package/xinit/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(CP) $(PKG_INSTALL_DIR)/usr/bin/xinit $(1)/usr/bin/xinit
	cd $(1)/usr/bin/; ln -s xinit startx
endef

$(eval $(call BuildPackage,iceauth))
