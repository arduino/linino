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


define Package/certtool
$(call Package/gnutls/Default)
  SECTION:=utils
  CATEGORY:=Utilities
  TITLE+= (certool utility)
  DEPENDS+= +libgnutls +libncurses +libreadline
endef

define Package/certtool/description
$(call Package/gnutls/Default/description)
 This package contains the GnuTLS certtool utility.
endef


define Package/gnutls-utils
$(call Package/gnutls/Default)
  SECTION:=utils
  CATEGORY:=Utilities
  TITLE+= (utilities)
  DEPENDS+= +libgnutls +libgnutls-extra
endef

define Package/gnutls-utils/description
$(call Package/gnutls/Default/description)
 This package contains the GnuTLS gnutls-cli, gnutls-serv and psktool
 utilities.
endef


define Package/libgnutls
$(call Package/gnutls/Default)
 TITLE+= (library)
 DEPENDS+= +libgcrypt +libgpg-error
endef

define Package/libgnutls/description
$(call Package/gnutls/Default/description)
 This package contains the GnuTLS shared library, needed by other programs.
endef


define Package/libgnutls-extra
$(call Package/gnutls/Default)
 TITLE+= (extra library)
 DEPENDS+= +libgnutls
endef

define Package/libgnutls-extra/description
$(call Package/gnutls/Default/description)
 This package contains the GnuTLS extra shared library.
endef


define Package/libgnutls-openssl
$(call Package/gnutls/Default)
 TITLE+= (OpenSSL compat library)
 DEPENDS+= +libgnutls
endef

define Package/libgnutls-openssl/description
$(call Package/gnutls/Default/description)
 This package contains the GnuTLS OpenSSL compatibility layer shared library.
endef


# XXX: configure will disable any of theese if they're present regardless of
# the "--enable" prefix
#	--enable-anon-authentication \
#	--enable-openpgp-authentication \
#	--enable-psk-authentication \
#	--enable-srp-authentication \
#	--enable-tls-authorization \
#
# and the following prevents the library from building so it's ommited
#	--disable-tls-authorization

CONFIGURE_ARGS+= \
	--enable-shared \
	--enable-static \
	--disable-anon-authentication \
	--disable-openpgp-authentication \
	--disable-psk-authentication \
	--disable-srp-authentication \
	--with-included-libtasn1 \
	--with-included-libcfg \
	--without-included-opencdk \
	--with-libgcrypt \
	--with-libgcrypt-prefix="$(STAGING_DIR)/usr" \
	--without-libiconv-prefix \
	--without-libintl-prefix \
	--without-libopencdk-prefix \
	--with-libreadline-prefix="$(STAGING_DIR)/usr" \
	--without-lzo \
	--without-zlib \

# XXX: AM_CFLAGS duplicates with CFLAGS
MAKE_ARGS:= \
	AM_CFLAGS="" \

define Build/Configure
	$(SED) 's,-I$$$${includedir},,g' $(PKG_BUILD_DIR)/configure
	$(SED) 's,-L$$$${libdir},,g' $(PKG_BUILD_DIR)/configure
	$(call Build/Configure/Default)
	$(call libtool_disable_rpath)
endef

define Build/Compile
	$(MAKE) -C $(PKG_BUILD_DIR) $(MAKE_ARGS) all
	$(call libtool_fixup_libdir,$(PKG_INSTALL_DIR))
	$(MAKE) -C $(PKG_BUILD_DIR) $(MAKE_ARGS) DESTDIR="$(PKG_INSTALL_DIR)" install
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
endef

define Build/UninstallDev
	rm -rf	$(STAGING_DIR)/usr/bin/libgnutls{,-extra}-config \
		$(STAGING_DIR)/usr/include/gnutls \
		$(STAGING_DIR)/usr/lib/libgnutls{,-extra,-openssl}.{a,so*} \
		$(STAGING_DIR)/usr/lib/pkgconfig/gnutls{,-extra}.pc
endef


define Package/certtool/conffiles
/etc/gnutls/certtool.cfg
endef

define Package/certtool/install
	$(INSTALL_DIR) $(1)/etc/gnutls
	$(INSTALL_CONF) $(PKG_BUILD_DIR)/doc/certtool.cfg $(1)/etc/gnutls/
	$(INSTALL_DIR) $(1)/usr/bin
	$(CP) $(PKG_INSTALL_DIR)/usr/bin/certtool $(1)/usr/bin/
endef


define Package/gnutls-utils/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(CP) $(PKG_INSTALL_DIR)/usr/bin/gnutls-{cli,serv} $(1)/usr/bin/
	$(CP) $(PKG_INSTALL_DIR)/usr/bin/psktool $(1)/usr/bin/
endef


define Package/libgnutls/install
	$(INSTALL_DIR) $(1)/usr/lib
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/libgnutls.so.* $(1)/usr/lib/
endef


define Package/libgnutls-extra/install
	$(INSTALL_DIR) $(1)/usr/lib
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/libgnutls-extra.so.* $(1)/usr/lib/
endef


define Package/libgnutls-openssl/install
	$(INSTALL_DIR) $(1)/usr/lib
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/libgnutls-openssl.so.* $(1)/usr/lib/
endef


$(eval $(call BuildPackage,certtool))
$(eval $(call BuildPackage,gnutls-utils))
$(eval $(call BuildPackage,libgnutls))
$(eval $(call BuildPackage,libgnutls-extra))
$(eval $(call BuildPackage,libgnutls-openssl))
