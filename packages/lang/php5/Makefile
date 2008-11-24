# 
# Copyright (C) 2006,2007 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
# $Id$

include $(TOPDIR)/rules.mk

PKG_NAME:=php
PKG_VERSION:=5.2.6
PKG_RELEASE:=2

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.bz2
PKG_SOURCE_URL:=http://www.php.net/distributions/
PKG_MD5SUM:=7380ffecebd95c6edb317ef861229ebd

include $(INCLUDE_DIR)/package.mk

define Package/php5/Default
  SUBMENU:=PHP
  SECTION:=lang
  CATEGORY:=Languages
  TITLE:=PHP5 Hypertext preprocessor
  URL:=http://www.php.net/
endef

define Package/php5/Default/description
 PHP is a widely-used general-purpose scripting language that is especially 
 suited for Web development and can be embedded into HTML.
endef

define Package/php5
  $(call Package/php5/Default)
  DEPENDS:=+libopenssl +zlib
endef

define Package/php5/description
$(call Package/php5/Default/description)
 This package contains only the PHP config file. You must actually choose 
 your PHP flavour (cli, cgi or fastcgi).
endef

define Package/php5-cli
  $(call Package/php5/Default)
  DEPENDS:=php5
  TITLE+= (CLI)
endef

define Package/php5-cli/description
$(call Package/php5/Default/description)
 This package contains the CLI version of the PHP5 interpreter.
endef

define Package/php5-cgi
  $(call Package/php5/Default)
  DEPENDS:=php5
  TITLE+= (CGI)
endef

define Package/php5-cgi/description
$(call Package/php5/Default/description)
 This package contains the CGI version of the PHP5 interpreter.
endef

define Package/php5-fastcgi
  $(call Package/php5/Default)
  DEPENDS:=php5
  TITLE+= (FastCGI)
endef

define Package/php5-fastcgi/description
$(call Package/php5/Default/description)
 This package contains the FastCGI version of the PHP5 interpreter.
endef

define Package/php5-mod-curl
  $(call Package/php5/Default)
  DEPENDS:=php5 +libcurl
  TITLE:=cURL module
endef

define Package/php5-mod-ftp
  $(call Package/php5/Default)
  DEPENDS:=php5
  TITLE:=FTP module
endef

define Package/php5-mod-gd
  $(call Package/php5/Default)
  DEPENDS:=php5 +libgd
  TITLE:=GD graphics module
endef

define Package/php5-mod-gmp
  $(call Package/php5/Default)
  DEPENDS:=php5 +libgmp
  TITLE:=GMP module
endef

define Package/php5-mod-ldap
  $(call Package/php5/Default)
  DEPENDS:=php5 +libopenldap +libsasl2
  TITLE:=LDAP module
endef

define Package/php5-mod-mysql
  $(call Package/php5/Default)
  DEPENDS:=php5 +libmysqlclient
  TITLE:=MySQL module
endef

define Package/php5-mod-openssl
  $(call Package/php5/Default)
  DEPENDS:=php5 +libopenssl
  TITLE:=OpenSSL module
endef

define Package/php5-mod-pcre
  $(call Package/php5/Default)
  DEPENDS:=php5 +libpcre
  TITLE:=PCRE module
endef

define Package/php5-mod-pgsql
  $(call Package/php5/Default)
  DEPENDS:=php5 +libpq
  TITLE:=PostgreSQL module
endef

define Package/php5-mod-session
  $(call Package/php5/Default)
  DEPENDS:=php5
  TITLE:=Session module
endef

define Package/php5-mod-sockets
  $(call Package/php5/Default)
  DEPENDS:=php5
  TITLE:=Sockets module
endef

define Package/php5-mod-sqlite
  $(call Package/php5/Default)
  DEPENDS:=php5 +libsqlite2
  TITLE:=SQLite module
endef

define Package/php5-mod-pdo
  $(call Package/php5/Default)
  DEPENDS:=php5
  TITLE:=PHP Data Objects module
endef

