# 
# Copyright (C) 2006 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
# $Id$

include $(TOPDIR)/rules.mk

PKG_NAME:=ustl
PKG_VERSION:=0.8
PKG_RELEASE:=1

PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)-$(PKG_VERSION)
PKG_SOURCE:=$(PKG_NAME)-0.8-0.tar.bz2
PKG_SOURCE_URL:=@SF/ustl
PKG_MD5SUM:=dd59483c327f1bd1356273bc5ae4dde0
PKG_CAT:=bzcat

PKG_INSTALL_DIR:=$(PKG_BUILD_DIR)/ipkg-install

include $(INCLUDE_DIR)/package.mk

define Package/ustl
  SECTION:=libs
  CATEGORY:=Libraries
  TITLE:=C++ STL for embedded systems
  DESCRIPTION:=C++ Standard Template Library (STL) for embedded systems.\\\
    uSTL is a partial implementation of the STL (Standard Template \\\
    Library) that reduces code size by factoring memory management \\\
    code into a non-template base class and deriving containers \\\
    from it.
  URL:=http://ustl.sourceforge.net/
endef

define Build/Configure
	$(CP) ./files/config.h $(PKG_BUILD_DIR)/
	$(CP) ./files/Common.mk $(PKG_BUILD_DIR)/
endef

define Build/Compile
	rm -rf $(PKG_INSTALL_DIR)
	mkdir -p $(PKG_INSTALL_DIR)
	$(MAKE) -C $(PKG_BUILD_DIR) \
		CROSS="$(TARGET_CROSS)" \
		OPTFLAGS="$(TARGET_CFLAGS)" \
		DESTDIR="$(PKG_INSTALL_DIR)" \
		all install
endef

define Package/ustl/install
	install -d -m0755 $(1)/usr/lib
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/libustl.so.* $(1)/usr/lib/
endef

define Build/InstallDev
	mkdir -p $(STAGING_DIR)/usr/include
	$(CP) $(PKG_INSTALL_DIR)/usr/include/ustl* $(STAGING_DIR)/usr/include/
	mkdir -p $(STAGING_DIR)/usr/lib
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/libustl.{a,so*} $(STAGING_DIR)/usr/lib/
endef

define Build/UninstallDev
	rm -rf \
		$(STAGING_DIR)/usr/include/ustl* \
		$(STAGING_DIR)/usr/lib/libustl.{a,so*}
endef

$(eval $(call BuildPackage,ustl))
