#
# Copyright (C) 2007 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
# $Id$ 

include $(TOPDIR)/rules.mk

PKG_NAME:=apr
PKG_VERSION:=1.2.9
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=http://apache.d-s-s-p.de/apr/
PKG_MD5SUM:=6f4b063ac01a54ba0818c31280f06959

PKG_FIXUP = libtool

include $(INCLUDE_DIR)/package.mk

define Package/libapr
  SECTION:=libs
  CATEGORY:=Libraries
  DEPENDS:=+libpthread
  TITLE:=Apache Portable Runtime Library
  URL:=http://apr.apache.org/
endef

CONFIGURE_ARGS += \
	--with-devrandom=/dev/urandom \
	--disable-dso \
	--disable-ipv6

CONFIGURE_VARS += \
	ac_cv_file__dev_zero=yes \
	apr_cv_process_shared_works=no \
	apr_cv_mutex_robust_shared=no \
	apr_cv_tcp_nodelay_with_cork=yes \
	ac_cv_sizeof_ssize_t=4 \
	LDFLAGS="$$$$LDFLAGS -lpthread" \

define Build/Compile
	$(MAKE) -C $(PKG_BUILD_DIR) DESTDIR="$(PKG_INSTALL_DIR)" all install
endef

define Build/InstallDev
	mkdir -p $(2)/bin
	$(CP)   $(PKG_INSTALL_DIR)/usr/bin/apr-1-config \
		$(2)/bin
	mkdir -p $(1)/usr/include/apr-1
	$(CP)   $(PKG_INSTALL_DIR)/usr/include/apr-1/* \
		$(1)/usr/include/apr-1/
	mkdir -p $(1)/usr/lib
	$(CP)   $(PKG_INSTALL_DIR)/usr/lib/libapr-1.{la,a,so*} \
		$(1)/usr/lib/
	mkdir -p $(1)/usr/lib/pkgconfig
	$(CP)   $(PKG_INSTALL_DIR)/usr/lib/pkgconfig/apr-1.pc \
		$(1)/usr/lib/pkgconfig/
	mkdir -p $(1)/usr/share/build-1
	$(CP)   $(PKG_INSTALL_DIR)/usr/share/build-1/* \
		$(1)/usr/share/build-1/
	$(SED) 's,^datadir=\"/usr/share\",datadir=\"$(1)/usr/share\",g' $(2)/bin/apr-1-config
	$(SED) 's,^installbuilddir=\"/usr/share/build-1\",installbuilddir=\"$(1)/usr/share/build-1\",g' $(2)/bin/apr-1-config
	$(SED) 's,^libdir=\"$$$${exec_prefix}/lib,libdir=\"$(1)/usr/lib,g' $(2)/bin/apr-1-config
	$(SED) 's,^includedir=\"$$$${prefix}/include/,includedir=\"$(1)/usr/include/,g' $(2)/bin/apr-1-config
	$(SED) 's,-L$$$$libdir,,g' $(2)/bin/apr-1-config
	$(SED) 's,-R$$$$libdir,,g' $(2)/bin/apr-1-config
	$(SED) 's,/usr/share/build-1,$(1)/usr/share/build-1,g' $(1)/usr/share/build-1/apr_rules.mk
endef

define Package/libapr/install
	$(INSTALL_DIR) $(1)/usr/lib
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/libapr-1.so.* $(1)/usr/lib/
endef

$(eval $(call BuildPackage,libapr))
