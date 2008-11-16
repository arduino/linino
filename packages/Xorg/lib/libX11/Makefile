# 
# Copyright (C) 2007 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
# blogic@openwrt.org 
include $(TOPDIR)/rules.mk

PKG_BASE_NAME:=libX11
PKG_NAME:=libX11
PKG_RELEASE:=2
PKG_VERSION:=1.1.5
PKG_SOURCE_URL:=http://xorg.freedesktop.org/releases/X11R7.4/src/lib/
PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.bz2
PKG_BUILD_DIR=$(BUILD_DIR)/Xorg/$(_CATEGORY)/${PKG_NAME}-$(PKG_VERSION)/

include $(INCLUDE_DIR)/package.mk

define Package/libX11
  SECTION:=xorg-lib
  CATEGORY:=Xorg
  SUBMENU:=lib
  DEPENDS:=+bigreqsproto +xproto +xextproto +xtrans +xcmiscproto +libXdmcp +xf86bigfontproto +kbproto +inputproto +libXau @DISPLAY_SUPPORT
  TITLE:=libX11
  URL:=http://xorg.freedesktop.org/
endef

CONFIGURE_ARGS += --enable-malloc0returnsnull --without-xcb
EXTRA_LDFLAGS += -Wl,-rpath-link=$(STAGING_DIR)/usr/lib 

define Build/Compile
	$(call $(PKG_NAME)/Compile)
	make -C $(PKG_BUILD_DIR)
	DESTDIR=$(PKG_INSTALL_DIR) $(MAKE) -C $(PKG_BUILD_DIR) $(MAKE_FLAGS) install
	find $(PKG_INSTALL_DIR) -name *.la | xargs rm -rf
endef

define Package/libX11/install
	$(INSTALL_DIR) $(1)/usr/lib
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/* $(1)/usr/lib/
endef

define Build/InstallDev
	$(CP) $(PKG_INSTALL_DIR)/* $(1)/
endef

$(eval $(call BuildPackage,libX11))
