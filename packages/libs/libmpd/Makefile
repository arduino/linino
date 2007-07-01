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
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=http://www.neophob.com/files/owrt/
PKG_MD5SUM:=44f9e0e3bcaf205b9a0d86cbcca03f9f

include $(INCLUDE_DIR)/package.mk

define Package/libmpd
  SECTION:=libs
  CATEGORY:=Libraries
  TITLE:=Libmpd is an a library to easily connect to a mpd server.
  DESCRIPTION:=It's wraps around libmpdclient and provides a higher level api.  
  URL:=http://sarine.nl/libmpd
endef

define Build/Compile
	$(MAKE) -C $(PKG_BUILD_DIR) \
	DESTDIR="$(PKG_INSTALL_DIR)" \
		all install
endef			

define Build/InstallDev
	mkdir -p $(STAGING_DIR)/usr/include
	$(CP) $(PKG_INSTALL_DIR)/usr/include/libmpd $(STAGING_DIR)/usr/include/
	mkdir -p $(STAGING_DIR)/usr/lib
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/libmpd.{a,so*} $(STAGING_DIR)/usr/lib/
	mkdir -p $(STAGING_DIR)/usr/lib/pkgconfig
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/pkgconfig/libmpd.pc $(STAGING_DIR)/usr/lib/pkgconfig/
	$(SED) 's,-I$$$${includedir},,g' $(STAGING_DIR)/usr/lib/pkgconfig/libmpd.pc
	$(SED) 's,-L$$$${libdir},,g' $(STAGING_DIR)/usr/lib/pkgconfig/libmpd.pc
endef

define Build/UninstallDev
	rm -rf \
	$(STAGING_DIR)/usr/include/libmpd \
	$(STAGING_DIR)/usr/lib/libmpd.{a,so*} \
	$(STAGING_DIR)/usr/lib/pkgconfig/libmpd.pc
endef

define Package/libmpd/install
	$(INSTALL_DIR) $(1)/usr/lib
	$(INSTALL_DATA) $(PKG_INSTALL_DIR)/usr/lib/libmpd.so.* $(1)/usr/lib/
endef

$(eval $(call BuildPackage,libmpd))
