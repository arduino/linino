# 
# Copyright (C) 2007 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
# $Id$

include $(TOPDIR)/rules.mk

PKG_NAME:=gnutls
PKG_VERSION:=2.0.0
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.bz2
PKG_SOURCE_URL:=http://josefsson.org/gnutls/releases/ \
	http://www.mirrors.wiretapped.net/security/network-security/gnutls/ \
	ftp://ftp.gnutls.org/pub/gnutls/ \
	ftp://ftp.gnupg.org/gcrypt/alpha/gnutls/ \
	ftp://ftp.mirrors.wiretapped.net/pub/security/network-security/gnutls/
PKG_MD5SUM:=181b2ff554a83e6cf85505ea16699d39

include $(INCLUDE_DIR)/package.mk

define Package/gnutls/Default
  SECTION:=libs
  CATEGORY:=Libraries
  TITLE:=GNU TLS
  URL:=http://www.gnu.org/software/gnutls/
endef

define Package/gnutls/Default/description
 GnuTLS is a project that aims to develop a library which provides a
 secure layer, over a reliable transport layer. Currently the GnuTLS
 library implements the proposed standards by the IETF's TLS working
 group.
endef

define Package/gnutls-utils
  $(call Package/gnutls/Default)
  SECTION:=utils
  CATEGORY:=Utilities
  DEPENDS:=+libgnutls +libgpg-error
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
		--with-included-libtasn1=yes \
		--with-included-libcfg=yes \
		--without-libopencdk-prefix \
		--without-zlib \
		--without-lzo \
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
	$(CP) $(PKG_INSTALL_DIR)/usr/bin/libgnutls{,-extra}-config $(STAGING_DIR)/usr/bin/
	mkdir -p $(STAGING_DIR)/usr/include
	$(CP) $(PKG_INSTALL_DIR)/usr/include/gnutls $(STAGING_DIR)/usr/include/
	mkdir -p $(STAGING_DIR)/usr/lib
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/libgnutls{,-extra,-openssl}.{a,so*} $(STAGING_DIR)/usr/lib/
	mkdir -p $(STAGING_DIR)/usr/lib/pkgconfig
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/pkgconfig/gnutls{,-extra}.pc $(STAGING_DIR)/usr/lib/pkgconfig/
	$(SED) 's,-I$$$${includedir},,g' $(STAGING_DIR)/usr/lib/pkgconfig/gnutls{,-extra}.pc
	$(SED) 's,-L$$$${libdir},,g' $(STAGING_DIR)/usr/lib/pkgconfig/gnutls{,-extra}.pc
	$(SED)  "s,"prefix\=/usr",prefix=$(STAGING_DIR)/usr," $(STAGING_DIR)/usr/lib/pkgconfig/gnutls-extra.pc
	$(SED)  "s,"exec_prefix\=/usr",exec_prefix=$(STAGING_DIR)/usr," $(STAGING_DIR)/usr/lib/pkgconfig/gnutls-extra.pc
endef

define Build/UninstallDev
	rm -rf	$(STAGING_DIR)/usr/bin/libgnutls{,-extra}-config \
		$(STAGING_DIR)/usr/include/gnutls \
		$(STAGING_DIR)/usr/lib/libgnutls{,-extra,-openssl}.{a,so*} \
		$(STAGING_DIR)/usr/lib/pkgconfig/gnutls{,-extra}.pc \
		$(STAGING_DIR)/usr/share/aclocal/libgnutls{,-extra}.m4
endef

define Package/gnutls-utils/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(CP) $(PKG_INSTALL_DIR)/usr/bin/certtool $(1)/usr/bin/
	$(CP) $(PKG_INSTALL_DIR)/usr/bin/gnutls-{cli,serv} $(1)/usr/bin/
endef

define Package/libgnutls/install
	$(INSTALL_DIR) $(1)/usr/lib
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/libgnutls{,-extra}.so.* $(1)/usr/lib/
endef

define Package/libgnutls-openssl/install
	$(INSTALL_DIR) $(1)/usr/lib
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/libgnutls-openssl.so.* $(1)/usr/lib/
endef

$(eval $(call BuildPackage,gnutls-utils))
$(eval $(call BuildPackage,libgnutls))
$(eval $(call BuildPackage,libgnutls-openssl))
