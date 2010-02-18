#
# Copyright (C) 2007-2009 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=apr
PKG_VERSION:=1.3.9
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.bz2
PKG_SOURCE_URL:=http://www.ibiblio.org/pub/mirrors/apache/apr
PKG_MD5SUM:=7138ac64d4458eeeaa9b9aefa4e6e51b

PKG_FIXUP:=libtool
PKG_INSTALL:=1

include $(INCLUDE_DIR)/package.mk

define Package/libapr
  SECTION:=libs
  CATEGORY:=Libraries
  DEPENDS:=+libpthread
  TITLE:=Apache Portable Runtime Library
  URL:=http://apr.apache.org/
endef

TARGET_CFLAGS += $(FPIC)
CONFIGURE_ARGS += \
	--with-devrandom=/dev/urandom \
	--disable-dso \
	--enable-ipv6

# XXX: ac_cv_sizeof_struct_iovec=1 is just to trick configure
CONFIGURE_VARS += \
	ac_cv_sizeof_struct_iovec=1 \
	apr_cv_process_shared_works=no \
	apr_cv_mutex_robust_shared=no \
	apr_cv_tcp_nodelay_with_cork=yes \
	LDFLAGS="$$$$LDFLAGS -lpthread" \

define Build/InstallDev
	$(INSTALL_DIR) $(1)/usr/bin $(1)/usr/include/apr-1 $(1)/usr/lib $(1)/usr/lib/pkgconfig $(1)/usr/share/build-1
	$(CP)   $(PKG_INSTALL_DIR)/usr/bin/apr-1-config \
		$(1)/usr/bin/
	$(CP)   $(PKG_INSTALL_DIR)/usr/include/apr-1/* \
		$(1)/usr/include/apr-1/
	$(CP)   $(PKG_INSTALL_DIR)/usr/lib/libapr-1.{la,a,so*} \
		$(1)/usr/lib/
	$(CP)   $(PKG_INSTALL_DIR)/usr/lib/pkgconfig/apr-1.pc \
		$(1)/usr/lib/pkgconfig/
	$(CP)   $(PKG_INSTALL_DIR)/usr/share/build-1/* \
		$(1)/usr/share/build-1/
	$(SED) 's,^datadir=\"/usr/share\",datadir=\"$(STAGING_DIR)/usr/share\",g' $(1)/usr/bin/apr-1-config
	$(SED) 's,^installbuilddir=\"/usr/share/build-1\",installbuilddir=\"$(STAGING_DIR)/usr/share/build-1\",g' $(1)/usr/bin/apr-1-config
	$(SED) 's,^libdir=\"$$$${exec_prefix}/lib,libdir=\"$(STAGING_DIR)/usr/lib,g' $(1)/usr/bin/apr-1-config
	$(SED) 's,^includedir=\"$$$${prefix}/include/,includedir=\"$(STAGING_DIR)/usr/include/,g' $(1)/usr/bin/apr-1-config
	$(SED) 's,-L$$$$libdir,,g' $(1)/usr/bin/apr-1-config
	$(SED) 's,-R$$$$libdir,,g' $(1)/usr/bin/apr-1-config
	$(SED) 's,/usr/share/build-1,$(STAGING_DIR)/usr/share/build-1,g' $(1)/usr/share/build-1/apr_rules.mk
endef

define Package/libapr/install
	$(INSTALL_DIR) $(1)/usr/lib
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/libapr-1.so.* $(1)/usr/lib/
endef

$(eval $(call BuildPackage,libapr))
