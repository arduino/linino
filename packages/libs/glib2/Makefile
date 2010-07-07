#
# Copyright (C) 2007 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=glib2
PKG_VERSION:=2.22.2
PKG_RELEASE:=1

PKG_SOURCE:=glib-$(PKG_VERSION).tar.bz2
PKG_BUILD_DIR:=$(BUILD_DIR)/glib-$(PKG_VERSION)
PKG_SOURCE_URL:=@GNOME/glib/2.22
PKG_MD5SUM:=846a86c74b74d5b16826aa5508940f9b

PKG_FIXUP:=libtool
PKG_BUILD_DEPENDS:=glib2/host
PKG_INSTALL:=1

HOST_BUILD_DIR:=$(BUILD_DIR_HOST)/glib-$(PKG_VERSION)

include $(INCLUDE_DIR)/host-build.mk
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

TARGET_CFLAGS+= \
	$(FPIC) \
	-I$(STAGING_DIR)/usr/lib/libiconv/include \
	-I$(STAGING_DIR)/usr/lib/libintl/include

TARGET_LDFLAGS+= \
	-L$(STAGING_DIR)/usr/lib/libiconv/lib \
	-L$(STAGING_DIR)/usr/lib/libintl/lib

define Build/Configure
	$(call Build/Configure/Default, \
		--enable-shared \
		--enable-static \
		--enable-debug=no \
		--with-libiconv=gnu \
		--disable-selinux \
        --disable-fam \
		, \
		glib_cv_stack_grows=no \
		glib_cv_uscore=no \
		ac_cv_path_GLIB_GENMARSHAL=$(STAGING_DIR_HOST)/bin/glib-genmarshal \
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
endef

define Package/glib2/install
	$(INSTALL_DIR) $(1)/usr/lib
	$(CP) \
		$(PKG_INSTALL_DIR)/usr/lib/*.so* \
		$(1)/usr/lib/
endef

$(eval $(call HostBuild))
$(eval $(call BuildPackage,glib2))
