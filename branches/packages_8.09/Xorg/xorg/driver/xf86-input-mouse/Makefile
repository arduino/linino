#
# Copyright (C) 2007 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
# $Id$

include $(TOPDIR)/rules.mk

PKG_NAME:=xf86-input-mouse
PKG_RELEASE:=4
PKG_VERSION:=1.3.0

PKG_SOURCE_URL:=http://xorg.freedesktop.org/releases/X11R7.4/src/driver
PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.bz2
PKG_BUILD_DIR=$(BUILD_DIR)/Xorg/$(_CATEGORY)/$(PKG_NAME)-$(PKG_VERSION)/
PKG_MD5SUM:=31a51b0e5ddc4fac19754f48a3adf881
PKG_BUILD_DEPENDS:=randrproto inputproto xproto

include $(INCLUDE_DIR)/package.mk

PKG_INSTALL:=1

define Package/xf86-input-mouse
  SECTION:=xorg-driver
  CATEGORY:=Xorg
  SUBMENU:=driver
  DEPENDS:=+xserver-xorg
  TITLE:=xf86-input-mouse
  URL:=http://xorg.freedesktop.org/
endef

define Package/xf86-input-mouse/install
	$(INSTALL_DIR) $(1)/usr/lib/xorg/modules/input
	$(INSTALL_DATA) \
		$(PKG_INSTALL_DIR)/usr/lib/xorg/modules/input/mouse_drv.so \
		$(1)/usr/lib/xorg/modules/input/
endef

$(eval $(call BuildPackage,xf86-input-mouse))
