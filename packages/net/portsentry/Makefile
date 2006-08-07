#
# Copyright (C) 2006 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
# $Id$

include $(TOPDIR)/rules.mk

PKG_NAME:=portsentry
PKG_VERSION:=1.2
PKG_RELEASE:=1
PKG_MD5SUM:=3ebd3618ba9abfea2525e236bd44cebd

PKG_SOURCE_URL:=@SF/sentrytools
PKG_SOURCE:=$(PKG_NAME)-1.2.tar.gz
PKG_CAT:=zcat

PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)_beta

include $(INCLUDE_DIR)/package.mk

define Package/portsentry
  SECTION:=net
  CATEGORY:=Network
  TITLE:=Portscan protection utility
  DESCRIPTION:=Software for protection against port scans
  URL:=http://sourceforge.net/projects/sentrytools
endef

define Package/portsentry/conffiles
/etc/portsentry.conf
endef

define Build/Compile	
	$(MAKE) -C $(PKG_BUILD_DIR) linux
endef

define Package/portsentry/install	
	mkdir -p $(1)/usr/bin
	mkdir -p $(1)/etc
	$(CP) $(PKG_BUILD_DIR)/$(PKG_NAME).conf $(1)/etc/
	$(CP) $(PKG_BUILD_DIR)/$(PKG_NAME) $(1)/usr/bin/
endef

$(eval $(call BuildPackage,portsentry))
