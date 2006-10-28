# 
# Copyright (C) 2006 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
# $Id$

include $(TOPDIR)/rules.mk

PKG_NAME:=libgcrypt
PKG_VERSION:=1.2.1
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.bz2
PKG_SOURCE_URL:=http://ftp.gnupg.org/gcrypt/libgcrypt/
PKG_MD5SUM:=b6d3217c9333c520fe54d2e8dc5e60ec
PKG_CAT:=bzcat

PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)-$(PKG_VERSION)
PKG_INSTALL_DIR:=$(PKG_BUILD_DIR)/ipkg-install

include $(INCLUDE_DIR)/package.mk

define Package/libgcrypt
  SECTION:=libs
  CATEGORY:=Libraries
  DEPENDS:=+libgpg-error
  TITLE:=GNU crypto library
  DESCRIPTION:=\
	This is a general purpose cryptographic library based on the code from \\\
	GnuPG. It provides functions for all cryptograhic building blocks: \\\
	symmetric ciphers (AES, DES, Blowfish, CAST5, Twofish, Arcfour), hash \\\
	algorithms (MD4, MD5, RIPE-MD160, SHA-1, TIGER-192), MACs (HMAC for all \\\
	hash algorithms), public key algorithms (RSA, ElGamal, DSA), large \\\
	integer functions, random numbers and a lot of supporting functions.
  URL:=http://directory.fsf.org/security/libgcrypt.html
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
	mkdir -p $(STAGING_DIR)/usr/bin
	$(CP) $(PKG_INSTALL_DIR)/usr/bin/libgcrypt-config $(STAGING_DIR)/usr/bin/
	mkdir -p $(STAGING_DIR)/usr/include
	$(CP) $(PKG_INSTALL_DIR)/usr/include/gcrypt*.h $(STAGING_DIR)/usr/include/
	mkdir -p $(STAGING_DIR)/usr/lib
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/libgcrypt.{a,so*} $(STAGING_DIR)/usr/lib/
	mkdir -p $(STAGING_DIR)/usr/share/aclocal
	$(CP) $(PKG_INSTALL_DIR)/usr/share/aclocal/libgcrypt.m4 $(STAGING_DIR)/usr/share/aclocal/
endef

define Build/UninstallDev
	rm -rf \
		$(STAGING_DIR)/usr/bin/libgcrypt-config \
		$(STAGING_DIR)/usr/include/gcrypt*.h \
		$(STAGING_DIR)/usr/lib/libgcrypt.{a,so*} \
		$(STAGING_DIR)/usr/share/aclocal/libgcrypt.m4
endef

define Package/libgcrypt/install
	install -d -m0755 $(1)/usr/lib
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/libgcrypt.so.* $(1)/usr/lib/
endef

$(eval $(call BuildPackage,libgcrypt))
