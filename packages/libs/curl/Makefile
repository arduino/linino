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

PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)-$(PKG_VERSION)
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

PKG_INSTALL_DIR:=$(PKG_BUILD_DIR)/ipkg-install

include $(INCLUDE_DIR)/package.mk

define Package/libcurl
  SECTION:=libs
  CATEGORY:=Libraries
  DEPENDS:=+libopenssl +zlib
  TITLE:=A client-side URL transfer utility
  DESCRIPTION:=A client-side URL transfer utility.
  URL:=http://curl.haxx.se/
endef

define Package/curl
  SECTION:=net
  CATEGORY:=Network
  DEPENDS:=+libcurl
  TITLE:=A client-side URL transfer library
  DESCRIPTION:=A client-side URL transfer library.
  URL:=http://curl.haxx.se/
endef

define Build/Configure
	(cd $(PKG_BUILD_DIR); rm -f config.cache; \
		$(TARGET_CONFIGURE_OPTS) \
		CFLAGS="$(strip $(TARGET_CFLAGS))" \
		CPPFLAGS="-I$(STAGING_DIR)/usr/include -I$(STAGING_DIR)/include" \
		LDFLAGS="-L$(STAGING_DIR)/usr/lib -L$(STAGING_DIR)/lib" \
		PKG_CONFIG_PATH="$(STAGING_DIR)/usr/lib/pkgconfig" \
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
			$(DISABLE_LARGEFILE) \
			$(DISABLE_NLS) \
			--enable-shared \
			--enable-static \
			--disable-rpath \
			--with-gnu-ld \
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
	rm -rf $(PKG_INSTALL_DIR)
	mkdir -p $(PKG_INSTALL_DIR)
	$(MAKE) -C $(PKG_BUILD_DIR) \
		DESTDIR="$(PKG_INSTALL_DIR)" \
		all install
endef

define Package/libcurl/install
	install -m0755 -d $(1)/usr/lib
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/libcurl.so.* $(1)/usr/lib/
endef

define Package/curl/install
	install -m0755 -d $(1)/usr/bin
	$(CP) $(PKG_INSTALL_DIR)/usr/bin/curl $(1)/usr/bin/
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
	rm -rf \
		$(STAGING_DIR)/usr/bin/curl-config \
		$(STAGING_DIR)/usr/include/curl \
		$(STAGING_DIR)/usr/lib/libcurl.{a,so*}
endef

$(eval $(call BuildPackage,libcurl))
$(eval $(call BuildPackage,curl))
