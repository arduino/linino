# 
# Copyright (C) 2007 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
# blogic@openwrt.org

include $(TOPDIR)/rules.mk

PKG_RELEASE:=1
PKG_VERSION:=7.1
PKG_BUILD_DIR=$(BUILD_DIR)/Xorg/headers/xorg-headers-native-$(PKG_VERSION)/

include $(INCLUDE_DIR)/package.mk

define Package/xorg-headers-native
  SECTION:=xorg-headers
  CATEGORY:=Xorg
  SUBMENU:=headers
  TITLE:=xorg-headers-native
  URL:=http://xorg.freedesktop.org/
  DEPENDS:=@TARGET_x86
endef

define Build/Prepare
	mkdir -p $(PKG_BUILD_DIR)
	$(CP) ./src/* $(PKG_BUILD_DIR)/
	find $(PKG_BUILD_DIR)/ -name .svn | xargs rm -rf
endef

define Build/Compile
  true
endef

define Build/InstallDev
    cp -r $(PKG_BUILD_DIR)/* $(1)/include/
endef

$(eval $(call BuildPackage,xorg-headers-native))

