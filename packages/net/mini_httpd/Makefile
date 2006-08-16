#
# Copyright (C) 2006 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
# $Id$

include $(TOPDIR)/rules.mk

PKG_NAME:=mini-httpd
PKG_VERSION:=1.19
PKG_RELEASE:=1
PKG_MD5SUM:=792a529dfe974355aad8ba6c80e54e7a

PKG_SOURCE_URL:=http://www.acme.com/software/mini_httpd/
PKG_SOURCE:=mini_httpd-$(PKG_VERSION).tar.gz
PKG_CAT:=zcat

PKG_BUILD_DIR:=$(BUILD_DIR)/mini_httpd-$(PKG_VERSION)

include $(INCLUDE_DIR)/package.mk

define Package/mini-httpd
  SECTION:=net
  CATEGORY:=Network
  SUBMENU:=A small web server
  DESCRIPTION:=mini_httpd is a small HTTP server. Its performance is not great, but for\\\
low or medium traffic sites it's quite adequate. It implements all the\\\
basic features of an HTTP server, including:\\\
\\\
* GET, HEAD, and POST methods.\\\
* CGI.\\\
* Basic authentication.\\\
* Security against ".." filename snooping.\\\
* The common MIME types.\\\
* Trailing-slash redirection.\\\
* index.html, index.htm, index.cgi\\\
* Directory listings.\\\
* Multihoming / virtual hosting.\\\
* Standard logging.\\\
* Custom error pages.\\\
\\\
It can also be configured to do IPv6.\\\
  URL:=http://www.acme.com/software/mini_httpd/
endef

define Package/mini-httpd-htpasswd
  $(call Package/mini-httpd)
  TITLE:=Utility to generate HTTP access files
  DESCRIPTION+=This package generates .htaccess/.htpasswd files to use HTTP access authentication
endef

define Package/mini-httpd-matrixssl
  $(call Package/mini-httpd)
  TITLE:=A small web server, built with SSL support using MatrixSSL
  DESCRIPTION+=This package adds SSL/HTTPS. (MatrixSSL)
endef

define Package/mini-httpd-openssl
  $(call BuildPackage,mini-httpd)
  TITLE:=A small web server, built with SSL support using OpenSSL
  DESCRIPTION+=This package adds SSL/HTTPS. (OpenSSL)
endef

define Build/Configure
	$(CP) ./files/matrixssl_helper.{c,h} $(PKG_BUILD_DIR)/
endef

define Build/Compile	
	# with MatrixSSL
  ifneq ($(BR2_PACKAGE_MINI_HTTPD_MATRIXSSL),)
	$(MAKE) -C $(PKG_BUILD_DIR) \
		CC=$(TARGET_CC) \
		OFLAGS="$(TARGET_CFLAGS)" \
		SSL_DEFS="-DUSE_SSL -DHAVE_MATRIXSSL" \
		SSL_INC="-I$(STAGING_DIR)/usr/include" \
		SSL_LIBS="-L$(STAGING_DIR)/usr/lib -lmatrixssl" \
		SSL_OBJS="matrixssl_helper.o" \
		all
	(cd $(PKG_BUILD_DIR); mv mini_httpd mini_httpd-matrixssl; )
	$(MAKE) -C $(PKG_BUILD_DIR) clean
  endif
	# with OpenSSL
  ifneq ($(BR2_PACKAGE_MINI_HTTPD_OPENSSL),)
	$(MAKE) -C $(PKG_BUILD_DIR) \
		CC=$(TARGET_CC) \
		OFLAGS="$(TARGET_CFLAGS)" \
		SSL_DEFS="-DUSE_SSL -DHAVE_OPENSSL" \
		SSL_INC="-I$(STAGING_DIR)/usr/include" \
		SSL_LIBS="-L$(STAGING_DIR)/usr/lib -lssl -lcrypto" \
		all
	(cd $(PKG_BUILD_DIR); mv mini_httpd mini_httpd-openssl; )
	$(MAKE) -C $(PKG_BUILD_DIR) clean
  endif
	# without SSL
  ifneq ($(BR2_PACKAGE_MINI_HTTPD),)
	$(MAKE) -C $(PKG_BUILD_DIR) \
		CC=$(TARGET_CC) \
		OFLAGS="$(TARGET_CFLAGS)" \
		all
  endif
	touch $@

