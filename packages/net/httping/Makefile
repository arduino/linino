# Copyright (C) 2006 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
# $Id$

include $(TOPDIR)/rules.mk

PKG_NAME:=httping
PKG_VERSION:=1.0.10
PKG_RELEASE:=1
PKG_MD5SUM:=998b00b8babeb3196d28c20ad87d9c15

PKG_SOURCE_URL:=http://www.vanheusden.com/httping/
PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tgz
PKG_CAT:=zcat

PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)-$(PKG_VERSION)

include $(INCLUDE_DIR)/package.mk

define Package/httping
  SECTION:=net
  CATEGORY:=Network
  DEPENDS:=+libopenssl
  TITLE:=Httping is like 'ping' but for http-requests
  DESCRIPTION:=Httping is like 'ping' but for http-requests.\\\
Give it an url, and it'll show you how long it takes to connect, send a\\\
request and retrieve the reply (only the headers). Be aware that the\\\
transmission across the network also takes time!\\\
  URL:=http://www.vanheusden.com/httping/
endef

define Build/Compile	
	$(MAKE) -C $(PKG_BUILD_DIR) -f $(PKG_BUILD_DIR)/Makefile$(SSL_ENABLE) \
		CC=$(TARGET_CC) STAGING_DIR=$(STAGING_DIR)
endef

define Package/httping/install	
	mkdir -p $(1)/usr/sbin
	$(CP) $(PKG_BUILD_DIR)/$(PKG_NAME) $(1)/usr/sbin/
endef

$(eval $(call BuildPackage,httping))
