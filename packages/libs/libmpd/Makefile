# 
# Copyright (C) 2007 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
# $Id$

include $(TOPDIR)/rules.mk

PKG_NAME:=libmpd
PKG_VERSION:=0.14.0
PKG_RELEASE:=2

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=http://www.neophob.com/files/owrt/
PKG_MD5SUM:=44f9e0e3bcaf205b9a0d86cbcca03f9f

include $(INCLUDE_DIR)/package.mk

define Package/libmpd
  SECTION:=libs
  CATEGORY:=Libraries
  TITLE:=Libmpd is an a library to easily connect to a mpd server.
  URL:=http://sarine.nl/libmpd
endef

define Package/libmpd/description
It's wraps around libmpdclient and provides a higher level api.
endef

TARGET_CFLAGS += $(FPIC)

define Build/Compile
	$(MAKE) -C $(PKG_BUILD_DIR) \
	DESTDIR="$(PKG_INSTALL_DIR)" \
		all install
endef			

define Build/InstallDev
	mkdir -p $(1)/usr/include
	$(CP) $(PKG_INSTALL_DIR)/usr/include/libmpd $(1)/usr/include/
	mkdir -p $(1)/usr/lib
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/libmpd.{a,so*} $(1)/usr/lib/
	mkdir -p $(1)/usr/lib/pkgconfig
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/pkgconfig/libmpd.pc $(1)/usr/lib/pkgconfig/
endef

define Package/libmpd/install
	$(INSTALL_DIR) $(1)/usr/lib
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/libmpd.so.* $(1)/usr/lib/
endef

$(eval $(call BuildPackage,libmpd))
