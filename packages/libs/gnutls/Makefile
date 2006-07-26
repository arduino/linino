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

PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)-$(PKG_VERSION)
PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=ftp://ftp.gnutls.org/pub/gnutls/ \
	ftp://ftp.gnupg.org/gcrypt/alpha/gnutls/ \
	http://www.mirrors.wiretapped.net/security/network-security/gnutls/ \
	ftp://ftp.mirrors.wiretapped.net/pub/security/network-security/gnutls/ \
	http://josefsson.org/gnutls/releases/
PKG_MD5SUM:=3585b5b204135e51e0efc9084b3e028b
PKG_CAT:=zcat

PKG_INSTALL_DIR:=$(PKG_BUILD_DIR)/ipkg-install

include $(INCLUDE_DIR)/package.mk

define Package/libgnutls
  SECTION:=libs
  CATEGORY:=Libraries
  DEPENDS:=+libgcrypt
  TITLE:=GNU TLS library
  DESCRIPTION:=The GNU TLS library.\\\
    GnuTLS is a project that aims to develop a library which provides a \\\
    secure layer, over a reliable transport layer. Currently the GnuTLS \\\
    library implements the proposed standards by the IETF's TLS working \\\
    group.\\\
    \\\
    This packages contains the GnuTLS shared libraries, needed by other programs.
  URL:=http://www.gnu.org/software/gnutls/
endef

define Package/libgnutls-openssl
  SECTION:=libs
  CATEGORY:=Libraries
  DEPENDS:=libgnutls
  TITLE:=GNU TLS OpenSSL compatibility layer library
  DESCRIPTION:=The GNU TLS OpenSSL compatibility layer library.\\\
    GnuTLS is a project that aims to develop a library which provides a \\\
    secure layer, over a reliable transport layer. Currently the GnuTLS \\\
    library implements the proposed standards by the IETF's TLS working \\\
    group.\\\
    \\\
    This packages contains the GnuTLS OpenSSL compatibility layer shared library.
  URL:=http://www.gnu.org/software/gnutls/
endef

define Package/gnutls-utils
  SECTION:=utils
  CATEGORY:=Utilities
  DEPENDS:=+libgnutls
  TITLE:=GNU TLS utilitis
  DESCRIPTION:=The GNU TLS utilities.\\\
    GnuTLS is a project that aims to develop a library which provides a \\\
    secure layer, over a reliable transport layer. Currently the GnuTLS \\\
    library implements the proposed standards by the IETF's TLS working \\\
    group.\\\
    \\\
    This packages contains some GnuTLS utilities.
  URL:=http://www.gnu.org/software/gnutls/
endef

define Build/Configure
	(cd $(PKG_BUILD_DIR); rm -f config.cache; \
		touch configure.in ; \
		touch acinclude.m4 ; \
		touch aclocal.m4 ; \
		touch Makefile.in ; \
		touch config.h.in ; \
		touch configure ; \
		$(TARGET_CONFIGURE_OPTS) \
		CFLAGS="$(TARGET_CFLAGS)" \
		CPPFLAGS="-I$(STAGING_DIR)/usr/include" \
		LDFLAGS="-L$(STAGING_DIR)/lib -L$(STAGING_DIR)/usr/lib" \
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
			--disable-srp-authentication \
			--disable-anon-authentication \
			--disable-openpgp-authentication \
			--with-included-opencdk=yes \
			--with-included-libtasn1=yes \
			--with-included-libcfg=yes \
			--without-zlib \
			--without-lzo \
	);
endef

define Build/Compile
	rm -rf $(PKG_INSTALL_DIR)
	mkdir -p $(PKG_INSTALL_DIR)
	$(MAKE) -C $(PKG_BUILD_DIR) \
		DESTDIR="$(PKG_INSTALL_DIR)" \
		all install
endef

define Package/libgnutls/install
	install -m0755 -d $(1)/usr/lib
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/libgnutls{,-extra}.so.* $(1)/usr/lib/
endef

define Package/libgnutls-openssl/install
	install -m0755 -d $(1)/usr/lib
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/libgnutls-openssl.so.* $(1)/usr/lib/
endef

define Package/gnutls-utils/install
	install -m0755 -d $(1)/usr/bin
	$(CP) $(PKG_INSTALL_DIR)/usr/bin/certtool $(1)/usr/bin/
	$(CP) $(PKG_INSTALL_DIR)/usr/bin/gnutls-{cli,serv} $(1)/usr/bin/
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
	rm -rf \
		$(STAGING_DIR)/usr/bin/libgnutls{,-extra}-config \
		$(STAGING_DIR)/usr/include/gnutls \
		$(STAGING_DIR)/usr/lib/libgnutls{,-extra,-openssl}.{a,so*} \
		$(STAGING_DIR)/usr/lib/pkgconfig/gnutls{,-extra}.pc \
		$(STAGING_DIR)/usr/share/aclocal/libgnutls{,-extra}.m4
endef

$(eval $(call BuildPackage,libgnutls))
$(eval $(call BuildPackage,libgnutls-openssl))
$(eval $(call BuildPackage,gnutls-utils))
