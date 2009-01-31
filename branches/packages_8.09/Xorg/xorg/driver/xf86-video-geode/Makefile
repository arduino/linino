#
# Copyright (C) 2008 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
# $Id$

include $(TOPDIR)/rules.mk

PKG_NAME:=xf86-video-geode
PKG_RELEASE:=2
PKG_VERSION:=2.10.1

PKG_SOURCE_URL:=http://xorg.freedesktop.org/releases/X11R7.4/src/driver/
PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.bz2
PKG_MD5SUM:=e307ab55a2a81d7868506df789f76dfb
PKG_BUILD_DIR=$(BUILD_DIR)/Xorg/$(_CATEGORY)/$(PKG_NAME)-$(PKG_VERSION)/
PKG_BUILD_DEPENDS:=randrproto renderproto videoproto xextproto xf86dgaproto \
    xproto fontsproto

include $(INCLUDE_DIR)/package.mk

PKG_INSTALL:=1

define Package/xf86-video-geode
  SECTION:=xorg-driver
  CATEGORY:=Xorg
  SUBMENU:=driver
  DEPENDS:=+xserver-xorg +libpciaccess
  TITLE:=xf86-video-geode
  URL:=http://xorg.freedesktop.org/
endef

define Package/xf86-video-geode/install
	$(INSTALL_DIR) $(1)/usr/lib/xorg/modules/drivers
	$(INSTALL_DATA) \
        $(PKG_INSTALL_DIR)/usr/lib/xorg/modules/drivers/*.so \
        $(1)/usr/lib/xorg/modules/drivers/
endef

$(eval $(call BuildPackage,xf86-video-geode))
