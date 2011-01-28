#
# Copyright (C) 2011 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=cppunit
PKG_VERSION:=1.12.1
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=@SF/cppunit
PKG_MD5SUM:=bd30e9cf5523cdfc019b94f5e1d7fd19

include $(INCLUDE_DIR)/package.mk

define Package/cppunit
  SECTION:=devel
  CATEGORY:=Development
  TITLE:=Unit Testing Library for C++
  URL:=http://cppunit.sourceforge.net/
endef

define Package/cppunit/description
  Unit Testing Library for C++
endef

define Build/InstallDev
	echo InstallDev installing to $(1)
	$(INSTALL_DIR) $(1)/usr/include/cppunit
	$(CP) $(PKG_BUILD_DIR)/include/cppunit/* $(1)/usr/include/cppunit/
	$(INSTALL_DIR) $(1)/usr/lib
	$(CP) $(PKG_BUILD_DIR)/src/cppunit/.libs/libcppunit*so* $(1)/usr/lib/
	$(INSTALL_DIR) $(STAGING_DIR)/usr/include/cppunit
	$(CP) $(PKG_BUILD_DIR)/include/cppunit/* $(STAGING_DIR)/usr/include/cppunit/
	$(INSTALL_DIR) $(STAGING_DIR)/usr/lib
	$(CP) $(PKG_BUILD_DIR)/src/cppunit/.libs/libcppunit*so* $(STAGING_DIR)/usr/lib/
endef

define Package/cppunit/install
	echo install installing to $(1)
	$(INSTALL_DIR) $(1)/usr/lib
	$(CP) $(PKG_BUILD_DIR)/src/cppunit/.libs/libcppunit*so* $(1)/usr/lib/
endef

$(eval $(call BuildPackage,cppunit))
