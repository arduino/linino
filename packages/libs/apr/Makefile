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
PKG_CAT:=zcat

PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)-$(PKG_VERSION)
PKG_INSTALL_DIR:=$(PKG_BUILD_DIR)/ipkg-install

include $(INCLUDE_DIR)/package.mk

define Package/apr
  SECTION:=libs
  CATEGORY:=Libraries
  DEPENDS:=+libpthread
  TITLE:=Apache Portable Runtime Library
  DESCRIPTION:=\
  	Apache Portable Runtime Library
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
		LDFLAGS="-lpthread -L$(STAGING_DIR)/lib" \
		CFLAGS="-I$(STAGING_DIR)/include $(TARGET_CFLAGS)"

MAKE_FLAGS += \
	DESTDIR="$(PKG_INSTALL_DIR)" \
	all install

define Build/InstallDev
	mkdir -p $(STAGING_DIR)/usr/bin
	$(CP)   $(PKG_INSTALL_DIR)/usr/bin/apr-1-config \
		$(STAGING_DIR)/usr/bin
	mkdir -p $(STAGING_DIR)/usr/include
	$(CP)   $(PKG_INSTALL_DIR)/usr/include/apr-1/ \
		$(STAGING_DIR)/usr/include/
	mkdir -p $(STAGING_DIR)/usr/lib
	$(CP)   $(PKG_INSTALL_DIR)/usr/lib/*apr* \
		$(STAGING_DIR)/usr/lib/
	mkdir -p $(STAGING_DIR)/usr/share/
	$(CP)   $(PKG_INSTALL_DIR)/usr/share/build-1/ \
		$(STAGING_DIR)/usr/share/
	$(SED) "s,/usr/share/build-1,$(STAGING_DIR)/usr/share/build-1," $(STAGING_DIR)/usr/share/build-1/apr_rules.mk
	$(SED)  "s,\"/usr\",$(STAGING_DIR)/usr," $(STAGING_DIR)/usr/bin/apr-1-config
	$(SED)  "s,"libdir\=\'/usr/lib\'",libdir='$(STAGING_DIR)/usr/lib\'," $(STAGING_DIR)/usr/lib/libapr-1.la
	$(SED)  "s,"bindir\=\"/usr/bin\"",bindir=\"$(STAGING_DIR)/usr/bin\"," $(STAGING_DIR)/usr/bin/apr-1-config
	$(SED)  "s,"datadir\=\"/usr/share\"",datadir=\"$(STAGING_DIR)/usr/share\"," $(STAGING_DIR)/usr/bin/apr-1-config
	$(SED)  "s,"installbuilddir\=\"/usr/share/build-1\"",installbuilddir=\"$(STAGING_DIR)/usr/share/build-1\"," $(STAGING_DIR)/usr/bin/apr-1-config
endef

define Build/UninstallDev
	rm -rf	$(STAGING_DIR)/usr/bin/apr-1-config \
		$(STAGING_DIR)/usr/lib/{libapr-1*,apr.exp} \
		$(STAGING_DIR)/usr/share/build-1/ \
		$(STAGING_DIR)/usr/include/apr-1/
endef

define Package/apr/install
	$(INSTALL_DIR) $(1)/usr/lib
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/* $(1)/usr/lib/
endef

$(eval $(call BuildPackage,apr))
