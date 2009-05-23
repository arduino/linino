#
# Copyright (C) 2007-2009 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
# blogic@openwrt.org

include $(TOPDIR)/rules.mk

PKG_BASE_NAME:=xdm
PKG_NAME:=xdm
PKG_RELEASE:=2.1
PKG_VERSION:=1.1.6
PKG_SOURCE_URL:=http://xorg.freedesktop.org/releases/X11R7.3/src/app
PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.bz2
PKG_BUILD_DIR=$(BUILD_DIR)/Xorg/$(_CATEGORY)/$(PKG_NAME)-$(PKG_VERSION)/

include $(INCLUDE_DIR)/package.mk

define Package/xdm
  SECTION:=xorg-app
  CATEGORY:=Xorg
  SUBMENU:=app
  DEPENDS:=+libX11 +libXmu +libXau +libXaw
  TITLE:=xdm
  URL:=http://xorg.freedesktop.org/
endef

CONFIGURE_ARGS+=--with-random-device=/dev/urandom LIBS="-Wl,-rpath-link=$(STAGING_DIR)/usr/lib" 

define Build/Compile
	DESTDIR=$(PKG_INSTALL_DIR) make -C $(PKG_BUILD_DIR) install
endef

define Package/xdm/install
	$(INSTALL_DIR) $(1)
	$(CP) $(PKG_INSTALL_DIR)/* $(1)/
	rm -rf $(1)/usr/man/
endef

define Build/InstallDev
	$(CP) $(PKG_INSTALL_DIR)/* $(1)/
endef

$(eval $(call BuildPackage,xdm))
