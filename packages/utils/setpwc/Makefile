#
# Copyright (C) 2006 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
# $Id$

include $(TOPDIR)/rules.mk

PKG_NAME:=setpwc
PKG_VERSION:=1.0
PKG_RELEASE:=1
PKG_MD5SUM:=a125d76f630c4aab940df5912f161965

PKG_SOURCE_URL:=http://www.vanheusden.com/setpwc/
PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tgz
PKG_CAT:=zcat

PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)-$(PKG_VERSION)
PKG_INSTALL_DIR:=$(PKG_BUILD_DIR)/ipkg-install

include $(INCLUDE_DIR)/package.mk

define Package/setpwc
  SECTION:=utils
  CATEGORY:=Utilities
  TITLE:=Philips (and compatibles) WebCams (PWC) control utility
  DESCRIPTION:=Philips (and compatibles) WebCams (PWC) control utility.
  URL:=http://www.vanheusden.com/setpwc/
endef


define Build/Compile		
	$(TARGET_CC) $(TARGET_CFLAGS) -DVERSION=\"$(PKG_VERSION)\" -o $(PKG_BUILD_DIR)/setpwc $(PKG_BUILD_DIR)/setpwc.c 
endef

define Package/setpwc/install	
	install -d -m0755 $(1)/usr/bin
	install -m0755 $(PKG_BUILD_DIR)/setpwc $(1)/usr/bin/
endef

$(eval $(call BuildPackage,setpwc))
