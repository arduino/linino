#
# Copyright (C) 2007 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
# $Id$

include $(TOPDIR)/rules.mk

PKG_NAME:=glib2
PKG_VERSION:=2.12.12
PKG_RELEASE:=1

PKG_SOURCE:=glib-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=ftp://ftp.gtk.org/pub/glib/2.12/
PKG_MD5SUM:=6c6a61e4b08fb4b110ca7953f71c8b5e

PKG_BUILD_DIR:=$(BUILD_DIR)/glib-$(PKG_VERSION)

include $(INCLUDE_DIR)/package.mk


define Package/glib2
  SECTION:=libs
  CATEGORY:=Libraries
  DEPENDS:=+libiconv +libintl
  TITLE:=glib 2.0
  DESCRIPTION:=The GLib library of C routines
  URL:=http://www.gtk.org/
endef


define Build/Configure
endef

define Build/Compile
	mkdir -p $(PKG_BUILD_DIR)/build/$(GNU_HOST_NAME)
	( cd $(PKG_BUILD_DIR); ./configure \
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
	$(call libtool_disable_rpath)
	$(MAKE) -C $(PKG_BUILD_DIR) all
	$(call libtool_fixup_libdir,$(PKG_INSTALL_DIR))
	$(MAKE) -C $(PKG_BUILD_DIR) DESTDIR="$(PKG_INSTALL_DIR)" install
endef

define Build/InstallDev
	mkdir -p $(STAGING_DIR)/usr/include
	$(CP) $(PKG_INSTALL_DIR)/usr/include/glib-2.0 $(STAGING_DIR)/usr/include/
	mkdir -p $(STAGING_DIR)/usr/lib
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/glib-2.0 $(STAGING_DIR)/usr/lib/
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/libg{lib,module,object,thread}-2.0.{a,so*} $(STAGING_DIR)/usr/lib/
	mkdir -p $(STAGING_DIR)/usr/lib/pkgconfig
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/pkgconfig/g{lib,module,module-no-export,object,thread}-2.0.pc $(STAGING_DIR)/usr/lib/pkgconfig
endef

define Build/UninstallDev
	rm -rf	$(STAGING_DIR)/usr/include/glib-2.0 \
		$(STAGING_DIR)/usr/lib/glib-2.0 \
		$(STAGING_DIR)/usr/lib/libg{lib,module,module-no-export,object,thread}-2.0.{a,so*} \
		$(STAGING_DIR)/usr/lib/pkgconfig/g{lib,module,module-no-export,object,thread}-2.0.pc
endef


define Package/glib2/install
	$(INSTALL_DIR) $(1)/usr/lib
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/libg*-2.0.so* $(1)/usr/lib/
endef


$(eval $(call BuildPackage,glib2))

