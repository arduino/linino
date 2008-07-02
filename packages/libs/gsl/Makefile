# 
# Copyright (C) 2008 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
# $Id: $

include $(TOPDIR)/rules.mk

PKG_NAME:=gsl
PKG_VERSION:=1.9
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=ftp://ftp.gnu.org/gnu/gsl/
PKG_MD5SUM:=81dca4362ae8d2aa1547b7d010881e43

include $(INCLUDE_DIR)/package.mk

define Package/libgsl
  SECTION:=libs
  CATEGORY:=Libraries
  TITLE:=GNU Scientific Library
  URL:=http://www.gnu.org/software/gsl/
endef

define Package/libgsl/description
	The library provides a wide range of mathematical routines such as
	random number generators, special functions and least-squares fitting.
	There are over 1000 functions in total with an extensive test suite.
endef

define Build/Compile
	rm -rf $(PKG_INSTALL_DIR)
	mkdir -p $(PKG_INSTALL_DIR)
	$(MAKE) -C $(PKG_BUILD_DIR) \
		$(TARGET_CONFIGURE_OPTS) \
		DESTDIR="$(PKG_INSTALL_DIR)" \
		all install
endef

define Package/libgsl/install
	$(INSTALL_DIR) $(1)/usr/lib
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/libgsl.so* $(1)/usr/lib/
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/libgslcblas.so* $(1)/usr/lib/
endef

define Build/InstallDev
	mkdir -p $(1)/usr/include
	$(CP) $(PKG_INSTALL_DIR)/usr/include/gsl/*.h $(1)/usr/include/
	mkdir -p $(1)/usr/lib
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/libgsl.{a,so*} $(1)/usr/lib/
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/libgslcblas.{a,so*} $(1)/usr/lib/
endef

define Build/UninstallDev
	rm -rf $(1)/usr/include/gsl
endef

$(eval $(call BuildPackage,libgsl))
