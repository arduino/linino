#
# Copyright (C) 2006 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
# crazy_imp

include $(TOPDIR)/rules.mk

PKG_NAME:=apr-util
PKG_VERSION:=0.9.13
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=http://apache.autinity.de/apr/
PKG_MD5SUM:=31e3881af0d9546286b0057717cdb89b
PKG_CAT:=zcat

PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)-$(PKG_VERSION)
PKG_INSTALL_DIR:=$(PKG_BUILD_DIR)/ipkg-install

include $(INCLUDE_DIR)/package.mk

define Package/apr-util
  SECTION:=utils
  CATEGORY:=Utilities
  DEPENDS:=+libiconv +libexpat +apr
  TITLE:=Apache Portable Runtime Library Util
  URL:=http://apr.apache.org/
endef

define Build/Configure	
	$(call Build/Configure/Default, \
		--with-apr="$(STAGING_DIR)/usr/bin/apr-config" \
		, \
		APR_BUILD_DIR="$(STAGING_DIR)/usr/share/build" \
		CFLAGS="-I$(STAGING_DIR)/usr/lib/libiconv/include/" \
	)
endef

define Build/Compile	
	$(MAKE) -C $(PKG_BUILD_DIR) \
		DESTDIR="$(PKG_INSTALL_DIR)" \
		all install
endef

define Build/InstallDev
	mkdir -p $(STAGING_DIR)/usr/bin
	$(CP)   $(PKG_INSTALL_DIR)/usr/bin/apu-config \
	 	$(STAGING_DIR)/usr/bin
	mkdir -p $(STAGING_DIR)/usr/include/apr-0/
	$(CP)   $(PKG_INSTALL_DIR)/usr/include/apr-0/* \
		$(STAGING_DIR)/usr/include/apr-0/
	mkdir -p $(STAGING_DIR)/usr/lib 
		$(CP)   $(PKG_INSTALL_DIR)/usr/lib/*aprutil* \
		$(STAGING_DIR)/usr/lib/
	$(SED)  "s,\"/usr\",$(STAGING_DIR)/usr," $(STAGING_DIR)/usr/bin/apu-config
endef

define Build/UninstallDev
	rm 	$(STAGING_DIR)/usr/bin/apu-config \
		$(STAGING_DIR)/usr/include/apr-0/{apr_anylock.h,apr_base64.h,apr_buckets.h,apr_date.h,apr_dbm.h,apr_hooks.h,apr_ldap.h,apr_ldap_url.h,apr_md4.h,apr_md5.h,apr_optional.h,apr_optional_hooks.h,apr_queue.h,apr_reslist.h,apr_rmm.h,apr_sdbm.h,apr_sha1.h,apr_strmatch.h,apr_uri.h,apr_uuid.h,apr_xlate.h,apr_xml.h,apu_compat.h,apu.h,apu_version.h,apu_want.h} \
		$(STAGING_DIR)/usr/lib/*aprutil*
endef

define Package/apr-util/install	
	$(INSTALL_DIR) $(1)/usr/bin
	$(CP) $(PKG_INSTALL_DIR)/usr/bin/apu-config $(1)/usr/bin/
	$(INSTALL_DIR) $(1)/usr/lib
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/* $(1)/usr/lib/
endef

$(eval $(call BuildPackage,apr-util))
