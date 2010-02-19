#
# Copyright (C) 2006-2010 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=php
PKG_VERSION:=5.3.1
PKG_RELEASE:=3

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.bz2
PKG_SOURCE_URL:=http://www.php.net/distributions/
PKG_MD5SUM:=63e97ad450f0f7259e785100b634c797

PKG_FIXUP:=libtool

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

define Package/php5/config
	config PHP5_APC
		bool "PHP5 APC support"
		depends on PACKAGE_php5-cli || PACKAGE_php5-cgi

	config PHP5_FILTER
		bool "PHP5 Filter support"
		depends on PACKAGE_php5-cli || PACKAGE_php5-cgi

	config PHP5_LIBXML
		bool "PHP5 LIBXML support"
		depends on PACKAGE_php5-cli || PACKAGE_php5-cgi

	config PHP5_SYSVIPC
		bool "PHP5 Semaphore, Shared Memory and IPC support"
		depends on PACKAGE_php5-cli || PACKAGE_php5-cgi
endef

define Package/php5
  $(call Package/php5/Default)
  DEPENDS:=+libpcre +zlib
  ifneq ($(CONFIG_PHP5_LIBXML),)
    DEPENDS+= +libxml2
  endif
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
  TITLE+= (CGI & FastCGI)
endef

define Package/php5-cgi/description
$(call Package/php5/Default/description)
 This package contains the CGI version of the PHP5 interpreter.
endef

define Package/php5-fastcgi
  $(call Package/php5/Default)
  DEPENDS:=php5 +php5-cgi
  TITLE:=FastCGI startup script
endef

define Package/php5-cgi/description
As FastCGI support is now a core feature the php5-fastcgi package now depends
on the php5-cgi package, containing just the startup script.
endef

define Package/php5-mod-ctype
  $(call Package/php5/Default)
  DEPENDS:=php5
  TITLE:=ctype shared module
endef
define Package/php5-mod-ctype/config
  depends on PACKAGE_php5-cli || PACKAGE_php5-cgi
endef

define Package/php5-mod-curl
  $(call Package/php5/Default)
  DEPENDS:=php5 +libcurl
  TITLE:=cURL shared module
endef
define Package/php5-mod-curl/config
  depends on PACKAGE_php5-cli || PACKAGE_php5-cgi
endef

define Package/php5-mod-fileinfo
  $(call Package/php5/Default)
  DEPENDS:=php5 +libmagic
  TITLE:=Fileinfo shared module
endef
define Package/php5-mod-fileinfo/config
  depends on PACKAGE_php5-cli || PACKAGE_php5-cgi
endef

define Package/php5-mod-dom
  $(call Package/php5/Default)
  DEPENDS:=php5 +libxml2
  TITLE:=DOM shared module
endef
define Package/php5-mod-dom/config
  depends on PACKAGE_php5-cli || PACKAGE_php5-cgi
  depends on PHP5_LIBXML
endef

define Package/php5-mod-exif
  $(call Package/php5/Default)
  DEPENDS:=php5
  TITLE:=EXIF shared module
endef
define Package/php5-mod-exif/config
  depends on PACKAGE_php5-cli || PACKAGE_php5-cgi
endef

define Package/php5-mod-ftp
  $(call Package/php5/Default)
  DEPENDS:=php5
  TITLE:=FTP shared module
endef
define Package/php5-mod-ftp/config
  depends on PACKAGE_php5-cli || PACKAGE_php5-cgi
endef

define Package/php5-mod-gd
  $(call Package/php5/Default)
  DEPENDS:=php5 +libgd
  TITLE:=GD graphics shared module
endef
define Package/php5-mod-gd/config
  depends on PACKAGE_php5-cli || PACKAGE_php5-cgi
endef

define Package/php5-mod-gmp
  $(call Package/php5/Default)
  DEPENDS:=php5 +libgmp
  TITLE:=GMP shared module
endef
define Package/php5-mod-gmp/config
  depends on PACKAGE_php5-cli || PACKAGE_php5-cgi
endef

define Package/php5-mod-hash
  $(call Package/php5/Default)
  DEPENDS:=php5
  TITLE:=Hash shared module
endef
define Package/php5-mod-hash/config
  depends on PACKAGE_php5-cli || PACKAGE_php5-cgi
endef

