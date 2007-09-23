# 
# Copyright (C) 2007 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
# $Id$

include $(TOPDIR)/rules.mk

PKG_NAME:=babel
PKG_VERSION:=0.4
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=http://www.pps.jussieu.fr/~jch/software/files/
PKG_MD5SUM:=427bbd044d9e842c8ed203d1b8d5dd6e

include $(INCLUDE_DIR)/package.mk

define Package/babel
  SECTION:=ipv6
  CATEGORY:=IPv6
  TITLE:=a loop-free distance-vector routing protocol
  URL:=http://www.pps.jussieu.fr/~jch/software/babel/
  DEPENDS:=+kmod-ipv6
endef

define Package/babel/description
 Babel is a loop-avoiding distance-vector routing protocol roughly based 
 on DSDV and AODV, but with provisions for link cost estimation and 
 redistribution of routes from other routing protocols.
 While it is optimised for wireless mesh networks, Babel will also work 
 efficiently on wired networks. It will generate between 1.2 and 2.4 times 
 the amount of routing traffic that RIPng would generate, while 
 never counting to infinity.
endef

define Build/Configure
endef

define Build/Compile
	$(MAKE) -C $(PKG_BUILD_DIR) \
		CC="$(TARGET_CC)" \
		CFLAGS="$(TARGET_CFLAGS)" \
		all
endef

define Package/babel/install
	$(INSTALL_DIR) $(1)/usr/sbin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/babel $(1)/usr/sbin/
endef

$(eval $(call BuildPackage,babel))
