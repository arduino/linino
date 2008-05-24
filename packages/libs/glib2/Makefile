#
# Copyright (C) 2007 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
# $Id$

include $(TOPDIR)/rules.mk

PKG_NAME:=glib2
PKG_VERSION:=2.15.4
PKG_RELEASE:=1

PKG_SOURCE:=glib-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=ftp://ftp.gtk.org/pub/glib/2.15/
PKG_MD5SUM:=14c3ce0d2e9befe607bae0c514500e9e

PKG_BUILD_DIR:=$(BUILD_DIR)/glib-$(PKG_VERSION)

PKG_FIXUP = libtool

include $(INCLUDE_DIR)/package.mk


define Package/glib2
  SECTION:=libs
  CATEGORY:=Libraries
  DEPENDS:=+libiconv +libintl
  TITLE:=glib 2.0
  URL:=http://www.gtk.org/
endef

define Package/glib2/description
The GLib library of C routines
endef


define Build/Configure
	mkdir -p $(PKG_BUILD_DIR)/build/$(GNU_HOST_NAME)
	( cd $(PKG_BUILD_DIR); CONFIG_SITE= \
		./configure \
		--target=$(GNU_HOST_NAME) \
		--host=$(GNU_HOST_NAME) \
		--build=$(GNU_HOST_NAME) \
		--prefix=$(PKG_BUILD_DIR)/build/$(GNU_HOST_NAME) \
		--disable-shared \
		--enable-static \
		--enable-debug=no \
	);
	$(MAKE) -C $(PKG_BUILD_DIR) install clean

	$(call Build/Configure/Default, \
		--enable-shared \
		--enable-static \
		--enable-debug=no \
		, \
		CPPFLAGS="$$$$CPPFLAGS -I$(STAGING_DIR)/usr/lib/libiconv/include" \
		CPPFLAGS="$$$$CPPFLAGS -I$(STAGING_DIR)/usr/lib/libintl/include" \
		LDFLAGS="$$$$LDFLAGS -L$(STAGING_DIR)/usr/lib/libiconv/lib" \
		LDFLAGS="$$$$LDFLAGS -L$(STAGING_DIR)/usr/lib/libintl/lib" \
		glib_cv_stack_grows=no \
		glib_cv_uscore=no \
		ac_cv_path_GLIB_GENMARSHAL=$(PKG_BUILD_DIR)/build/$(GNU_HOST_NAME)/bin/glib-genmarshal \
	);
endef

TARGET_LDFLAGS += -L$(TOOLCHAIN_DIR)/lib
define Build/Compile
	$(MAKE) -C $(PKG_BUILD_DIR) DESTDIR="$(PKG_INSTALL_DIR)" all install
endef

define Build/InstallDev
	mkdir -p $(1)/usr/include
	$(CP) $(PKG_INSTALL_DIR)/usr/include/glib-2.0 $(1)/usr/include/
	mkdir -p $(1)/usr/lib
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/glib-2.0 $(1)/usr/lib/
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/libg{lib,module,object,thread}-2.0.{a,so*} $(1)/usr/lib/
	mkdir -p $(1)/usr/lib/pkgconfig
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/pkgconfig/g{lib,module,module-no-export,object,thread}-2.0.pc $(1)/usr/lib/pkgconfig
	mkdir -p $(1)/share/aclocal/
	$(CP) $(PKG_INSTALL_DIR)/usr/share/aclocal/*.m4 $(STAGING_DIR_HOST)/share/aclocal/
endef

define Package/glib2/install
	$(INSTALL_DIR) $(1)/usr/lib
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/libg*-2.0.so* $(1)/usr/lib/
endef


$(eval $(call BuildPackage,glib2))