define Package/php5-mod-iconv
  $(call Package/php5/Default)
  DEPENDS:=php5 +libiconv
  TITLE:=iConv shared module
endef
define Package/php5-mod-iconv/config
  depends on PACKAGE_php5-cli || PACKAGE_php5-cgi
endef

define Package/php5-mod-json
  $(call Package/php5/Default)
  DEPENDS:=php5
  TITLE:=JSON shared module
endef
define Package/php5-mod-json/config
  depends on PACKAGE_php5-cli || PACKAGE_php5-cgi
endef

define Package/php5-mod-ldap
  $(call Package/php5/Default)
  DEPENDS:=php5 +libopenldap +libsasl2
  TITLE:=LDAP shared module
endef
define Package/php5-mod-ldap/config
  depends on PACKAGE_php5-cli || PACKAGE_php5-cgi
endef

define Package/php5-mod-mbstring
  $(call Package/php5/Default)
  DEPENDS:=php5
  TITLE:=MBString shared module
endef
define Package/php5-mod-mbstring/config
  depends on PACKAGE_php5-cli || PACKAGE_php5-cgi
endef

define Package/php5-mod-mcrypt
  $(call Package/php5/Default)
  DEPENDS:=php5 +libmcrypt +libltdl
  TITLE:=mcrypt shared module
endef
define Package/php5-mod-mcrypt/config
  depends on PACKAGE_php5-cli || PACKAGE_php5-cgi
endef

define Package/php5-mod-mysql
  $(call Package/php5/Default)
  DEPENDS:=php5 +libmysqlclient
  TITLE:=MySQL shared module
endef
define Package/php5-mod-mysql/config
  depends on PACKAGE_php5-cli || PACKAGE_php5-cgi
endef

define Package/php5-mod-openssl
  $(call Package/php5/Default)
  DEPENDS:=php5 +libopenssl
  TITLE:=OpenSSL shared module
endef
define Package/php5-mod-openssl/config
  depends on PACKAGE_php5-cli || PACKAGE_php5-cgi
endef

define Package/php5-mod-pdo
  $(call Package/php5/Default)
  DEPENDS:=php5
  TITLE:=PHP Data Objects shared module
endef
define Package/php5-mod-pdo/config
  depends on PACKAGE_php5-cli || PACKAGE_php5-cgi
endef

define Package/php5-mod-pdo-mysql
  $(call Package/php5/Default)
  DEPENDS:=php5-mod-pdo +libmysqlclient
  TITLE:=PDO driver for MySQL
endef

define Package/php5-mod-pdo-pgsql
  $(call Package/php5/Default)
  DEPENDS:=php5-mod-pdo +libpq
  TITLE:=PDO driver for PostgreSQL
endef

define Package/php5-mod-pdo-sqlite
  $(call Package/php5/Default)
  DEPENDS:=php5-mod-pdo +libsqlite3
  TITLE:=PDO driver for SQLite (3.x)
endef

define Package/php5-mod-pgsql
  $(call Package/php5/Default)
  DEPENDS:=php5 +libpq
  TITLE:=PostgreSQL shared module
endef
define Package/php5-mod-pgsql/config
  depends on PACKAGE_php5-cli || PACKAGE_php5-cgi
endef

define Package/php5-mod-session
  $(call Package/php5/Default)
  DEPENDS:=php5
  TITLE:=Session shared module
endef
define Package/php5-mod-session/config
  depends on PACKAGE_php5-cli || PACKAGE_php5-cgi
endef

define Package/php5-mod-soap
  $(call Package/php5/Default)
  DEPENDS:=php5 +libxml2
  TITLE:=SOAP shared module
endef
define Package/php5-mod-soap/config
  depends on PACKAGE_php5-cli || PACKAGE_php5-cgi
  depends on PHP5_LIBXML
endef

define Package/php5-mod-sockets
  $(call Package/php5/Default)
  DEPENDS:=php5
  TITLE:=Sockets shared module
endef
define Package/php5-mod-sockets/config
  depends on PACKAGE_php5-cli || PACKAGE_php5-cgi
endef

define Package/php5-mod-sqlite
  $(call Package/php5/Default)
  DEPENDS:=php5 +libsqlite2
  TITLE:=SQLite shared module (2.x)
