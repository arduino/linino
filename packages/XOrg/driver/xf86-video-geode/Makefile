#
# Copyright (C) 2008 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
# $Id$

include $(TOPDIR)/rules.mk

PKG_NAME:=xf86-video-geode
PKG_RELEASE:=1
PKG_VERSION:=2.10.1

PKG_SOURCE_URL:=http://xorg.freedesktop.org/releases/individual/driver/
PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.bz2
PKG_MD5SUM:=e307ab55a2a81d7868506df789f76dfb
PKG_BUILD_DIR=$(BUILD_DIR)/Xorg/$(PKG_NAME)-$(PKG_VERSION)/

include $(INCLUDE_DIR)/package.mk

PKG_INSTALL=1

define Package/xf86-video-geode
  SECTION:=xorg-driver
  CATEGORY:=Xorg
  SUBMENU:=driver
  DEPENDS:=+xorg-server @DISPLAY_SUPPORT
  TITLE:=xf86-video-geode
  URL:=http://xorg.freedesktop.org/
endef

EXTRA_CFLAGS:= \
	-I$(STAGING_DIR)/usr/include/xorg \
	-I$(STAGING_DIR)/usr/include/X11 \

define Package/xf86-video-geode/install
	$(INSTALL_DIR) $(1)/usr/lib/
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/* $(1)/usr/lib/
endef

$(eval $(call BuildPackage,xf86-video-geode))
