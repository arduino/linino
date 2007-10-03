# 
# Copyright (C) 2007 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
# $Id$

include $(TOPDIR)/rules.mk

PKG_NAME:=dbus
PKG_VERSION:=1.0.2
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=http://dbus.freedesktop.org/releases/dbus/
PKG_MD5SUM:=0552a9b54beb4a044951b7cdbc8fc855

include $(INCLUDE_DIR)/package.mk


define Package/dbus/Default
 SECTION:=utils
 CATEGORY:=Utilities
 TITLE:=Simple interprocess messaging system
 URL:=http://dbus.freedesktop.org/
endef

define Package/dbus/Default/description
 D-Bus is a message bus system, a simple way for applications to talk to one 
 another. In addition to interprocess communication, D-Bus helps coordinate 
 process lifecycle; it makes it simple and reliable to code a "single instance" 
 application or daemon, and to launch applications and daemons on demand when 
 their services are needed.
endef


define Package/dbus
$(call Package/dbus/Default)
 TITLE+= (daemon)
 DEPENDS:= +libexpat
endef

define Package/dbus/Description
$(call Package/dbus/Default/description)
 This package contains the D-Bus daemon.
endef


define Package/dbus-utils
$(call Package/dbus/Default)
 TITLE+= (utilities)
 DEPENDS:= dbus
endef

define Package/dbus-utils/Description
$(call Package/dbus/Default/description)
 This package contains D-Bus utilities.
endef


CONFIGURE_ARGS += \
	--enable-shared \
	--enable-static \
	--disable-abstract-sockets \
	--disable-ansi \
	--disable-asserts \
	--disable-console-owner-file \
	--disable-dnotify \
	--disable-doxygen-docs \
	--disable-gcov \
	--disable-selinux \
	--disable-tests \
	--disable-verbose-mode \
	--disable-xml-docs \
	--without-x \
	--with-xml="expat" \
	--with-dbus-daemondir="/usr/sbin" \
	--with-system-socket="/var/run/dbus/system_bus_socket" \
	--with-system-pid-file="/var/run/dbus.pid" \

CONFIGURE_VARS+= \
	ac_cv_have_abstract_sockets="yes" \


define Build/Compile
	$(MAKE) -C $(PKG_BUILD_DIR) \
		DESTDIR="$(PKG_INSTALL_DIR)" \
		all install
endef

define Build/InstallDev
	mkdir -p $(STAGING_DIR)/usr/include
	$(CP)	$(PKG_INSTALL_DIR)/usr/include/dbus-1.0 \
		$(STAGING_DIR)/usr/include/
	mkdir -p $(STAGING_DIR)/usr/lib
	$(CP)	$(PKG_INSTALL_DIR)/usr/lib/libdbus-1.{a,so*} \
		$(STAGING_DIR)/usr/lib/
	$(CP)	$(PKG_INSTALL_DIR)/usr/lib/dbus-1.0 \
		$(STAGING_DIR)/usr/lib/
	mkdir -p $(STAGING_DIR)/usr/lib/pkgconfig
	$(CP)	$(PKG_INSTALL_DIR)/usr/lib/pkgconfig/dbus-1.pc \
		$(STAGING_DIR)/usr/lib/pkgconfig/
	$(SED)	's,^includedir=.*,includedir=$(STAGING_DIR)/usr/include,g' \
		$(STAGING_DIR)/usr/lib/pkgconfig/dbus-1.pc
	$(SED)	's,^libdir=.*,libdir=$(STAGING_DIR)/usr/lib,g' \
		$(STAGING_DIR)/usr/lib/pkgconfig/dbus-1.pc
endef

define Build/UninstallDev
	rm -rf	$(STAGING_DIR)/usr/include/dbus-1.0 \
		$(STAGING_DIR)/usr/lib/libdbus-1.{a,so*} \
		$(STAGING_DIR)/usr/lib/dbus-1.0 \
		$(STAGING_DIR)/usr/lib/pkgconfig/dbus-1.pc
endef


define Package/dbus/conffiles
/etc/dbus-1/session.conf
/etc/dbus-1/system.conf
endef

define Package/dbus/install
	$(INSTALL_DIR) $(1)/etc
	$(CP) $(PKG_INSTALL_DIR)/etc/dbus-1 $(1)/etc/
	$(INSTALL_DIR) $(1)/usr/lib
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/libdbus-1.so.* $(1)/usr/lib/
	$(INSTALL_DIR) $(1)/usr/sbin
	$(CP) $(PKG_INSTALL_DIR)/usr/sbin/dbus-daemon $(1)/usr/sbin/
	$(INSTALL_DIR) $(1)/etc/init.d
	$(INSTALL_BIN) ./files/dbus.init $(1)/etc/init.d/
endef


define Package/dbus-utils/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(CP) $(PKG_INSTALL_DIR)/usr/bin/dbus-* $(1)/usr/bin/
endef


$(eval $(call BuildPackage,dbus))
$(eval $(call BuildPackage,dbus-utils))