endef
define Package/php5-mod-sqlite/config
  depends on PACKAGE_php5-cli || PACKAGE_php5-cgi
endef

define Package/php5-mod-sqlite3
  $(call Package/php5/Default)
  DEPENDS:=php5 +libsqlite3
  TITLE:=SQLite3 shared module (3.x)
endef
define Package/php5-mod-sqlite3/config
  depends on PACKAGE_php5-cli || PACKAGE_php5-cgi
endef

define Package/php5-mod-tokenizer
  $(call Package/php5/Default)
  DEPENDS:=php5
  TITLE:=Tokenizer shared module
endef
define Package/php5-mod-tokenizer/config
  depends on PACKAGE_php5-cli || PACKAGE_php5-cgi
endef

define Package/php5-mod-xml
  $(call Package/php5/Default)
  DEPENDS:=php5
  ifneq ($(CONFIG_PHP5_LIBXML),)
    DEPENDS+= +libxml2
  else
    DEPENDS+= +libexpat
  endif
  TITLE:=XML shared module
endef
define Package/php5-mod-xml/config
  depends on PACKAGE_php5-cli || PACKAGE_php5-cgi
endef

define Package/php5-mod-xmlreader
  $(call Package/php5/Default)
  DEPENDS:=php5 +libxml2 +libiconv
  TITLE:=XMLReader shared module
endef
define Package/php5-mod-xmlreader/config
  depends on PACKAGE_php5-cli || PACKAGE_php5-cgi
  depends on PHP5_LIBXML
endef

define Package/php5-mod-xmlwriter
  $(call Package/php5/Default)
  DEPENDS:=php5 +libxml2 +libiconv
  TITLE:=XMLWriter shared module
endef
  define Package/php5-mod-xmlwriter/config
  depends on PACKAGE_php5-cli || PACKAGE_php5-cgi
  depends on PHP5_LIBXML
endef

PKG_CONFIGURE_OPTS:= \
	--enable-shared \
	--disable-static \
	--disable-rpath \
	--disable-debug \
	--without-pear \
	\
	--with-config-file-path=/etc \
	--enable-magic-quotes \
	--disable-short-tags \
	\
	--without-gettext \
	--disable-simplexml \
	--with-zlib="$(STAGING_DIR)/usr" \
	  --with-zlib-dir="$(STAGING_DIR)/usr" \
	--with-pcre-regex="$(STAGING_DIR)/usr" \
	--disable-phar

ifneq ($(SDK),)
  PKG_BUILD_DEPENDS:=libopenssl zlib libcurl libgd libgmp libopenldap libmysqlclient libpq libsqlite2 libsqlite3 libpcre libxml2
# force PKG_CONFIGURE_{LIBS,OPTS} below when built in the SDK
  CONFIG_PACKAGE_php5-cli:=m
  CONFIG_PACKAGE_php5-cgi:=m
  CONFIG_PACKAGE_php5-fastcgi:=m
  CONFIG_PACKAGE_php5-mod-curl:=m
  CONFIG_PACKAGE_php5-mod-gd:=m
  CONFIG_PACKAGE_php5-mod-gmp:=m
  CONFIG_PACKAGE_php5-mod-ldap:=m
  CONFIG_PACKAGE_php5-mod-mysql:=m
  CONFIG_PACKAGE_php5-mod-pgsql:=m
  CONFIG_PACKAGE_php5-mod-sqlite:=m
  CONFIG_PACKAGE_php5-mod-sqlite3:=m
  CONFIG_PACKAGE_php5-mod-xml:=m
endif

ifneq ($(CONFIG_PACKAGE_php5-mod-ctype),)
  PKG_CONFIGURE_OPTS+= --enable-ctype=shared
else
  PKG_CONFIGURE_OPTS+= --disable-ctype
endif

ifneq ($(CONFIG_PACKAGE_php5-mod-curl),)
  PKG_CONFIGURE_OPTS+= --with-curl=shared,"$(STAGING_DIR)/usr"
else
  PKG_CONFIGURE_OPTS+= --without-curl
endif

ifneq ($(CONFIG_PACKAGE_php5-mod-fileinfo),)
  PKG_CONFIGURE_OPTS+= --enable-fileinfo=shared
else
  PKG_CONFIGURE_OPTS+= --disable-fileinfo
endif

