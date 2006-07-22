# 
# Copyright (C) 2006 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
# $Id$

include $(TOPDIR)/rules.mk

PKG_NAME:=libtasn1
PKG_VERSION:=0.2.13
PKG_RELEASE:=0

PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)-$(PKG_VERSION)
PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=ftp://ftp.gnutls.org/pub/gnutls/libtasn1/ \
	ftp://ftp.gnupg.org/gcrypt/alpha/gnutls/libtasn1/ \
	http://www.mirrors.wiretapped.net/security/network-security/gnutls/libtasn1/ \
	ftp://ftp.mirrors.wiretapped.net/pub/security/network-security/gnutls/libtasn1/ \
	http://josefsson.org/gnutls/releases/libtasn1/
PKG_MD5SUM:=d124b11908cfb88883fe71472c25d53a
PKG_CAT:=zcat

PKG_INSTALL_DIR:=$(PKG_BUILD_DIR)/ipkg-install

include $(INCLUDE_DIR)/package.mk

define Package/libtasn1
  SECTION:=libs
  CATEGORY:=Libraries
  TITLE:=An ASN.1 and DER structures manipulation library
  DESCRIPTION:=An ASN.1 and DER structures manipulation library.
    This is a library for Abstract Syntax Notation One (ASN.1) and \\\
    Distinguish Encoding Rules (DER) manipulation.
  URL:=ftp://ftp.gnutls.org/pub/gnutls/libtasn1/
endef

define Build/Configure
	(cd $(PKG_BUILD_DIR); rm -f config.cache; \
		touch configure.ac ; \
		touch acinclude.m4 ; \
		touch aclocal.m4 ; \
		touch Makefile.in ; \
		touch config.h.in ; \
		touch configure ; \
		$(TARGET_CONFIGURE_OPTS) \
		CFLAGS="$(TARGET_CFLAGS)" \
		CPPFLAGS="-I$(STAGING_DIR)/usr/include -I$(STAGING_DIR)/include" \
		LDFLAGS="-L$(STAGING_DIR)/usr/lib -L$(STAGING_DIR)/lib" \
		./configure \
			--target=$(GNU_TARGET_NAME) \
			--host=$(GNU_TARGET_NAME) \
			--build=$(GNU_HOST_NAME) \
			--program-prefix="" \
			--program-suffix="" \
			--prefix=/usr \
			--exec-prefix=/usr \
			--bindir=/usr/bin \
			--datadir=/usr/share \
			--includedir=/usr/include \
			--infodir=/usr/share/info \
			--libdir=/usr/lib \
			--libexecdir=/usr/lib \
			--localstatedir=/var \
			--mandir=/usr/share/man \
			--sbindir=/usr/sbin \
			--sysconfdir=/etc \
			$(DISABLE_NLS) \
			$(DISABLE_LARGEFILE) \
			--enable-shared \
			--enable-static \
			--disable-rpath \
	);
endef

define Build/Compile
	rm -rf $(PKG_INSTALL_DIR)
	mkdir -p $(PKG_INSTALL_DIR)
	$(MAKE) -C $(PKG_BUILD_DIR) \
		DESTDIR="$(PKG_INSTALL_DIR)" \
		all install
endef

define Package/libtasn1/install
	install -m0755 -d $(1)/usr/lib
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/libtasn1.so.* $(1)/usr/lib/
endef

define Build/InstallDev
	mkdir -p $(STAGING_DIR)/usr/bin
	$(CP) $(PKG_INSTALL_DIR)/usr/bin/libtasn1-config $(STAGING_DIR)/usr/bin/
	mkdir -p $(STAGING_DIR)/usr/include
	$(CP) $(PKG_INSTALL_DIR)/usr/include/libtasn1.h $(STAGING_DIR)/usr/include/
	mkdir -p $(STAGING_DIR)/usr/lib
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/libtasn1.{a,so*} $(STAGING_DIR)/usr/lib/
	mkdir -p $(STAGING_DIR)/usr/share/aclocal
	$(CP) $(PKG_INSTALL_DIR)/usr/share/aclocal/libtasn1.m4 $(STAGING_DIR)/usr/share/aclocal/
endef

define Build/UninstallDev
	rm -rf \
		$(STAGING_DIR)/usr/bin/libtasn1-config \
		$(STAGING_DIR)/usr/include/libtasn1.h \
		$(STAGING_DIR)/usr/lib/libtasn1.{a,so*} \
		$(STAGING_DIR)/usr/share/aclocal/libtasn1.m4
endef

$(eval $(call BuildPackage,libtasn1))
