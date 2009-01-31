# 
# Copyright (C) 2006 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
# $Id$

include $(TOPDIR)/rules.mk

PKG_NAME:=axtls
PKG_VERSION:=1.1.6
PKG_RELEASE:=2

PKG_SOURCE:=axTLS-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=@SF/axtls http://www.leroc.com.au/axTLS/
PKG_MD5SUM:=50e63d5fe002399e2ae63591908f7f5a

PKG_BUILD_DIR:=$(BUILD_DIR)/axTLS

include $(INCLUDE_DIR)/package.mk

define Package/libaxtls
  SECTION:=libs
  CATEGORY:=Libraries
  TITLE:=Embedded client/server TLSv1 SSL library
  URL:=http://sourceforge.net/projects/axtls
endef

define Package/axhttpd
  SECTION:=net
  CATEGORY:=Network
  SUBMENU:=Web
  DEPENDS:=+libaxtls
  TITLE:=A small embedded web server using the axTLS library
  URL:=http://www.axtls.co.nr/
endef

define Build/Configure
	$(CP) ./files/config $(PKG_BUILD_DIR)/config/.config
	$(MAKE) -C $(PKG_BUILD_DIR) oldconfig
endef

TARGET_CFLAGS += $(FPIC)

define Build/Compile
	$(MAKE) -C $(PKG_BUILD_DIR) \
		CC="$(TARGET_CC)" \
		STRIP="/bin/true" \
		OPT_CFLAGS="$(TARGET_CFLAGS)" OPT_LDFLAGS="" \
		all
	$(MAKE) -C $(PKG_BUILD_DIR) \
		PREFIX="$(PKG_INSTALL_DIR)/usr" \
		install
endef

define Build/InstallDev
	mkdir -p $(1)/usr/include
	$(CP) $(PKG_INSTALL_DIR)/usr/include/axTLS $(1)/usr/include/
	mkdir -p $(1)/usr/lib
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/libaxtls.{a,so*} $(1)/usr/lib/
endef

define Package/libaxtls/install
	$(INSTALL_DIR) $(1)/usr/lib
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/libaxtls.so.* $(1)/usr/lib/
endef

define Package/axhttpd/install
	$(INSTALL_DIR) $(1)/usr/sbin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/usr/bin/axhttpd $(1)/usr/sbin/
endef

$(eval $(call BuildPackage,libaxtls))
$(eval $(call BuildPackage,axhttpd))
