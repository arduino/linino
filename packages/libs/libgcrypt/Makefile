#
# Copyright (C) 2005-2009 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=libgcrypt
PKG_VERSION:=1.4.4
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.bz2
PKG_SOURCE_URL:=ftp://ftp.gnupg.org/gcrypt/libgcrypt/
PKG_MD5SUM:=34105aa927e23c217741966496b97e67

PKG_FIXUP:=libtool
PKG_INSTALL:=1

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
 symmetric ciphers (AES, DES, Arcfour), hash algorithms (MD5, SHA-1,
 RIPE-MD160, SHA-224/256, SHA-384/512), MACs (HMAC for all hash
 algorithms), public key algorithms (RSA, DSA), large integer functions,
 random numbers and a lot of supporting functions. Some algorithms have
 been disabled to reduce size (Blowfish, CAST5, Twofish, Serpent,
 RC2, SEED, Camellia, CRC, MD4, TIGER-192, Whirlpool, ElGamal, ECC).
endef

TARGET_CFLAGS += $(FPIC)

CONFIGURE_ARGS+= \
	--enable-shared \
	--enable-static \
	--disable-asm \
	--with-gpg-error-prefix="$(STAGING_DIR)/usr" \
	--enable-digests="md5 rmd160 sha1 sha256 sha512" \
	--enable-ciphers="arcfour des aes" \
	--enable-pubkey-ciphers="rsa dsa" \

define Build/InstallDev
	$(INSTALL_DIR) $(1)/usr/bin $(2)/bin $(1)/usr/include $(1)/usr/lib $(1)/usr/share/aclocal
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
