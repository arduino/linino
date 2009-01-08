# 
# Copyright (C) 2009 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
# $Id: $

include $(TOPDIR)/rules.mk

PKG_NAME:=libdbi
PKG_VERSION:=0.8.3
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=@SF/libdbi
PKG_MD5SUM:=

include $(INCLUDE_DIR)/package.mk

define Package/libdbi
  NAME:=libdbi
  SECTION:=libs
  CATEGORY:=Libraries
  TITLE+= (library)
endef

define Package/libdbi/description
	SQLite is a small C library that implements a self-contained, embeddable, 
	zero-configuration SQL database engine.	This package contains the SQLite
	(v3.x) shared library, used by other programs.
endef

define Build/Compile
	$(MAKE) -C $(PKG_BUILD_DIR) \
		DESTDIR="$(PKG_INSTALL_DIR)" \
		all install
endef

define Build/InstallDev
	mkdir -p $(1)/usr/include
	$(CP) $(PKG_INSTALL_DIR)/usr/include/dbi $(1)/usr/include/
	mkdir -p $(1)/usr/lib
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/libdbi.{a,so*} $(1)/usr/lib/
endef

define Package/libdbi/install
	$(INSTALL_DIR) $(1)/usr/lib
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/libdbi.so.* $(1)/usr/lib/
endef

$(eval $(call BuildPackage,libdbi))
