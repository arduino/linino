#
# Copyright (C) 2006 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
# $Id: $

include $(TOPDIR)/rules.mk

PKG_NAME:=glib2
PKG_VERSION:=2.12.12
PKG_RELEASE:=1

PKG_SOURCE:=glib-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=ftp://ftp.gtk.org/pub/glib/2.12/
PKG_MD5SUM:=6c6a61e4b08fb4b110ca7953f71c8b5e
PKG_CAT:=zcat

PKG_BUILD_DIR:=$(BUILD_DIR)/glib-$(PKG_VERSION)
PKG_INSTALL_DIR:=$(PKG_BUILD_DIR)/ipkg-install

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
	$(call Build/Configure/Default, \
		--enable-shared \
		--enable-static \
		LDFLAGS="-L$(STAGING_DIR)/usr/lib/libiconv/lib \
			-L$(STAGING_DIR)/usr/lib/libintl/lib" \
		CPPFLAGS="-I$(STAGING_DIR)/usr/lib/libiconv/include \
			-I$(STAGING_DIR)/usr/lib/libintl/include" \
		, \
		glib_cv_stack_grows=no \
		glib_cv_uscore=no \
	)
endef

define Build/Compile	
	$(MAKE) -C $(PKG_BUILD_DIR) \
		DESTDIR="$(PKG_INSTALL_DIR)" \
		install
endef


define Build/InstallDev
	mkdir -p $(STAGING_DIR)/usr/bin
	$(CP) $(PKG_INSTALL_DIR)/usr/bin/* $(STAGING_DIR)/usr/bin/
	mkdir -p $(STAGING_DIR)/usr/include
	$(CP) $(PKG_INSTALL_DIR)/usr/include/glib-2.0 $(STAGING_DIR)/usr/include/
	mkdir -p $(STAGING_DIR)/usr/lib
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/glib-2.0 $(STAGING_DIR)/usr/lib/
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/libg* $(STAGING_DIR)/usr/lib/
	mkdir -p $(STAGING_DIR)/usr/lib/pkgconfig
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/pkgconfig/g*-2.0.pc $(STAGING_DIR)/usr/lib/pkgconfig/
endef

define Build/UninstallDev
	rm -rf \
		$(STAGING_DIR)/usr/bin/{glib-genmarshal,glib-gettextize,glib-mkenums.gobject-query} \
		$(STAGING_DIR)/usr/include/glib-2.0 \
		$(STAGING_DIR)/usr/lib/{glib,libg*} \
		$(STAGING_DIR)/usr/lib/pkgconfig/g*-2.0.pc 
endef

define Package/glib2/install	
	$(INSTALL_DIR) $(1)/usr/lib
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/libg*.so* $(1)/usr/lib/
endef

$(eval $(call BuildPackage,glib2))
