#
# Copyright (C) 2009 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
include $(TOPDIR)/rules.mk

PKG_NAME:=liberation-fonts
PKG_RELEASE:=1
PKG_VERSION:=1.04

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_BUILD_DIR=$(BUILD_DIR)/Xorg/$(_CATEGORY)/$(PKG_NAME)-$(PKG_VERSION)/
PKG_SOURCE_URL:=http://fedorahosted.org/releases/l/i/liberation-fonts/
PKG_MD5SUM:=4846797ef0fc70b0cbaede2514677c58

include $(INCLUDE_DIR)/package.mk

define Package/liberation-fonts-ttf
  SECTION:=xorg-font
  CATEGORY:=Xorg
  SUBMENU:=font
  TITLE:=liberation-fonts-ttf
  URL:=https://fedorahosted.org/liberation-fonts/
endef

define Build/Compile
	true
endef

define Build/Configure
	true
endef

define Package/liberation-fonts-ttf/install
	$(INSTALL_DIR) $(1)/usr/share/fonts/truetype/liberation
	$(INSTALL_DATA) \
        $(PKG_BUILD_DIR)/*.ttf \
        $(1)/usr/share/fonts/truetype/liberation/
endef

$(eval $(call BuildPackage,liberation-fonts-ttf))

