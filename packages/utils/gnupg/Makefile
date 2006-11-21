# 
# Copyright (C) 2006 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
# $Id$

include $(TOPDIR)/rules.mk

PKG_NAME:=gnupg
PKG_VERSION:=1.4.2.1
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.bz2
PKG_SOURCE_URL:=ftp://ftp.franken.de/pub/crypt/mirror/ftp.gnupg.org/gcrypt/gnupg \
	ftp://ftp.gnupg.org/gcrypt/gnupg
PKG_MD5SUM:=2d59ed50d92f69994dbfbe00fe1612e4
PKG_CAT:=bzcat

PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)-$(PKG_VERSION)

include $(INCLUDE_DIR)/package.mk

define Package/gnupg
  SECTION:=utils
  CATEGORY:=Utilities
  TITLE:=GNU Privacy Guard
  DESCRIPTION:=\
	GPG is an encryption program.
  URL:=http://www.gnupg.org/
endef

define Build/Configure
	$(call Build/Configure/Default, \
		--disable-rpath \
		--disable-asm \
		--disable-gnupg-iconv \
		--disable-card-support \
		--disable-agent-support \
		--disable-bzip2 \
		--disable-exec \
		--disable-ldap \
		--disable-hkp \
		--disable-finger \
		--disable-ftp \
		--disable-dns-srv \
		--enable-fake-curl \
		--disable-regex \
	)
endef

define Build/Compile
	$(MAKE) -C $(PKG_BUILD_DIR)
endef

define Package/gnupg/install
	install -d -m0755 $(1)/usr/bin
	install -m0755 $(PKG_BUILD_DIR)/g10/gpg $(1)/usr/bin/
endef

$(eval $(call BuildPackage,gnupg))
