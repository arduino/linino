#
# Copyright (C) 2007-2008 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
# $Id$

include $(TOPDIR)/rules.mk

PKG_NAME:=xf86-input-evdev
PKG_RELEASE:=4
PKG_VERSION:=2.0.4

PKG_SOURCE_URL:=http://xorg.freedesktop.org/releases/X11R7.4/src/driver
PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.bz2
PKG_BUILD_DIR=$(BUILD_DIR)/Xorg/$(_CATEGORY)/$(PKG_NAME)-$(PKG_VERSION)/
PKG_MD5SUM:=ac97e155ea4db87a8393297493f9c406
PKG_BUILD_DEPENDS:=randrproto inputproto xproto
PKG_INSTALL:=1

include $(INCLUDE_DIR)/package.mk

define Package/xf86-input-evdev
  SECTION:=xorg-driver
  CATEGORY:=Xorg
  SUBMENU:=driver
  DEPENDS:=+xserver-xorg
  TITLE:=xf86-input-evdev
  URL:=http://xorg.freedesktop.org/
endef

define Package/xf86-input-evdev/install
	$(INSTALL_DIR) $(1)/usr/lib/xorg/modules/input
	$(INSTALL_DATA) \
		$(PKG_INSTALL_DIR)/usr/lib/xorg/modules/input/evdev_drv.so \
		$(1)/usr/lib/xorg/modules/input/
endef

$(eval $(call BuildPackage,xf86-input-evdev))
