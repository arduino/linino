# 
# Copyright (C) 2006 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
# $Id$

include $(TOPDIR)/rules.mk

PKG_NAME:=opencdk
PKG_VERSION:=0.5.5
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.bz2
PKG_SOURCE_URL:=ftp://ftp.gnutls.org/pub/gnutls/opencdk/ \
	ftp://ftp.gnupg.org/gcrypt/alpha/gnutls/opencdk/ \
	http://www.mirrors.wiretapped.net/security/network-security/gnutls/opencdk/ \
	ftp://ftp.mirrors.wiretapped.net/pub/security/network-security/gnutls/opencdk/ \
	http://josefsson.org/gnutls/releases/opencdk/
PKG_MD5SUM:=aaff60107f0153873192ffda00699a96
PKG_CAT:=bzcat

PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)-$(PKG_VERSION)
PKG_INSTALL_DIR:=$(PKG_BUILD_DIR)/ipkg-install

include $(INCLUDE_DIR)/package.mk

define Package/libopencdk
  SECTION:=libs
  CATEGORY:=Libraries
  DEPENDS:=+libgcrypt
  TITLE:=The Open Crypto Development Kit library
  DESCRIPTION:=\
	This library provides basic parts of the OpenPGP message format.\\\
	For reference, please read the rfc2440.txt in the doc/ directory.\\\
	Due to some possible security problems, the library also implements \\\
	parts of draft-ietf-openpgp-rfc2440bis-08.txt. If you want to exchange \\\
	messages with earlier PGP version < 7, you should use the compat mode.
  URL:=ftp://ftp.gnutls.org/pub/gnutls/opencdk/
endef

define Build/Configure
	$(call Build/Configure/Default, \
		--enable-shared \
		--enable-static \
		--with-libgcrypt-prefix="$(STAGING_DIR)/usr" \
	)
endef

define Build/Compile
	$(MAKE) -C $(PKG_BUILD_DIR) \
		DESTDIR="$(PKG_INSTALL_DIR)" \
		all install
endef

define Build/InstallDev
	mkdir -p $(STAGING_DIR)/usr/bin
	$(CP) $(PKG_INSTALL_DIR)/usr/bin/opencdk-config $(STAGING_DIR)/usr/bin/
	mkdir -p $(STAGING_DIR)/usr/include
	$(CP) $(PKG_INSTALL_DIR)/usr/include/opencdk.h $(STAGING_DIR)/usr/include/
	mkdir -p $(STAGING_DIR)/usr/lib
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/libopencdk.{a,so*} $(STAGING_DIR)/usr/lib/
endef

define Build/UninstallDev
	rm -rf \
		$(STAGING_DIR)/usr/bin/opencdk-config \
		$(STAGING_DIR)/usr/include/opencdk.h \
		$(STAGING_DIR)/usr/lib/libopencdk.{a,so*}
endef

define Package/libopencdk/install
	install -d -m0755 $(1)/usr/lib
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/libopencdk.so.* $(1)/usr/lib/
endef

$(eval $(call BuildPackage,libopencdk))
