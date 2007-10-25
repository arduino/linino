# 
# Copyright (C) 2006 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
# blogic@openwrt.org

include $(TOPDIR)/rules.mk

PKG_NAME:=Mesa
PKG_VERSION:=6.5
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)Lib-$(PKG_VERSION).tar.bz2
PKG_SOURCE_URL:=http://downloads.sourceforge.net/mesa3d/

include $(INCLUDE_DIR)/package.mk

define Package/Mesa
  SECTION:=xorg-misc
  CATEGORY:=Xorg
  SUBMENU:=misc
  TITLE:=OpenGL compatible 3-D graphics library
  DEPENDS:=@DISPLAY_SUPPORT
endef

define Build/Configure
	echo
endef

define Build/Compile
	echo "currently we only stage the headers in this package :-)"
endef

define Build/InstallDev
	$(CP) -r $(PKG_BUILD_DIR)/include/* $(1)/usr/include
endef

$(eval $(call BuildPackage,Mesa))