ifneq ($(CONFIG_PACKAGE_php5-mod-dom),)
  PKG_CONFIGURE_OPTS+= --enable-dom=shared
else
  PKG_CONFIGURE_OPTS+= --disable-dom
endif

ifneq ($(CONFIG_PACKAGE_php5-mod-exif),)
  PKG_CONFIGURE_OPTS+= --enable-exif=shared
else
  PKG_CONFIGURE_OPTS+= --disable-exif
endif

ifneq ($(CONFIG_PACKAGE_php5-mod-ftp),)
  PKG_CONFIGURE_OPTS+= --enable-ftp=shared
else
  PKG_CONFIGURE_OPTS+= --disable-ftp
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

ifneq ($(CONFIG_PACKAGE_php5-mod-hash),)
  PKG_CONFIGURE_OPTS+= --enable-hash=shared
else
  PKG_CONFIGURE_OPTS+= --disable-hash
endif

ifneq ($(CONFIG_PACKAGE_php5-mod-iconv),)
  PKG_CONFIGURE_OPTS+= --with-iconv=shared,"$(STAGING_DIR)/usr/lib/libiconv"
else
  PKG_CONFIGURE_OPTS+= --without-iconv
endif

ifneq ($(CONFIG_PACKAGE_php5-mod-json),)
  PKG_CONFIGURE_OPTS+= --enable-json=shared
else
  PKG_CONFIGURE_OPTS+= --disable-json
endif

ifneq ($(CONFIG_PACKAGE_php5-mod-ldap),)
  PKG_CONFIGURE_OPTS+= --with-ldap=shared,"$(STAGING_DIR)/usr" \
	--with-ldap-sasl="$(STAGING_DIR)/usr"
else
  PKG_CONFIGURE_OPTS+= --without-ldap
endif

ifneq ($(CONFIG_PACKAGE_php5-mod-mbstring),)
  PKG_CONFIGURE_OPTS+= --enable-mbstring=shared --enable-mbregex
else
  PKG_CONFIGURE_OPTS+= --disable-mbstring
endif

ifneq ($(CONFIG_PACKAGE_php5-mod-mcrypt),)
  PKG_CONFIGURE_OPTS+=  --with-mcrypt=shared,"$(STAGING_DIR)/usr"
else
  PKG_CONFIGURE_OPTS+= --without-mcrypt
endif

ifneq ($(CONFIG_PACKAGE_php5-mod-mysql),)
  PKG_CONFIGURE_OPTS+= --with-mysql=shared,"$(STAGING_DIR)/usr"
else
  PKG_CONFIGURE_OPTS+= --without-mysql
endif

ifneq ($(CONFIG_PACKAGE_php5-mod-openssl),)
  PKG_CONFIGURE_OPTS+= --with-openssl=shared,"$(STAGING_DIR)/usr"
  PKG_CONFIGURE_OPTS+= --with-kerberos=no
  PKG_CONFIGURE_OPTS+= --with-openssl-dir="$(STAGING_DIR)/usr"
else
  PKG_CONFIGURE_OPTS+= --without-openssl
endif

ifneq ($(CONFIG_PACKAGE_php5-mod-pdo),)
  PKG_CONFIGURE_OPTS+= --enable-pdo=shared
  ifneq ($(CONFIG_PACKAGE_php5-mod-pdo-mysql),)
    PKG_CONFIGURE_OPTS+= --with-pdo-mysql=shared,"$(STAGING_DIR)/usr"
  else
    PKG_CONFIGURE_OPTS+= --without-pdo-mysql
  endif
  ifneq ($(CONFIG_PACKAGE_php5-mod-pdo-pgsql),)
    PKG_CONFIGURE_OPTS+= --with-pdo-pgsql=shared,"$(STAGING_DIR)/usr"
  else
    PKG_CONFIGURE_OPTS+= --without-pdo-pgsql
  endif
  ifneq ($(CONFIG_PACKAGE_php5-mod-pdo-sqlite),)
    PKG_CONFIGURE_OPTS+= --with-pdo-sqlite=shared,"$(STAGING_DIR)/usr"
    PKG_CONFIGURE_LIBS+= -lsqlite3
  else
    PKG_CONFIGURE_OPTS+= --without-pdo-sqlite
  endif
else
  PKG_CONFIGURE_OPTS+= --disable-pdo
