# 
# Copyright (C) 2007 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
# $Id$

include $(TOPDIR)/rules.mk

PKG_NAME:=libtasn1
PKG_VERSION:=1.1
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=ftp://ftp.gnutls.org/pub/gnutls/libtasn1/ \
	ftp://ftp.gnupg.org/gcrypt/alpha/gnutls/libtasn1/ \
	http://www.mirrors.wiretapped.net/security/network-security/gnutls/libtasn1/ \
	ftp://ftp.mirrors.wiretapped.net/pub/security/network-security/gnutls/libtasn1/ \
	http://josefsson.org/gnutls/releases/libtasn1/
PKG_MD5SUM:=93b43cc5013bda4d8bf64508f1566c54

include $(INCLUDE_DIR)/package.mk

define Package/libtasn1
  SECTION:=libs
  CATEGORY:=Libraries
  TITLE:=An ASN.1 and DER structures manipulation library
  URL:=ftp://ftp.gnutls.org/pub/gnutls/libtasn1/
endef

define Package/libtasn1/description
 This is a library for Abstract Syntax Notation One (ASN.1) and 
 Distinguish Encoding Rules (DER) manipulation.
endef

define Build/Configure
	$(call Build/Configure/Default, \
		--enable-shared \
		--enable-static \
	)
	$(call libtool_disable_rpath)
endef

define Build/Compile
	$(MAKE) -C $(PKG_BUILD_DIR) all
	$(call libtool_fixup_libdir,$(PKG_INSTALL_DIR))
	$(MAKE) -C $(PKG_BUILD_DIR) DESTDIR="$(PKG_INSTALL_DIR)" all install
endef

define Build/InstallDev
	mkdir -p $(STAGING_DIR)/usr/bin
	$(CP) $(PKG_INSTALL_DIR)/usr/bin/libtasn1-config $(STAGING_DIR)/usr/bin/
	mkdir -p $(STAGING_DIR)/usr/include
	$(CP) $(PKG_INSTALL_DIR)/usr/include/libtasn1.h $(STAGING_DIR)/usr/include/
	mkdir -p $(STAGING_DIR)/usr/lib
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/libtasn1.{a,so*} $(STAGING_DIR)/usr/lib/
	$(SED) 's,-I$$$${prefix}/include,,g' $(STAGING_DIR)/usr/bin/libtasn1-config
	$(SED) 's,-L$$$${exec_prefix}/lib,,g' $(STAGING_DIR)/usr/bin/libtasn1-config
endef

define Build/UninstallDev
	rm -rf \
		$(STAGING_DIR)/usr/bin/libtasn1-config \
		$(STAGING_DIR)/usr/include/libtasn1.h \
		$(STAGING_DIR)/usr/lib/libtasn1.{a,so*} \
		$(STAGING_DIR)/usr/share/aclocal/libtasn1.m4
endef

define Package/libtasn1/install
	$(INSTALL_DIR) $(1)/usr/lib
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/libtasn1.so.* $(1)/usr/lib/
endef

$(eval $(call BuildPackage,libtasn1))
