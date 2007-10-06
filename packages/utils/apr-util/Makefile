#
# Copyright (C) 2007 OpenWrt.org
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
PKG_CAT:=zcat

PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)-$(PKG_VERSION)
PKG_INSTALL_DIR:=$(PKG_BUILD_DIR)/ipkg-install

include $(INCLUDE_DIR)/package.mk

define Package/apr-util
  SECTION:=utils
  CATEGORY:=Utilities
  DEPENDS:=+libiconv +libexpat +apr +libpthread +libopenssl +libsqlite3
  TITLE:=Apache Portable Runtime Library Util
  URL:=http://apr.apache.org/
endef

define Build/Configure	
	$(call Build/Configure/Default, \
		--with-pgsql=no \
		--with-apr="$(STAGING_DIR)/usr/bin/apr-1-config" \
		--with-expat="$(STAGING_DIR)/usr" \
		--without-sqlite2 \
		, \
		ac_cv_file_dbd_apr_dbd_mysql_c=no \
		APR_BUILD_DIR="$(STAGING_DIR)/usr/share/build-1" \
		CFLAGS="-I$(STAGING_DIR)/usr/lib/libiconv/include/" \
		LDFLAGS="-ldl -L$(STAGING_DIR)/lib \
			 -L$(STAGING_DIR)/usr/lib" \
	)
endef

define Build/Compile	
	$(MAKE) -C $(PKG_BUILD_DIR) \
		DESTDIR="$(PKG_INSTALL_DIR)" \
		all install
endef

define Build/InstallDev
	mkdir -p $(STAGING_DIR)/usr/bin
	$(CP)   $(PKG_INSTALL_DIR)/usr/bin/apu-1-config \
	 	$(STAGING_DIR)/usr/bin
	mkdir -p $(STAGING_DIR)/usr/include/apr-1/
	$(CP)   $(PKG_INSTALL_DIR)/usr/include/apr-1/* \
		$(STAGING_DIR)/usr/include/apr-1/
	mkdir -p $(STAGING_DIR)/usr/lib 
		$(CP)   $(PKG_INSTALL_DIR)/usr/lib/*aprutil* \
		$(STAGING_DIR)/usr/lib/
	mkdir -p $(STAGING_DIR)/usr/lib/pkgconfig/
		$(CP)   $(PKG_INSTALL_DIR)/usr/lib/pkgconfig/apr-util-1.pc \
		$(STAGING_DIR)/usr/lib/pkgconfig/
	$(SED)  "s,\"/usr\",$(STAGING_DIR)/usr," $(STAGING_DIR)/usr/bin/apu-1-config
endef

define Build/UninstallDev
	rm -rf	$(STAGING_DIR)/usr/bin/apu-1-config \
		$(STAGING_DIR)/usr/lib/{*aprutil-1*,aprutil.exp} \
		$(STAGING_DIR)/usr/include/apr-1
endef

define Package/apr-util/install	
	$(INSTALL_DIR) $(1)/usr/lib
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/* $(1)/usr/lib/
endef

$(eval $(call BuildPackage,apr-util))
