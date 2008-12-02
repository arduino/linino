#
# Copyright (C) 2007-2008 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
# blogic@openwrt.org

include $(TOPDIR)/rules.mk

PKG_BASE_NAME:=libXmu
PKG_NAME:=libXmu
PKG_RELEASE:=3
PKG_VERSION:=1.0.4
PKG_SOURCE_URL:=http://xorg.freedesktop.org/releases/X11R7.4/src/lib/
PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.bz2
PKG_BUILD_DIR=$(BUILD_DIR)/Xorg/$(_CATEGORY)/$(PKG_NAME)-$(PKG_VERSION)/
PKG_FIXUP:=libtool
PKG_BUILD_DEPENDS:=libXt libXext xextproto

include $(INCLUDE_DIR)/package.mk

PKG_INSTALL:=1

define Package/libXmu
  SECTION:=xorg-lib
  CATEGORY:=Xorg
  SUBMENU:=lib
  DEPENDS:=+libXt +libXext
  TITLE:=libXmu
  URL:=http://xorg.freedesktop.org/
endef

define Package/libXmuu
  SECTION:=xorg-lib
  CATEGORY:=Xorg
  SUBMENU:=lib
  DEPENDS:=+libX11
  TITLE:=libXmuu
  URL:=http://xorg.freedesktop.org/
endef

define Package/libXmu/install
	$(INSTALL_DIR) $(1)/usr/lib
	$(INSTALL_DATA) \
		$(PKG_INSTALL_DIR)/usr/lib/libXmu.so* \
		$(1)/usr/lib/
endef

define Package/libXmuu/install
	$(INSTALL_DIR) $(1)/usr/lib
	$(INSTALL_DATA) \
		$(PKG_INSTALL_DIR)/usr/lib/libXmuu.so* \
		$(1)/usr/lib/
endef

define Build/InstallDev
	$(CP) $(PKG_INSTALL_DIR)/* $(1)/
endef

$(eval $(call BuildPackage,libXmu))
$(eval $(call BuildPackage,libXmuu))