endif

ifneq ($(CONFIG_PACKAGE_php5-mod-pgsql),)
  PKG_CONFIGURE_OPTS+= --with-pgsql=shared,"$(STAGING_DIR)/usr"
else
  PKG_CONFIGURE_OPTS+= --without-pgsql
endif

ifneq ($(CONFIG_PACKAGE_php5-mod-session),)
  PKG_CONFIGURE_OPTS+= --enable-session=shared
else
  PKG_CONFIGURE_OPTS+= --disable-session
endif

ifneq ($(CONFIG_PACKAGE_php5-mod-soap),)
  PKG_CONFIGURE_OPTS+= --enable-soap=shared
else
  PKG_CONFIGURE_OPTS+= --disable-soap
endif

ifneq ($(CONFIG_PACKAGE_php5-mod-sockets),)
  PKG_CONFIGURE_OPTS+= --enable-sockets=shared
else
  PKG_CONFIGURE_OPTS+= --disable-sockets
endif

ifneq ($(CONFIG_PACKAGE_php5-mod-sqlite),)
  PKG_CONFIGURE_OPTS+= --with-sqlite=shared,"$(STAGING_DIR)/usr"
else
  PKG_CONFIGURE_OPTS+= --without-sqlite
endif

ifneq ($(CONFIG_PACKAGE_php5-mod-sqlite3),)
  PKG_CONFIGURE_OPTS+= --with-sqlite3=shared,"$(STAGING_DIR)/usr"
  PKG_CONFIGURE_LIBS+= -lsqlite3
else
  PKG_CONFIGURE_OPTS+= --without-sqlite3
endif

ifneq ($(CONFIG_PACKAGE_php5-mod-tokenizer),)
  PKG_CONFIGURE_OPTS+= --enable-tokenizer=shared
else
  PKG_CONFIGURE_OPTS+= --disable-tokenizer
endif

ifneq ($(CONFIG_PACKAGE_php5-mod-xml),)
  PKG_CONFIGURE_OPTS+= --enable-xml=shared,"$(STAGING_DIR)/usr"
  ifneq ($(CONFIG_PHP5_LIBXML),)
    PKG_CONFIGURE_OPTS+= --with-libxml-dir="$(STAGING_DIR)/usr/include/libxml2"
  else
    PKG_CONFIGURE_OPTS+= --with-libexpat-dir="$(STAGING_DIR)/usr"
  endif
else
  PKG_CONFIGURE_OPTS+= --disable-xml
endif

ifneq ($(CONFIG_PACKAGE_php5-mod-xmlreader),)
  PKG_CONFIGURE_OPTS+= --enable-xmlreader=shared,"$(STAGING_DIR)/usr"
else
  PKG_CONFIGURE_OPTS+= --disable-xmlreader
endif

ifneq ($(CONFIG_PACKAGE_php5-mod-xmlwriter),)
  PKG_CONFIGURE_OPTS+= --enable-xmlwriter=shared,"$(STAGING_DIR)/usr"
else
  PKG_CONFIGURE_OPTS+= --disable-xmlwriter
endif

ifneq ($(CONFIG_PHP5_APC),)
  PKG_CONFIGURE_OPTS+= --enable-apc --disable-apc-mmap --disable-apc-pthreadmutex
  PKG_CONFIGURE_LIBS+= -lrt
else
  PKG_CONFIGURE_OPTS+= --disable-apc
endif

ifneq ($(CONFIG_PHP5_FILTER),)
  PKG_CONFIGURE_OPTS+= --enable-filter
else
  PKG_CONFIGURE_OPTS+= --disable-filter
endif

ifneq ($(CONFIG_PHP5_LIBXML),)
  PKG_CONFIGURE_OPTS+= --enable-libxml
  PKG_CONFIGURE_OPTS+= --with-libxml-dir="$(STAGING_DIR)/usr/include/libxml2"
else
  PKG_CONFIGURE_OPTS+= --disable-libxml
endif

ifneq ($(CONFIG_PHP5_SYSVIPC),)
  PKG_CONFIGURE_OPTS+= --enable-sysvsem --enable-sysvshm --enable-sysvmsg