define Package/php5-mod-pdo-sqlite
  $(call Package/php5/Default)
  DEPENDS:=php5-mod-pdo +libsqlite3
  TITLE:=PHP Data Objects module - SQLite support
endef

define Package/php5-mod-xml
  $(call Package/php5/Default)
  DEPENDS:=php5 +libexpat
  TITLE:=XML module
endef

define Package/php5-mod-apc
  $(call Package/php5/Default)
  DEPENDS:=php5
  TITLE:=APC Extension
endef

define Package/php5-mod-exif
  $(call Package/php5/Default)
  DEPENDS:=php5
  TITLE:=EXIF Extension
endef

PKG_CONFIGURE_LIBS:= -lcrypto -lssl
PKG_CONFIGURE_OPTS:= \
	--enable-shared \
	--disable-static \
	--disable-rpath \
	--disable-debug \
	--without-pear \
	--disable-spl \
	\
	--with-config-file-path=/etc \
	--disable-ipv6 \
	--enable-magic-quotes \
	--enable-memory-limit \
	--disable-short-tags \
	\
	--disable-ctype \
	--disable-dom \
	--enable-ftp=shared \
	--without-gettext \
	--without-iconv \
	--disable-libxml \
	  --without-libxml-dir \
	--disable-xmlreader \
	--disable-xmlwriter \
	--disable-mbstring \
	--disable-mbregex \
	--with-openssl=shared,"$(STAGING_DIR)/usr" \
	  --with-kerberos=no \
	  --with-openssl-dir="$(STAGING_DIR)/usr" \
	--enable-session=shared \
	--disable-simplexml \
	--disable-soap \
	--enable-sockets=shared \
	--disable-tokenizer \
	--with-zlib="$(STAGING_DIR)/usr" \
	  --with-zlib-dir="$(STAGING_DIR)/usr" \
	--disable-filter

ifneq ($(SDK),)
  PKG_BUILD_DEPENDS:=libopenssl zlib libcurl libgd libgmp libopenldap libmysqlclient libpq libsqlite2 libexpat
# force PKG_CONFIGURE_{LIBS,OPTS} below when built in the SDK
  CONFIG_PACKAGE_php5-cli:=m
  CONFIG_PACKAGE_php5-cgi:=m
  CONFIG_PACKAGE_php5-fastcgi:=m
  CONFIG_PACKAGE_php5-mod-curl:=m
  CONFIG_PACKAGE_php5-mod-gd:=m
  CONFIG_PACKAGE_php5-mod-gmp:=m
  CONFIG_PACKAGE_php5-mod-ldap:=m
  CONFIG_PACKAGE_php5-mod-mysql:=m
  CONFIG_PACKAGE_php5-mod-pcre:=m
  CONFIG_PACKAGE_php5-mod-pgsql:=m
  CONFIG_PACKAGE_php5-mod-sqlite:=m
  CONFIG_PACKAGE_php5-mod-xml:=m
endif

ifneq ($(CONFIG_PACKAGE_php5-mod-curl),)
  PKG_CONFIGURE_OPTS+= --with-curl=shared,"$(STAGING_DIR)/usr"
else
  PKG_CONFIGURE_OPTS+= --without-curl
endif
ifneq ($(CONFIG_PACKAGE_php5-mod-gd),)
  PKG_CONFIGURE_OPTS+= --with-gd=shared,"$(STAGING_DIR)/usr" \
	--without-freetype-dir \
	--with-jpeg-dir="$(STAGING_DIR)/usr" \
	--with-png-dir="$(STAGING_DIR)/usr" \
	--without-xpm-dir \
	--without-ttf \
	--without-t1lib \
	--enable-gd-native-ttf \
	--disable-gd-jis-conv
else
  PKG_CONFIGURE_OPTS+= --without-gd
endif
ifneq ($(CONFIG_PACKAGE_php5-mod-gmp),)
  PKG_CONFIGURE_OPTS+= --with-gmp=shared,"$(STAGING_DIR)/usr"
else
  PKG_CONFIGURE_OPTS+= --without-gmp