$(IPKG_MINI_HTTPD):
	install -d -m0755 $(IDIR_MINI_HTTPD)/etc
	install -m0644 ./files/mini_httpd.conf $(IDIR_MINI_HTTPD)/etc/mini_httpd.conf
	install -d -m0755 $(IDIR_MINI_HTTPD)/etc/default
	install -m0644 ./files/mini_httpd.default $(IDIR_MINI_HTTPD)/etc/default/mini_httpd
	install -d -m0755 $(IDIR_MINI_HTTPD)/etc/init.d
	install -m0755 ./files/mini_httpd.init $(IDIR_MINI_HTTPD)/etc/init.d/mini_httpd
	install -d -m0755 $(IDIR_MINI_HTTPD)/usr/sbin
	install -m0755 $(PKG_BUILD_DIR)/mini_httpd $(IDIR_MINI_HTTPD)/usr/sbin/
	$(RSTRIP) $(IDIR_MINI_HTTPD)
	$(IPKG_BUILD) $(IDIR_MINI_HTTPD) $(PACKAGE_DIR)

$(IPKG_MINI_HTTPD_HTPASSWD):
	install -d -m0755 $(IDIR_MINI_HTTPD_HTPASSWD)/usr/sbin
	install -m0755 $(PKG_BUILD_DIR)/htpasswd $(IDIR_MINI_HTTPD_HTPASSWD)/usr/sbin/
	$(RSTRIP) $(IDIR_MINI_HTTPD_HTPASSWD)
	$(IPKG_BUILD) $(IDIR_MINI_HTTPD_HTPASSWD) $(PACKAGE_DIR)

$(IPKG_MINI_HTTPD_MATRIXSSL):
	install -d -m0755 $(IDIR_MINI_HTTPD_MATRIXSSL)/etc
	install -m0644 ./files/mini_httpd-ssl.conf $(IDIR_MINI_HTTPD_MATRIXSSL)/etc/mini_httpd.conf
	install -m0600 ./files/mini_httpd.pem $(IDIR_MINI_HTTPD_MATRIXSSL)/etc/
	install -d -m0755 $(IDIR_MINI_HTTPD_MATRIXSSL)/etc/default
	install -m0644 ./files/mini_httpd.default $(IDIR_MINI_HTTPD_MATRIXSSL)/etc/default/mini_httpd
	install -d -m0755 $(IDIR_MINI_HTTPD_MATRIXSSL)/etc/init.d
	install -m0755 ./files/mini_httpd.init $(IDIR_MINI_HTTPD_MATRIXSSL)/etc/init.d/mini_httpd
	install -d -m0755 $(IDIR_MINI_HTTPD_MATRIXSSL)/usr/sbin
	install -m0755 $(PKG_BUILD_DIR)/mini_httpd-matrixssl $(IDIR_MINI_HTTPD_MATRIXSSL)/usr/sbin/mini_httpd
	$(RSTRIP) $(IDIR_MINI_HTTPD_MATRIXSSL)
	$(IPKG_BUILD) $(IDIR_MINI_HTTPD_MATRIXSSL) $(PACKAGE_DIR)

$(IPKG_MINI_HTTPD_OPENSSL):
	install -d -m0755 $(IDIR_MINI_HTTPD_OPENSSL)/etc
	install -m0644 ./files/mini_httpd-ssl.conf $(IDIR_MINI_HTTPD_OPENSSL)/etc/mini_httpd.conf
	install -m0600 ./files/mini_httpd.pem $(IDIR_MINI_HTTPD_OPENSSL)/etc/
	install -d -m0755 $(IDIR_MINI_HTTPD_OPENSSL)/etc/default
	install -m0644 ./files/mini_httpd.default $(IDIR_MINI_HTTPD_OPENSSL)/etc/default/mini_httpd
	install -d -m0755 $(IDIR_MINI_HTTPD_OPENSSL)/etc/init.d
	install -m0755 ./files/mini_httpd.init $(IDIR_MINI_HTTPD_OPENSSL)/etc/init.d/mini_httpd
	install -d -m0755 $(IDIR_MINI_HTTPD_OPENSSL)/usr/sbin
	install -m0755 $(PKG_BUILD_DIR)/mini_httpd-openssl $(IDIR_MINI_HTTPD_OPENSSL)/usr/sbin/mini_httpd
	$(RSTRIP) $(IDIR_MINI_HTTPD_OPENSSL)
	$(IPKG_BUILD) $(IDIR_MINI_HTTPD_OPENSSL) $(PACKAGE_DIR)
endef
