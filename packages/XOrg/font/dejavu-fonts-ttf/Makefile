# 
# Copyright (C) 2008 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
include $(TOPDIR)/rules.mk

PKG_BASE_NAME:=font
PKG_NAME:=dejavu-fonts-ttf
PKG_RELEASE:=1
PKG_VERSION:=2.23
PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.bz2
PKG_BUILD_DIR=$(BUILD_DIR)/Xorg/$(_CATEGORY)/${PKG_NAME}-$(PKG_VERSION)/
PKG_SOURCE_URL:=@SF/dejavu

include $(INCLUDE_DIR)/package.mk

define Package/dejavu-fonts-ttf
  SECTION:=xorg-font
  CATEGORY:=Xorg
  SUBMENU:=font
  DEPENDS:= @DISPLAY_SUPPORT
  TITLE:=dejavu-fonts-ttf
  URL:=http://dejavu.sourceforge.net/
endef

define Build/Compile
	echo
endef

define Build/Configure
	echo
endef

define Package/dejavu-fonts-ttf/install
	$(INSTALL_DIR) $(1)/usr/share/fonts/ttf-dejavu
	$(INSTALL_DATA) $(PKG_BUILD_DIR)/ttf/*.ttf $(1)/usr/share/fonts/ttf-dejavu
endef

$(eval $(call BuildPackage,dejavu-fonts-ttf))

