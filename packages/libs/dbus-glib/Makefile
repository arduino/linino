# 
# Copyright (C) 2007 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
# $Id$

include $(TOPDIR)/rules.mk

PKG_NAME:=dbus-glib
PKG_VERSION:=0.74
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=http://dbus.freedesktop.org/releases/dbus-glib/
PKG_MD5SUM:=

include $(INCLUDE_DIR)/package.mk


define Package/libdbus-glib
 SECTION:=libs
 CATEGORY:=Libraries
 TITLE:=D-Bus Glib bindings
 URL:=http://dbus.freedesktop.org/doc/dbus-glib/
 DEPENDS:= +dbus +glib2 +libiconv +libintl
endef


CONFIGURE_ARGS += \
	--enable-shared \
	--enable-static \
	--disable-tests \
	--disable-xml-docs \
	--disable-doxygen-docs \

CONFIGURE_VARS+= \
	ac_cv_func_posix_getpwnam_r="yes" \
	ac_cv_have_abstract_sockets="yes" \
	CPPFLAGS="$$$$CPPFLAGS -I$(STAGING_DIR)/usr/lib/libiconv/include" \
	CPPFLAGS="$$$$CPPFLAGS -I$(STAGING_DIR)/usr/lib/libintl/include" \
	LDFLAGS="$$$$LDFLAGS -L$(STAGING_DIR)/usr/lib/libiconv/lib" \
	LDFLAGS="$$$$LDFLAGS -L$(STAGING_DIR)/usr/lib/libintl/lib" \


define Build/Compile
	$(MAKE) -C $(PKG_BUILD_DIR) \
		DESTDIR="$(PKG_INSTALL_DIR)" \
		all install
endef

define Build/InstallDev
	mkdir -p $(STAGING_DIR)/usr/include/dbus-1.0/dbus
	$(CP)	$(PKG_INSTALL_DIR)/usr/include/dbus-1.0/dbus/dbus-glib{,-error-enum,-lowlevel}.h \
		$(PKG_INSTALL_DIR)/usr/include/dbus-1.0/dbus/dbus-gtype-specialized.h \
		$(STAGING_DIR)/usr/include//dbus-1.0/dbus/
	mkdir -p $(STAGING_DIR)/usr/lib
	$(CP)	$(PKG_INSTALL_DIR)/usr/lib/libdbus-glib-1.{a,so*} \
		$(STAGING_DIR)/usr/lib/
	mkdir -p $(STAGING_DIR)/usr/lib/pkgconfig
	$(CP)	$(PKG_INSTALL_DIR)/usr/lib/pkgconfig/dbus-glib-1.pc \
		$(STAGING_DIR)/usr/lib/pkgconfig/
endef

define Build/UninstallDev
	rm -rf	$(STAGING_DIR)/usr/include/dbus-1.0/dbus/dbus-glib{,-error-enum,-lowlevel}.h \
		$(STAGING_DIR)/usr/include/dbus-1.0/dbus/dbus-gtype-specialized.h \
		$(STAGING_DIR)/usr/lib/libdbus-glib-1.{a,so*} \
		$(STAGING_DIR)/usr/lib/pkgconfig/dbus-glib-1.pc
endef


define Package/libdbus-glib/install
	$(INSTALL_DIR) $(1)/usr/lib
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/libdbus-glib-1.so.* $(1)/usr/lib/
endef


$(eval $(call BuildPackage,libdbus-glib))

