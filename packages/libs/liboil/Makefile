# 
# Copyright (C) 2007-2008 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
# $Id$

include $(TOPDIR)/rules.mk

PKG_NAME:=liboil
PKG_VERSION:=0.3.15
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=http://liboil.freedesktop.org/download/
PKG_MD5SUM:=11dd39b1ca13ce2e0618d4df8303f137

PKG_BUILD_DEPENDS:=libnotimpl
PKG_FIXUP = libtool

include $(INCLUDE_DIR)/package.mk

define Package/liboil
  SECTION:=libs
  CATEGORY:=Libraries
  TITLE:=simple functions optimized for various CPUs
  URL:=http://liboil.freedesktop.org/wiki/
endef

define Package/liboil/description
  Liboil is a library of simple functions that are optimized for various CPUs.
  These functions are generally loops implementing simple algorithms, such as
  converting an array of N integers to floating-point numbers or multiplying
  and summing an array of N numbers. Such functions are candidates for significant
  optimization using various techniques, especially by using extended instructions
  provided by modern CPUs (Altivec, MMX, SSE, etc.).
endef

TARGET_CFLAGS += $(FPIC)

CONFIGURE_ARGS += \
	--enable-shared \
	--enable-static \

CONFIGURE_VARS += \
	CPPFLAGS="$$$$CPPFLAGS -I$(STAGING_DIR)/usr/lib/libiconv/include" \
	CPPFLAGS="$$$$CPPFLAGS -I$(STAGING_DIR)/usr/lib/libintl/include" \
	LDFLAGS="$$$$LDFLAGS -L$(STAGING_DIR)/usr/lib/libiconv/lib" \
	LDFLAGS="$$$$LDFLAGS -L$(STAGING_DIR)/usr/lib/libintl/lib" \
	LIBS="-lnotimpl" \
	ac_cv_lib_m_rintf=no \

define Build/Compile
	$(MAKE) -C $(PKG_BUILD_DIR) DESTDIR="$(PKG_INSTALL_DIR)" all install
endef

define Build/InstallDev
	$(INSTALL_DIR) $(1)/usr/include
	$(CP) $(PKG_INSTALL_DIR)/usr/include/liboil-0.3/* $(1)/usr/include/
	$(INSTALL_DIR) $(1)/usr/lib
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/liboil-0.3.{a,so*} $(1)/usr/lib/
	$(INSTALL_DIR) $(1)/usr/lib/pkgconfig
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/pkgconfig/liboil-0.3.pc $(1)/usr/lib/pkgconfig/
endef

define Package/liboil/install
	$(INSTALL_DIR) $(1)/usr/lib
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/liboil-0.3.so.* $(1)/usr/lib/
endef

$(eval $(call BuildPackage,liboil))
