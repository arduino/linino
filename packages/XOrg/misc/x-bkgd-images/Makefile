# 
# Copyright (C) 2007 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
# blogic@openwrt.org

include $(TOPDIR)/rules.mk

PKG_NAME:=x-bkgd-images
PKG_VERSION:=1
PKG_RELEASE:=1

include $(INCLUDE_DIR)/package.mk

define Package/x-bkgd-images
  SECTION:=xorg-misc
  CATEGORY:=Xorg
  SUBMENU:=misc
  TITLE:=Background images for X
  DEPENDS:=@DISPLAY_SUPPORT
endef

define Build/Configure
	echo
endef

define Build/Compile
	echo
endef

define Package/x-bkgd-images/install
	$(CP) ./files/* $(1)/ 
endef

$(eval $(call BuildPackage,x-bkgd-images))
