#
# Copyright (C) 2006 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
# $Id$

include $(TOPDIR)/rules.mk

PKG_NAME:=crowdcontrol
PKG_VERSION:=0.4b
PKG_RELEASE:=1
PKG_MD5SUM:=a0991ae3d1f1a361558bed1a4aa66a9c

PKG_SOURCE_URL:=@openwrt/
PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_CAT:=zcat

PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)-$(PKG_VERSION)
PKG_INSTALL_DIR:=$(PKG_BUILD_DIR)/ipkg-install

include $(INCLUDE_DIR)/package.mk

define Package/crowdcontrol
  SECTION:=net
  CATEGORY:=Network
  TITLE:=The extra-light http proxy server
  DESCRIPTION:=Crowd Control is an small, cross-platform HTTP proxy (a fork of the elhttp project)\\\
	designed for systems with little RAM, such as a home router. It can filter URLs using\\\
	SquidGuard blocklists, and has the unique ability to filter HTTPS domains as well.
  URL:=http://sourceforge.net/projects/crowdcontrol/
endef

define Build/Compile
	$(TARGET_CC) $(TARGET_CFLAGS) -o $(PKG_BUILD_DIR)/crowdcontrol $(PKG_BUILD_DIR)/crowdcontrol.c
endef

define Package/crowdcontrol/install
	mkdir -p $(1)/usr/sbin
	mkdir -p $(1)/etc/crowdcontrol
	$(CP) $(PKG_BUILD_DIR)/crowdcontrol $(1)/usr/sbin
	$(CP) $(PKG_BUILD_DIR)/*-{domains,expressions,urls} $(1)/etc/crowdcontrol/
endef

$(eval $(call BuildPackage,crowdcontrol))
