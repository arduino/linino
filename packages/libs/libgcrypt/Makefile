# 
# Copyright (C) 2006 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
# $Id$

include $(TOPDIR)/rules.mk

PKG_NAME:=libgcrypt
PKG_VERSION:=1.2.3
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.bz2
PKG_SOURCE_URL:=http://ftp.gnupg.org/gcrypt/libgcrypt/
PKG_MD5SUM:=49810175ab672b19a02509d2a670b156

PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)-$(PKG_VERSION)
PKG_INSTALL_DIR:=$(PKG_BUILD_DIR)/ipkg-install
PKG_FIXUP:=libtool

include $(INCLUDE_DIR)/package.mk

define Package/libgcrypt
  SECTION:=libs
  CATEGORY:=Libraries
  DEPENDS:=+libgpg-error
  TITLE:=GNU crypto library
  URL:=http://directory.fsf.org/security/libgcrypt.html
endef

define Package/libgcrypt/description
	This is a general purpose cryptographic library based on the code from 
	GnuPG. It provides functions for all cryptograhic building blocks: 
	symmetric ciphers (AES, DES, Blowfish, CAST5, Twofish, Arcfour), hash 
	algorithms (MD4, MD5, RIPE-MD160, SHA-1, TIGER-192), MACs (HMAC for all 
	hash algorithms), public key algorithms (RSA, ElGamal, DSA), large 
	integer functions, random numbers and a lot of supporting functions.
endef

define Build/Configure
	$(call Build/Configure/Default, \
		--enable-shared \
		--enable-static \
		--disable-asm \
		--with-gpg-error-prefix="$(STAGING_DIR)/usr" \
	)
endef

define Build/Compile
	$(MAKE) -C $(PKG_BUILD_DIR) \
		DESTDIR="$(PKG_INSTALL_DIR)" \
		all install
endef

define Build/InstallDev
	mkdir -p $(1)/usr/bin $(2)/bin $(1)/usr/include $(1)/usr/lib $(1)/usr/share/aclocal
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/usr/bin/libgcrypt-config $(1)/usr/bin/
	$(CP) $(PKG_INSTALL_DIR)/usr/include/gcrypt*.h $(1)/usr/include/
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/libgcrypt.{la,a,so*} $(1)/usr/lib/
	$(CP) $(PKG_INSTALL_DIR)/usr/share/aclocal/libgcrypt.m4 $(1)/usr/share/aclocal/
	$(SED) 's,^libdir=\"$$$${exec_prefix}/lib,libdir=\"$(STAGING_DIR)/usr/lib,g' $(1)/usr/bin/libgcrypt-config
	$(SED) 's,^includedir=\"$$$${prefix}/include/,includedir=\"$(STAGING_DIR)/usr/include/,g' $(1)/usr/bin/libgcrypt-config
	ln -sf $(STAGING_DIR)/usr/bin/libgcrypt-config $(2)/bin/
endef

define Package/libgcrypt/install
	$(INSTALL_DIR) $(1)/usr/lib
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/libgcrypt.so.* $(1)/usr/lib/
endef

$(eval $(call BuildPackage,libgcrypt))
