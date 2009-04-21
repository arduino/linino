#
# Copyright (C) 2007-2009 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
# $Id$

include $(TOPDIR)/rules.mk

PKG_NAME:=glib2
PKG_VERSION:=2.18.1
PKG_RELEASE:=4.1

PKG_SOURCE:=glib-$(PKG_VERSION).tar.bz2
PKG_BUILD_DIR:=$(BUILD_DIR)/glib-$(PKG_VERSION)
PKG_SOURCE_URL:=@GNOME/glib/2.18
PKG_MD5SUM:=51a9a33f49a4896d4d95d8e980666b9e
PKG_FIXUP:=libtool

include $(INCLUDE_DIR)/package.mk

PKG_INSTALL=1

define Package/glib2
  SECTION:=libs
  CATEGORY:=Libraries
  DEPENDS:=+libiconv +libintl +libpthread
  TITLE:=glib 2.0
  URL:=http://www.gtk.org/
endef

define Package/glib2/description
  The GLib library of C routines
endef

TARGET_CFLAGS+= \
	$(FPIC) \
	-I$(STAGING_DIR)/usr/lib/libiconv/include \
	-I$(STAGING_DIR)/usr/lib/libintl/include

TARGET_LDFLAGS+= \
	-L$(STAGING_DIR)/usr/lib/libiconv/lib \
	-L$(STAGING_DIR)/usr/lib/libintl/lib

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
		glib_cv_stack_grows=no \
		glib_cv_uscore=no \
		ac_cv_path_GLIB_GENMARSHAL=$(PKG_BUILD_DIR)/build/$(GNU_HOST_NAME)/bin/glib-genmarshal \
		ac_cv_func_mmap_fixed_mapped=yes \
	);
endef

define Build/InstallDev
	$(INSTALL_DIR) $(1)/usr/include
	$(CP) \
		$(PKG_INSTALL_DIR)/usr/include/glib-2.0 \
		$(1)/usr/include/
	$(CP) \
		$(PKG_INSTALL_DIR)/usr/include/gio-unix-2.0 \
		$(1)/usr/include/

	$(INSTALL_DIR) $(1)/usr/lib
	$(CP) \
		$(PKG_INSTALL_DIR)/usr/lib/glib-2.0 \
		$(1)/usr/lib/

	$(CP) \
		$(PKG_INSTALL_DIR)/usr/lib/*.{so*,a,la} \
		$(1)/usr/lib/

	$(INSTALL_DIR) $(1)/usr/lib/pkgconfig
	$(INSTALL_DATA) \
		$(PKG_INSTALL_DIR)/usr/lib/pkgconfig/*.pc \
		$(1)/usr/lib/pkgconfig

	$(INSTALL_DIR) $(2)/share/aclocal/
	$(INSTALL_DATA) \
		$(PKG_INSTALL_DIR)/usr/share/aclocal/*.m4  \
		$(2)/share/aclocal/

	$(INSTALL_DIR) $(2)/bin
	$(INSTALL_BIN) \
		$(PKG_BUILD_DIR)/build/$(GNU_HOST_NAME)/bin/* \
		$(2)/bin
endef

define Package/glib2/install
	$(INSTALL_DIR) $(1)/usr/lib
	$(CP) \
		$(PKG_INSTALL_DIR)/usr/lib/*.so* \
		$(1)/usr/lib/
endef


$(eval $(call BuildPackage,glib2))
