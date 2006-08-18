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

PKG_BUILD_DIR:=$(BUILD_DIR)/mini_httpd-$(PKG_VERSION)
PKG_SOURCE:=mini_httpd-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=http://www.acme.com/software/mini_httpd/
PKG_MD5SUM:=792a529dfe974355aad8ba6c80e54e7a
PKG_CAT:=zcat

include $(INCLUDE_DIR)/package.mk

define Package/mini-httpd
  SECTION:=net
  CATEGORY:=Network
  TITLE:=A small web server
  DESCRIPTION:=mini_httpd is a small HTTP server. Its performance is not great, but for \\\
    low or medium traffic sites it's quite adequate. It implements all the \\\
    basic features of an HTTP server, including: \\\
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
    It can also be configured to do IPv6.
  URL:=http://www.acme.com/software/mini_httpd/
endef

define Package/mini-httpd/conffiles
/etc/mini_httpd.conf
/etc/default/mini_httpd
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

define Package/mini-httpd-matrixssl/conffiles
/etc/mini_httpd.conf
/etc/mini_httpd.pem
/etc/default/mini_httpd
endef

define Package/mini-httpd-openssl
  $(call Package/mini-httpd)
  TITLE:=A small web server, built with SSL support using OpenSSL
  DESCRIPTION+=This package adds SSL/HTTPS. (OpenSSL)
endef

define Package/mini-httpd-openssl/conffiles
/etc/mini_httpd.conf
/etc/mini_httpd.pem
/etc/default/mini_httpd
endef

ifneq ($(SDK),)
  CONFIG_PACKAGE_mini-httpd:=m
  CONFIG_PACKAGE_mini-httpd-matrixssl:=m
  CONFIG_PACKAGE_mini-httpd-openssl:=m
endif

define Build/Configure
	$(CP) ./files/matrixssl_helper.{c,h} $(PKG_BUILD_DIR)/
endef

define Build/Compile	
	# with MatrixSSL
  ifneq ($(CONFIG_PACKAGE_mini-httpd-matrixssl),)
	$(MAKE) -C $(PKG_BUILD_DIR) \
		$(TARGET_CONFIGURE_OPTS) \
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
  ifneq ($(CONFIG_PACKAGE_mini-httpd-openssl),)
	$(MAKE) -C $(PKG_BUILD_DIR) \
		$(TARGET_CONFIGURE_OPTS) \
		OFLAGS="$(TARGET_CFLAGS)" \
		SSL_DEFS="-DUSE_SSL -DHAVE_OPENSSL" \
		SSL_INC="-I$(STAGING_DIR)/usr/include" \
		SSL_LIBS="-L$(STAGING_DIR)/usr/lib -lssl -lcrypto" \
		all
	(cd $(PKG_BUILD_DIR); mv mini_httpd mini_httpd-openssl; )
	$(MAKE) -C $(PKG_BUILD_DIR) clean
  endif
	# without SSL
  ifneq ($(CONFIG_PACKAGE_mini-httpd),)
	$(MAKE) -C $(PKG_BUILD_DIR) \
		$(TARGET_CONFIGURE_OPTS) \
		OFLAGS="$(TARGET_CFLAGS)" \
		all
  endif
endef

define Package/mini-httpd/install
	install -d -m0755 $(1)/etc
	install -m0644 ./files/mini_httpd.conf $(1)/etc/mini_httpd.conf
	install -d -m0755 $(1)/etc/default
	install -m0644 ./files/mini_httpd.default $(1)/etc/default/mini_httpd
	install -d -m0755 $(1)/etc/init.d
	install -m0755 ./files/mini_httpd.init $(1)/etc/init.d/mini_httpd
	install -d -m0755 $(1)/usr/sbin
	install -m0755 $(PKG_BUILD_DIR)/mini_httpd $(1)/usr/sbin/mini_httpd
endef

define Package/mini-httpd-htpasswd/install
	install -d -m0755 $(1)/usr/sbin
	install -m0755 $(PKG_BUILD_DIR)/htpasswd $(1)/usr/sbin/
endef

define Package/mini-httpd-matrixssl/install
	install -d -m0755 $(1)/etc
	install -m0644 ./files/mini_httpd-ssl.conf $(1)/etc/mini_httpd.conf
	install -m0600 ./files/mini_httpd.pem $(1)/etc/mini_httpd.pem
	install -d -m0755 $(1)/etc/default
	install -m0644 ./files/mini_httpd.default $(1)/etc/default/mini_httpd
	install -d -m0755 $(1)/etc/init.d
	install -m0755 ./files/mini_httpd.init $(1)/etc/init.d/mini_httpd
	install -d -m0755 $(1)/usr/sbin
	install -m0755 $(PKG_BUILD_DIR)/mini_httpd-matrixssl $(1)/usr/sbin/mini_httpd
endef

define Package/mini-httpd-openssl/install
	install -d -m0755 $(1)/etc
	install -m0644 ./files/mini_httpd-ssl.conf $(1)/etc/mini_httpd.conf
	install -m0600 ./files/mini_httpd.pem $(1)/etc/mini_httpd.pem
	install -d -m0755 $(1)/etc/default
	install -m0644 ./files/mini_httpd.default $(1)/etc/default/mini_httpd
	install -d -m0755 $(1)/etc/init.d
	install -m0755 ./files/mini_httpd.init $(1)/etc/init.d/mini_httpd
	install -d -m0755 $(1)/usr/sbin
	install -m0755 $(PKG_BUILD_DIR)/mini_httpd-openssl $(1)/usr/sbin/mini_httpd
endef

$(eval $(call BuildPackage,mini-httpd))
$(eval $(call BuildPackage,mini-httpd-htpasswd))
$(eval $(call BuildPackage,mini-httpd-matrixssl))
$(eval $(call BuildPackage,mini-httpd-openssl))
