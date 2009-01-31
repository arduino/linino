#
# Copyright (C) 2006 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
# $Id$

include $(TOPDIR)/rules.mk

PKG_NAME:=setpwc
PKG_VERSION:=1.2
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tgz
PKG_SOURCE_URL:=http://www.vanheusden.com/setpwc/
PKG_MD5SUM:=1bc721cdfcbac24027e2afc93685d29f

include $(INCLUDE_DIR)/package.mk

define Package/setpwc
  SECTION:=utils
  CATEGORY:=Utilities
  TITLE:=Philips (and compatibles) WebCams (PWC) control utility
  URL:=http://www.vanheusden.com/setpwc/
endef

define Package/setpwc/description
	With setpwc you can set and list various settings of Philips (and
	compatibles) WebCams with the 'PWC chipset'.
endef

define Build/Compile		
	$(TARGET_CC) $(TARGET_CFLAGS) -DVERSION=\"$(PKG_VERSION)\" -o $(PKG_BUILD_DIR)/setpwc $(PKG_BUILD_DIR)/setpwc.c 
endef

define Package/setpwc/install	
	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/setpwc $(1)/usr/bin/
endef

$(eval $(call BuildPackage,setpwc))
