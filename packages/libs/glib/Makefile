# 
# Copyright (C) 2006 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
# $Id$

include $(TOPDIR)/rules.mk

PKG_NAME:=glib
PKG_VERSION:=1.2.10
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=ftp://ftp.gtk.org/pub/gtk/v1.2 \
	http://ftp.gwdg.de/pub/misc/grafik/gimp/gtk/v1.2/ \
	http://ftp.esat.net/mirrors/ftp.gimp.org/pub/gtk/v1.2/ \
	http://www.mirrorservice.org/sites/ftp.gimp.org/pub/gtk/v1.2/
PKG_MD5SUM:=6fe30dad87c77b91b632def29dd69ef9
PKG_CAT:=zcat

PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)-$(PKG_VERSION)
PKG_INSTALL_DIR:=$(PKG_BUILD_DIR)/ipkg-install

include $(INCLUDE_DIR)/package.mk

define Package/glib1
  SECTION:=libs
  CATEGORY:=Libraries
  DEPENDS:=+libpthread
  TITLE:=The GLib library of C routines
  DESCRIPTION:=\
	GLib is a library containing many useful C routines for things such \\\
	as trees, hashes, and lists.
  URL:=http://www.gtk.org/
endef

# commas are interpreted by the $(call ...) macro, so define an intermediate variable holding our settings
PKG_CONFIGURE_VARS:=\
	glib_cv_prog_cc_ansi_proto=no \
	glib_cv_has__inline=yes \
	glib_cv_has__inline__=yes \
	glib_cv_hasinline=yes \
	glib_cv_sane_realloc=yes \
	glib_cv_va_copy=no \
	glib_cv___va_copy=yes \
	glib_cv_va_val_copy=yes \
	glib_cv_rtldglobal_broken=no \
	glib_cv_uscore=no \
	glib_cv_func_pthread_mutex_trylock_posix=yes \
	glib_cv_func_pthread_cond_timedwait_posix=yes \
	glib_cv_sizeof_gmutex=24 \
	glib_cv_byte_contents_gmutex="0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0" \

define Build/Configure
	$(call Build/Configure/Default, \
		--enable-shared \
		--enable-static \
		, \
		$(PKG_CONFIGURE_VARS) \
	)
endef

define Build/Compile
	$(MAKE) -C $(PKG_BUILD_DIR) \
		DESTDIR="$(PKG_INSTALL_DIR)" \
		install
endef

define Build/InstallDev
	mkdir -p $(STAGING_DIR)/usr/bin
	$(CP) $(PKG_INSTALL_DIR)/usr/bin/glib-config $(STAGING_DIR)/usr/bin/
	mkdir -p $(STAGING_DIR)/usr/include
	$(CP) $(PKG_INSTALL_DIR)/usr/include/glib-1.2 $(STAGING_DIR)/usr/include/
	$(CP) $(PKG_BUILD_DIR)/glibconfig-sysdefs.h $(STAGING_DIR)/usr/include/glib-1.2/
	mkdir -p $(STAGING_DIR)/usr/lib
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/libg{lib,module,thread}.{a,so} $(STAGING_DIR)/usr/lib/
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/libg{lib,module,thread}-*.so.* $(STAGING_DIR)/usr/lib/
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/glib $(STAGING_DIR)/usr/lib/
	mkdir -p $(STAGING_DIR)/usr/lib/pkgconfig
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/pkgconfig/g{lib,module,thread}.pc $(STAGING_DIR)/usr/lib/pkgconfig/
endef

define Build/UninstallDev
	rm -rf \
		$(STAGING_DIR)/usr/bin/glib-config \
		$(STAGING_DIR)/usr/include/glib-1.2 \
		$(STAGING_DIR)/usr/lib/libg{lib,module,thread}.{a,so} \
		$(STAGING_DIR)/usr/lib/libg{lib,module,thread}-*.so.* \
		$(STAGING_DIR)/usr/lib/glib \
		$(STAGING_DIR)/usr/lib/pkgconfig/g{lib,module,thread}.pc
endef

define Package/glib1/install
	install -d -m0755 $(1)/usr/lib
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/libg{lib,module,thread}-1.2.so.* $(1)/usr/lib/
endef

$(eval $(call BuildPackage,glib1))