endif
ifneq ($(CONFIG_PACKAGE_php5-mod-ldap),)
  PKG_CONFIGURE_OPTS+= --with-ldap=shared,"$(STAGING_DIR)/usr" \
	--with-ldap-sasl="$(STAGING_DIR)/usr"
else
  PKG_CONFIGURE_OPTS+= --without-ldap
endif
ifneq ($(CONFIG_PACKAGE_php5-mod-mysql),)
  PKG_CONFIGURE_OPTS+= --with-mysql=shared,"$(STAGING_DIR)/usr"
else
  PKG_CONFIGURE_OPTS+= --without-mysql
endif
ifneq ($(CONFIG_PACKAGE_php5-mod-pcre),)
  PKG_CONFIGURE_OPTS+= --with-pcre-regex=shared,"$(STAGING_DIR)/usr"
else
  PKG_CONFIGURE_OPTS+= --without-pcre-regex
endif
ifneq ($(CONFIG_PACKAGE_php5-mod-pgsql),)
  PKG_CONFIGURE_OPTS+= --with-pgsql=shared,"$(STAGING_DIR)/usr"
else
  PKG_CONFIGURE_OPTS+= --without-pgsql
endif
ifneq ($(CONFIG_PACKAGE_php5-mod-sqlite),)
  PKG_CONFIGURE_OPTS+= --with-sqlite=shared,"$(STAGING_DIR)/usr"
else
  PKG_CONFIGURE_OPTS+= --without-sqlite
endif
ifneq ($(CONFIG_PACKAGE_php5-mod-pdo),)
  PKG_CONFIGURE_OPTS+= --enable-pdo=shared
  ifneq ($(CONFIG_PACKAGE_php5-mod-pdo-sqlite),)
    PKG_CONFIGURE_OPTS+= --with-pdo-sqlite=shared,"$(STAGING_DIR)/usr"
  endif
else
  PKG_CONFIGURE_OPTS+= --disable-pdo
endif
ifneq ($(CONFIG_PACKAGE_php5-mod-xml),)
  PKG_CONFIGURE_OPTS+= --enable-xml=shared,"$(STAGING_DIR)/usr" \
	--with-libexpat-dir="$(STAGING_DIR)/usr"
else
  PKG_CONFIGURE_OPTS+= --disable-xml
endif
ifneq ($(CONFIG_PACKAGE_php5-mod-apc),)
  PKG_CONFIGURE_OPTS+= --enable-apc --disable-apc-mmap --disable-apc-pthreadmutex
  PKG_CONFIGURE_LIBS+= -lrt
else
  PKG_CONFIGURE_OPTS+= --disable-apc
endif
ifneq ($(CONFIG_PACKAGE_php5-mod-exif),)
  PKG_CONFIGURE_OPTS+= --enable-exif
else
  PKG_CONFIGURE_OPTS+= --disable-exif
endif

define Build/Configure
endef

ifneq ($(CONFIG_PACKAGE_php5-cli),)
  define Build/Compile/php5-cli
	-$(MAKE) -C $(PKG_BUILD_DIR) clean
	$(call Build/Configure/Default, \
		$(PKG_CONFIGURE_OPTS) \
		--enable-cli \
		--disable-cgi \
		--disable-fastcgi \
		--enable-force-cgi-redirect \
		--enable-discard-path \
		, \
		LIBS="$(PKG_CONFIGURE_LIBS)" \
		php_cv_cc_rpath="no" \
	)
	$(MAKE) -C $(PKG_BUILD_DIR)
	mv $(PKG_BUILD_DIR)/sapi/cli/php $(PKG_BUILD_DIR)/php-cli
  endef
endif

ifneq ($(CONFIG_PACKAGE_php5-cgi),)
  define Build/Compile/php5-cgi
	-$(MAKE) -C $(PKG_BUILD_DIR) clean
	$(call Build/Configure/Default, \
		$(PKG_CONFIGURE_OPTS) \
		--disable-cli \
		--enable-cgi \
		--disable-fastcgi \
		--enable-force-cgi-redirect \
		--enable-discard-path \
		, \
		LIBS="$(PKG_CONFIGURE_LIBS)" \
		php_cv_cc_rpath="no" \
	)
	$(MAKE) -C $(PKG_BUILD_DIR)
	mv $(PKG_BUILD_DIR)/sapi/cgi/php-cgi $(PKG_BUILD_DIR)/php-cgi
  endef
