# 
# Copyright (C) 2006 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
# $Id$

include $(TOPDIR)/rules.mk

PKG_NAME:=curl
PKG_VERSION:=7.14.0
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.bz2
PKG_SOURCE_URL:=http://curl.haxx.se/download/ \
	http://www.mirrorspace.org/curl/ \
	http://curl.mirror.internet.tp/download/ \
	ftp://ftp.sunet.se/pub/www/utilities/curl/ \
	ftp://ftp.planetmirror.com/pub/curl/ \
	http://www.mirrormonster.com/curl/download/ \
	http://curl.mirrors.cyberservers.net/download/
PKG_MD5SUM:=46ce665e47d37fce1a0bad935cce58a9
PKG_CAT:=bzcat

PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)-$(PKG_VERSION)
PKG_INSTALL_DIR:=$(PKG_BUILD_DIR)/ipkg-install

include $(INCLUDE_DIR)/package.mk

define Package/curl/Default
  SECTION:=net
  CATEGORY:=Network
  URL:=http://curl.haxx.se/
endef

define Package/curl
  $(call Package/curl/Default)
  DEPENDS:=+libcurl
  TITLE:=A client-side URL transfer library
endef

define Package/libcurl
  $(call Package/curl/Default)
  SECTION:=libs
  CATEGORY:=Libraries
  DEPENDS:=+libopenssl +zlib
  TITLE:=A client-side URL transfer utility
endef

define Build/Configure
	$(call Build/Configure/Default, \
		--enable-shared \
		--enable-static \
		--disable-thread \
		--enable-cookies \
		--enable-crypto-auth \
		--enable-nonblocking \
		--enable-file \
		--enable-ftp \
		--enable-http \
		--enable-ipv6 \
		--disable-ares \
		--disable-debug \
		--disable-dict \
		--disable-gopher \
		--disable-ldap \
		--disable-manual \
		--disable-sspi \
		--disable-telnet \
		--disable-verbose \
		--with-random="/dev/urandom" \
		--with-ssl="$(STAGING_DIR)/usr" \
		--without-ca-bundle \
		--without-gnutls \
		--without-libidn \
		--with-zlib="$(STAGING_DIR)/usr" \
	);
endef

define Build/Compile
	$(MAKE) -C $(PKG_BUILD_DIR) \
		DESTDIR="$(PKG_INSTALL_DIR)" \
		all install
endef

define Build/InstallDev
	mkdir -p $(STAGING_DIR)/usr/bin
	$(CP) $(PKG_INSTALL_DIR)/usr/bin/curl-config $(STAGING_DIR)/usr/bin/
	mkdir -p $(STAGING_DIR)/usr/include
	$(CP) $(PKG_INSTALL_DIR)/usr/include/curl $(STAGING_DIR)/usr/include/
	mkdir -p $(STAGING_DIR)/usr/lib
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/libcurl.{a,so*} $(STAGING_DIR)/usr/lib/
	$(SED) 's,-I/usr/include,,g' $(STAGING_DIR)/usr/bin/curl-config
	$(SED) 's,-L/usr/lib,,g' $(STAGING_DIR)/usr/bin/curl-config
endef

define Build/UninstallDev
	rm -rf	$(STAGING_DIR)/usr/bin/curl-config \
		$(STAGING_DIR)/usr/include/curl \
		$(STAGING_DIR)/usr/lib/libcurl.{a,so*}
endef

define Package/curl/install
	install -d -m0755 $(1)/usr/bin
	$(CP) $(PKG_INSTALL_DIR)/usr/bin/curl $(1)/usr/bin/
endef

define Package/libcurl/install
	install -d -m0755 $(1)/usr/lib
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/libcurl.so.* $(1)/usr/lib/
endef

$(eval $(call BuildPackage,curl))
$(eval $(call BuildPackage,libcurl))
