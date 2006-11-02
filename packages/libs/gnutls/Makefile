# 
# Copyright (C) 2006 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
# $Id$

include $(TOPDIR)/rules.mk

PKG_NAME:=gnutls
PKG_VERSION:=1.0.25
PKG_RELEASE:=0

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=ftp://ftp.gnutls.org/pub/gnutls/ \
	ftp://ftp.gnupg.org/gcrypt/alpha/gnutls/ \
	http://www.mirrors.wiretapped.net/security/network-security/gnutls/ \
	ftp://ftp.mirrors.wiretapped.net/pub/security/network-security/gnutls/ \
	http://josefsson.org/gnutls/releases/
PKG_MD5SUM:=3585b5b204135e51e0efc9084b3e028b
PKG_CAT:=zcat

PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)-$(PKG_VERSION)
PKG_INSTALL_DIR:=$(PKG_BUILD_DIR)/ipkg-install

include $(INCLUDE_DIR)/package.mk

define Package/gnutls/Default
  SECTION:=libs
  CATEGORY:=Libraries
  TITLE:=GNU TLS
  DESCRIPTION:=\
	GnuTLS is a project that aims to develop a library which provides a \\\
	secure layer, over a reliable transport layer. Currently the GnuTLS \\\
	library implements the proposed standards by the IETF's TLS working \\\
	group.
  URL:=http://www.gnu.org/software/gnutls/
endef

define Package/gnutls-utils
  $(call Package/gnutls/Default)
  SECTION:=utils
  CATEGORY:=Utilities
  DEPENDS:=+libgnutls
  TITLE+= (utilities)
  DESCRIPTION+=\\\
	\\\
	This package contains some GnuTLS utilities.
endef

define Package/libgnutls
  $(call Package/gnutls/Default)
  DEPENDS:=+libgcrypt
  TITLE+= (library)
  DESCRIPTION+=\\\
	\\\
	This package contains the GnuTLS shared libraries, needed by other programs.
endef

define Package/libgnutls-openssl
  $(call Package/gnutls/Default)
  DEPENDS:=libgnutls
  TITLE+= (OpenSSL compat library)
  DESCRIPTION+=\\\
	\\\
	This package contains the GnuTLS OpenSSL compatibility layer shared library.
endef

define Build/Configure
	$(call Build/Configure/Default, \
		--enable-shared \
		--enable-static \
		--disable-srp-authentication \
		--disable-anon-authentication \
		--disable-openpgp-authentication \
		--with-included-opencdk=yes \
		--with-included-libtasn1=yes \
		--with-included-libcfg=yes \
		--without-zlib \
		--without-lzo \
	)
endef

define Build/Compile
	$(MAKE) -C $(PKG_BUILD_DIR) \
		DESTDIR="$(PKG_INSTALL_DIR)" \
		all install
endef

define Build/InstallDev
	mkdir -p $(STAGING_DIR)/usr/bin
	$(CP) $(PKG_INSTALL_DIR)/usr/bin/libgnutls{,-extra}-config $(STAGING_DIR)/usr/bin/
	mkdir -p $(STAGING_DIR)/usr/include
	$(CP) $(PKG_INSTALL_DIR)/usr/include/gnutls $(STAGING_DIR)/usr/include/
	mkdir -p $(STAGING_DIR)/usr/lib
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/libgnutls{,-extra,-openssl}.{a,so*} $(STAGING_DIR)/usr/lib/
	mkdir -p $(STAGING_DIR)/usr/lib/pkgconfig
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/pkgconfig/gnutls{,-extra}.pc $(STAGING_DIR)/usr/lib/pkgconfig/
	$(SED) 's,-I$$$${includedir},,g' $(STAGING_DIR)/usr/lib/pkgconfig/gnutls{,-extra}.pc
	$(SED) 's,-L$$$${libdir},,g' $(STAGING_DIR)/usr/lib/pkgconfig/gnutls{,-extra}.pc
	mkdir -p $(STAGING_DIR)/usr/share/aclocal
	$(CP) $(PKG_INSTALL_DIR)/usr/share/aclocal/libgnutls{,-extra}.m4 $(STAGING_DIR)/usr/share/aclocal/
endef

define Build/UninstallDev
	rm -rf	$(STAGING_DIR)/usr/bin/libgnutls{,-extra}-config \
		$(STAGING_DIR)/usr/include/gnutls \
		$(STAGING_DIR)/usr/lib/libgnutls{,-extra,-openssl}.{a,so*} \
		$(STAGING_DIR)/usr/lib/pkgconfig/gnutls{,-extra}.pc \
		$(STAGING_DIR)/usr/share/aclocal/libgnutls{,-extra}.m4
endef

define Package/gnutls-utils/install
	install -d -m0755 $(1)/usr/bin
	$(CP) $(PKG_INSTALL_DIR)/usr/bin/certtool $(1)/usr/bin/
	$(CP) $(PKG_INSTALL_DIR)/usr/bin/gnutls-{cli,serv} $(1)/usr/bin/
endef

define Package/libgnutls/install
	install -d -m0755 $(1)/usr/lib
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/libgnutls{,-extra}.so.* $(1)/usr/lib/
endef

define Package/libgnutls-openssl/install
	install -d -m0755 $(1)/usr/lib
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/libgnutls-openssl.so.* $(1)/usr/lib/
endef

$(eval $(call BuildPackage,gnutls-utils))
$(eval $(call BuildPackage,libgnutls))
$(eval $(call BuildPackage,libgnutls-openssl))
