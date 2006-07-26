# 
# Copyright (C) 2006 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
# $Id$

include $(TOPDIR)/rules.mk

PKG_NAME:=axtls
PKG_VERSION:=0.95
PKG_RELEASE:=1

PKG_BUILD_DIR:=$(BUILD_DIR)/axTLS
PKG_SOURCE:=axTLS-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=http://www.leroc.com.au/axTLS/
PKG_MD5SUM:=cd887f379f303dd3ef691d8641307f0e
PKG_CAT:=zcat

include $(INCLUDE_DIR)/package.mk

define Package/libaxtls
  SECTION:=libs
  CATEGORY:=Libraries
  TITLE:=Embedded client/server TLSv1 SSL library
  DESCRIPTION:=Embedded client/server TLSv1 SSL library.
  URL:=http://www.axtls.co.nr/
endef

define Package/awhttpd
  SECTION:=net
  CATEGORY:=Network
  DEPENDS:=+libaxtls
  TITLE:=Anti-Web webserver
  DESCRIPTION:=Anti-Web webserver.
  URL:=http://www.axtls.co.nr/
endef

define Build/Configure
	$(CP) ./files/config $(PKG_BUILD_DIR)/config/.config
	$(MAKE) -C $(PKG_BUILD_DIR) oldconfig
endef

define Build/Compile
	$(MAKE) -C $(PKG_BUILD_DIR) \
		CC=$(TARGET_CC) \
		OPT_CFLAGS="$(TARGET_CFLAGS)" OPT_LDFLAGS=""
endef

define Package/libaxtls/install
	install -d -m0755 $(1)/usr/lib
	install -m0755 $(PKG_BUILD_DIR)/libaxtls.so $(1)/usr/lib/
endef

define Package/awhttpd/install
	install -d -m0755 $(1)/usr/sbin
	install -m0755 $(PKG_BUILD_DIR)/awhttpd $(1)/usr/sbin/
endef

$(eval $(call BuildPackage,libaxtls))
$(eval $(call BuildPackage,awhttpd))
