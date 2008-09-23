#
# Copyright (C) 2007-2008 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
# blogic@openwrt.org

include $(TOPDIR)/rules.mk

PKG_BASE_NAME:=xinit
PKG_NAME:=xinit
PKG_RELEASE:=2
PKG_VERSION:=1.0.5
PKG_SOURCE_URL:=http://xorg.freedesktop.org/releases/X11R7.3/src/app
PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.bz2
PKG_BUILD_DIR=$(BUILD_DIR)/Xorg/$(_CATEGORY)/${PKG_NAME}-$(PKG_VERSION)/

include $(INCLUDE_DIR)/package.mk

PKG_INSTALL=1

define Package/xinit
  SECTION:=xorg-app
  CATEGORY:=Xorg
  SUBMENU:=app
  DEPENDS:=libX11 @DISPLAY_SUPPORT
  TITLE:=xinit
  URL:=http://xorg.freedesktop.org/
endef

define Build/InstallDev
	DESTDIR=$(1) $(MAKE) -C $(PKG_BUILD_DIR) $(MAKE_FLAGS) install
endef

CONFIGURE_ARGS+=LIBS="-Wl,-rpath-link=$(STAGING_DIR)/usr/lib" 

define Package/xinit/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(CP) $(PKG_INSTALL_DIR)/usr/bin/xinit $(1)/usr/bin/xinit
	cd $(1)/usr/bin/; ln -sf xinit startx
endef

$(eval $(call BuildPackage,xinit))
