# 
# Copyright (C) 2006 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
# $Id: Makefile 4644 2006-08-23 22:05:05Z nbd $

include $(TOPDIR)/rules.mk

PKG_NAME:=minicom
PKG_VERSION:=2.2-rc2
PKG_RELEASE:=1
PKG_MD5SUM:=c64c9ef958e91c00ca1cf2a7bc0db1f3

PKG_SOURCE_URL:=http://alioth.debian.org/download.php/1721/
PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_CAT:=zcat

PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)-$(PKG_VERSION)

include $(INCLUDE_DIR)/package.mk

define Package/minicom
  SECTION:=utils
  CATEGORY:=Utilities
  DEPENDS:=+libncurses
  TITLE:=Terminal emulation
  DESCRIPTION:=Terminal emulation program for the serial port
  URL:=http://alioth.debian.org/projects/minicom/
endef

define Build/Configure
	$(call Build/Configure/Default)
endef

define Build/Compile
	$(MAKE) -C $(PKG_BUILD_DIR) \
		CC="$(TARGET_CC)"
endef

define Package/minicom/install
	install -m0755 -d $(1)/usr/sbin
	install -m0755 $(PKG_BUILD_DIR)/src/minicom $(1)/usr/sbin/
endef

$(eval $(call BuildPackage,minicom))
