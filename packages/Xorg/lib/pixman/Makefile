# 
# Copyright (C) 2007 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
# blogic@openwrt.org 
include $(TOPDIR)/rules.mk

PKG_BASE_NAME:=pixman
PKG_NAME:=pixman
PKG_RELEASE:=2
PKG_VERSION:=0.12.0
PKG_SOURCE_URL:=http://cairographics.org/releases/
PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_BUILD_DIR=$(BUILD_DIR)/Xorg/$(_CATEGORY)/${PKG_NAME}-$(PKG_VERSION)/

include $(INCLUDE_DIR)/package.mk

EXTRA_LDFLAGS += -Wl,-rpath-link=$(STAGING_DIR)/usr/lib

define Package/pixman
  SECTION:=xorg-lib
  CATEGORY:=Xorg
  SUBMENU:=lib
  DEPENDS:=@DISPLAY_SUPPORT
  TITLE:=pixman
  URL:=http://xorg.freedesktop.org/
endef

define Build/Compile
	$(call $(PKG_NAME)/Compile)
	make -C $(PKG_BUILD_DIR)
	DESTDIR=$(PKG_INSTALL_DIR) $(MAKE) -C $(PKG_BUILD_DIR) $(MAKE_FLAGS) install
	find $(PKG_INSTALL_DIR) -name *.la | xargs rm -rf
endef

define Build/Configure
	$(call Build/Configure/Default, --enable-malloc0returnsnull)
endef

define Package/pixman/install
	$(INSTALL_DIR) $(1)/usr/lib
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/* $(1)/usr/lib/
endef

define Build/InstallDev
	$(CP) $(PKG_INSTALL_DIR)/* $(1)/
endef

$(eval $(call BuildPackage,pixman))