else
  PKG_CONFIGURE_OPTS+= --disable-sysvsem --disable-sysvshm --disable-sysvmsg
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
		, \
		LIBS="$(PKG_CONFIGURE_LIBS)" \
		php_cv_cc_rpath="no" \
		iconv_impl_name="gnu_libiconv" \
		ac_cv_php_xml2_config_path="$(STAGING_DIR)/host/bin/xml2-config" \
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
		, \
		LIBS="$(PKG_CONFIGURE_LIBS)" \
		php_cv_cc_rpath="no" \
		iconv_impl_name="gnu_libiconv" \
		ac_cv_php_xml2_config_path="$(STAGING_DIR)/host/bin/xml2-config" \
	)
	$(MAKE) -C $(PKG_BUILD_DIR)
	mv $(PKG_BUILD_DIR)/sapi/cgi/php-cgi $(PKG_BUILD_DIR)/php-cgi
  endef
endif

define Build/Compile
	$(call Build/Compile/php5-cli)
	$(call Build/Compile/php5-cgi)
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
	ln -sf php-cgi $(1)/usr/bin/php-fcgi
endef

define Package/php5-fastcgi/install
	$(INSTALL_DIR) $(1)/etc/init.d
	$(INSTALL_BIN) ./files/php.init $(1)/etc/init.d/php
endef

define BuildPlugin
  define Package/$(1)/install
	[ -z "$(2)" ] || $(INSTALL_DIR) $$(1)/usr/lib/php
	for m in $(2); do \
		[ -z "$(CONFIG_PACKAGE_$(1))" ] \
			 || $(INSTALL_BIN) $(PKG_BUILD_DIR)/modules/$$$$$$$${m}.so $$(1)/usr/lib/php/ ; \
	done
  endef

  $$(eval $$(call BuildPackage,$(1)))
endef

$(eval $(call BuildPackage,php5))
$(eval $(call BuildPackage,php5-cli))
$(eval $(call BuildPackage,php5-cgi))
$(eval $(call BuildPackage,php5-fastcgi))
$(eval $(call BuildPlugin,php5-mod-ctype,ctype))
$(eval $(call BuildPlugin,php5-mod-curl,curl))
$(eval $(call BuildPlugin,php5-mod-fileinfo,fileinfo))
$(eval $(call BuildPlugin,php5-mod-dom,dom))
$(eval $(call BuildPlugin,php5-mod-exif,exif))
$(eval $(call BuildPlugin,php5-mod-ftp,ftp))
$(eval $(call BuildPlugin,php5-mod-gd,gd))
$(eval $(call BuildPlugin,php5-mod-gmp,gmp))
$(eval $(call BuildPlugin,php5-mod-hash,hash))
$(eval $(call BuildPlugin,php5-mod-iconv,iconv))
$(eval $(call BuildPlugin,php5-mod-json,json))
$(eval $(call BuildPlugin,php5-mod-ldap,ldap))
$(eval $(call BuildPlugin,php5-mod-mbstring,mbstring))
$(eval $(call BuildPlugin,php5-mod-mcrypt,mcrypt))
$(eval $(call BuildPlugin,php5-mod-mysql,mysql))
$(eval $(call BuildPlugin,php5-mod-openssl,openssl))
$(eval $(call BuildPlugin,php5-mod-pdo,pdo))
$(eval $(call BuildPlugin,php5-mod-pdo-mysql,pdo_mysql))
$(eval $(call BuildPlugin,php5-mod-pdo-pgsql,pdo_pgsql))
$(eval $(call BuildPlugin,php5-mod-pdo-sqlite,pdo_sqlite))
$(eval $(call BuildPlugin,php5-mod-pgsql,pgsql))
$(eval $(call BuildPlugin,php5-mod-session,session))
$(eval $(call BuildPlugin,php5-mod-soap,soap))
$(eval $(call BuildPlugin,php5-mod-sockets,sockets))
$(eval $(call BuildPlugin,php5-mod-sqlite,sqlite))
$(eval $(call BuildPlugin,php5-mod-sqlite3,sqlite3))
$(eval $(call BuildPlugin,php5-mod-tokenizer,tokenizer))
$(eval $(call BuildPlugin,php5-mod-xml,xml))
$(eval $(call BuildPlugin,php5-mod-xmlreader,xmlreader))
$(eval $(call BuildPlugin,php5-mod-xmlwriter,xmlwriter))
