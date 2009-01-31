#
# Copyright (C) 2007-2008 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
# $Id$ 

include $(TOPDIR)/rules.mk

PKG_NAME:=apr-util
PKG_VERSION:=1.2.8
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=http://apache.autinity.de/apr/
PKG_MD5SUM:=a2e2e54d65e9eae961f7171335cf2550

PKG_FIXUP = libtool

include $(INCLUDE_DIR)/package.mk

define Package/libaprutil
  SECTION:=libs
  CATEGORY:=Libraries
  DEPENDS:=+libapr +libexpat +libiconv +libpthread +libsqlite3 +libuuid
  TITLE:=Apache Portable Runtime Utility Library
  URL:=http://apr.apache.org/
endef


TARGET_CFLAGS += $(FPIC)
CONFIGURE_ARGS += \
	--with-pgsql=no \
	--with-apr="$(STAGING_DIR)/usr/bin/apr-1-config" \
	--with-expat="$(STAGING_DIR)/usr" \
	--without-sqlite2 \
	--with-sqlite3="$(STAGING_DIR)/usr" \
	--with-iconv="$(STAGING_DIR)/usr/lib/libiconv" \

CONFIGURE_VARS += \
	ac_cv_file_dbd_apr_dbd_mysql_c=no \
	APR_BUILD_DIR="$(STAGING_DIR)/usr/share/build-1" \

define Build/Compile
	$(MAKE) -C $(PKG_BUILD_DIR) APRUTIL_LIBS="-lsqlite3 -L$(STAGING_DIR)/usr/lib -lexpat -liconv -lapr-1 -luuid -lm -lcrypt" all
	$(MAKE) -C $(PKG_BUILD_DIR) DESTDIR="$(PKG_INSTALL_DIR)" install
endef

define Build/InstallDev
	$(INSTALL_DIR) $(1)/usr/bin $(1)/usr/include/apr-1/ $(1)/usr/lib  $(1)/usr/lib/pkgconfig/
	$(CP)   $(PKG_INSTALL_DIR)/usr/bin/apu-1-config \
	 	$(1)/usr/bin/
	$(CP)   $(PKG_INSTALL_DIR)/usr/include/apr-1/* \
		$(1)/usr/include/apr-1/
	$(CP)   $(PKG_INSTALL_DIR)/usr/lib/libaprutil-1.{la,a,so*} \
		$(1)/usr/lib/
	$(CP)   $(PKG_INSTALL_DIR)/usr/lib/pkgconfig/apr-util-1.pc \
		$(1)/usr/lib/pkgconfig/
	$(SED) 's, -e \"s -I$$$$prefix/lib  g\",,g' $(1)/usr/bin/apu-1-config
	$(SED) 's,^libdir=\"$$$${exec_prefix}/lib,libdir=\"$(STAGING_DIR)/usr/lib,g' $(1)/usr/bin/apu-1-config
	$(SED) 's,^includedir=\"$$$${prefix}/include/,includedir=\"$(STAGING_DIR)/usr/include/,g' $(1)/usr/bin/apu-1-config
	$(SED) 's,-L$$$$libdir,,g' $(1)/usr/bin/apu-1-config
	$(SED) 's,-R$$$$libdir,,g' $(1)/usr/bin/apu-1-config
endef

define Package/libaprutil/install	
	$(INSTALL_DIR) $(1)/usr/lib
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/libaprutil-1.so.* $(1)/usr/lib/
endef

$(eval $(call BuildPackage,libaprutil))