endif

ifneq ($(CONFIG_PACKAGE_php5-fastcgi),)
  define Build/Compile/php5-fastcgi
	-$(MAKE) -C $(PKG_BUILD_DIR) clean
	rm $(PKG_BUILD_DIR)/configure
	cd $(PKG_BUILD_DIR) && ./buildconf --force
	$(call Build/Configure/Default, \
		$(PKG_CONFIGURE_OPTS) \
		--disable-cli \
		--enable-cgi \
		--enable-fastcgi \
		--enable-force-cgi-redirect \
		--enable-discard-path \
		, \
		LIBS="$(PKG_CONFIGURE_LIBS)" \
		php_cv_cc_rpath="no" \
	)
	$(MAKE) -C $(PKG_BUILD_DIR)
	mv $(PKG_BUILD_DIR)/sapi/cgi/php-cgi $(PKG_BUILD_DIR)/php-fcgi
  endef
endif

define Build/Compile
	$(call Build/Compile/php5-cli)
	$(call Build/Compile/php5-cgi)
	$(call Build/Compile/php5-fastcgi)
endef

define Package/php5/conffiles
/etc/php.ini
endef

define Package/php5/install
	$(INSTALL_DIR) $(1)/etc
	$(INSTALL_DATA) ./files/php.ini $(1)/etc/
endef

define Package/php5-cli/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(CP) $(PKG_BUILD_DIR)/php-cli $(1)/usr/bin/php-cli
endef

define Package/php5-cgi/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(CP) $(PKG_BUILD_DIR)/php-cgi $(1)/usr/bin/php-cgi
endef

define Package/php5-fastcgi/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(CP) $(PKG_BUILD_DIR)/php-fcgi $(1)/usr/bin/php-fcgi
	$(INSTALL_DIR) $(1)/etc/init.d
	$(INSTALL_BIN) ./files/php.init $(1)/etc/init.d/php
endef

define BuildPlugin
  define Package/$(1)/install
	[ -z "$(2)" ] || $(INSTALL_DIR) $$(1)/usr/lib/php
	for m in $(2); do \
		$(INSTALL_BIN) $(PKG_BUILD_DIR)/modules/$$$$$$$${m}.so $$(1)/usr/lib/php/ ; \
	done
  endef

  $$(eval $$(call BuildPackage,$(1)))
endef

$(eval $(call BuildPackage,php5))
$(eval $(call BuildPackage,php5-cli))
$(eval $(call BuildPackage,php5-cgi))
$(eval $(call BuildPackage,php5-fastcgi))
$(eval $(call BuildPlugin,php5-mod-curl,curl))
$(eval $(call BuildPlugin,php5-mod-ftp,ftp))
$(eval $(call BuildPlugin,php5-mod-gd,gd))
$(eval $(call BuildPlugin,php5-mod-gmp,gmp))
$(eval $(call BuildPlugin,php5-mod-ldap,ldap))
$(eval $(call BuildPlugin,php5-mod-mysql,mysql))
$(eval $(call BuildPlugin,php5-mod-openssl,openssl))
$(eval $(call BuildPlugin,php5-mod-pcre,pcre))
$(eval $(call BuildPlugin,php5-mod-pgsql,pgsql))
$(eval $(call BuildPlugin,php5-mod-session,session))
$(eval $(call BuildPlugin,php5-mod-sockets,sockets))
$(eval $(call BuildPlugin,php5-mod-sqlite,sqlite))
$(eval $(call BuildPlugin,php5-mod-pdo,pdo))
$(eval $(call BuildPlugin,php5-mod-pdo-sqlite,pdo_sqlite))
$(eval $(call BuildPlugin,php5-mod-xml,xml))
$(eval $(call BuildPlugin,php5-mod-apc))
$(eval $(call BuildPlugin,php5-mod-exif))
