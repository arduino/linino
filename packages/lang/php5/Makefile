#
# Copyright (C) 2006-2010 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=php
PKG_VERSION:=5.3.4
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.bz2
PKG_SOURCE_URL:=http://www.php.net/distributions/
PKG_MD5SUM:=2c069d8f690933e3bf6a8741ed818150

PKG_FIXUP:=libtool no-autoreconf
PKG_BUILD_PARALLEL:=1 

include $(INCLUDE_DIR)/package.mk
include $(INCLUDE_DIR)/nls.mk

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
  (call Package/php5/Default/description)
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

CONFIGURE_VARS += \
	ac_cv_c_bigendian_php=$(if $(CONFIG_BIG_ENDIAN),yes,no)

PKG_CONFIGURE_OPTS:= \
	--enable-shared \
	--disable-static \
	--disable-rpath \
	--disable-debug \
	--without-pear \
	\
	--with-config-file-path=/etc \
	--with-config-file-scan-dir=/etc/php5 \
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
  PKG_BUILD_DEPENDS+=libopenssl zlib libcurl libgd libgmp libopenldap libmysqlclient libpq libsqlite2 libpthread libsqlite3 libpcre libxml2
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
  PKG_CONFIGURE_OPTS+= --with-iconv=shared,"$(ICONV_PREFIX)"
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

ifneq ($(CONFIG_PACKAGE_php5-mod-pcntl),)
  PKG_CONFIGURE_OPTS+= --enable-pcntl=shared
else
  PKG_CONFIGURE_OPTS+= --disable-pcntl
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
    PKG_CONFIGURE_LIBS+= -lsqlite3 -lpthread
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
  PKG_CONFIGURE_LIBS+= -lsqlite3 -lpthread
else
  PKG_CONFIGURE_OPTS+= --without-sqlite3
endif

ifneq ($(CONFIG_PACKAGE_php5-mod-sysvmsg),)
  PKG_CONFIGURE_OPTS+= --enable-sysvmsg=shared
else
  PKG_CONFIGURE_OPTS+= --disable-sysvmsg
endif

ifneq ($(CONFIG_PACKAGE_php5-mod-sysvsem),)
  PKG_CONFIGURE_OPTS+= --enable-sysvsem=shared
else
  PKG_CONFIGURE_OPTS+= --disable-sysvsem
endif

ifneq ($(CONFIG_PACKAGE_php5-mod-sysvshm),)
  PKG_CONFIGURE_OPTS+= --enable-sysvshm=shared
else
  PKG_CONFIGURE_OPTS+= --disable-sysvshm
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
	$(MAKE) $(PKG_JOBS) -C $(PKG_BUILD_DIR)
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
	$(MAKE) $(PKG_JOBS) -C $(PKG_BUILD_DIR)
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

PHP5_MODULES:=

define BuildModule
  define Package/php5-mod-$(1)
    $(call Package/php5/Default)
    ifneq ($(3),)
      DEPENDS:=$(3)
    else
      DEPENDS:=php5
    endif
    TITLE:=$(2) shared module
  endef

  define Package/php5-mod-$(1)/config
    depends on PACKAGE_php5-cli || PACKAGE_php5-cgi
    $(4)
  endef

  define Package/php5-mod-$(1)/install
	$(INSTALL_DIR) $$(1)/usr/lib/php
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/modules/$(subst -,_,$(1)).so $$(1)/usr/lib/php/
	$(INSTALL_DIR) $$(1)/etc/php5
	echo "extension=$(subst -,_,$(1)).so" > $$(1)/etc/php5/$(subst -,_,$(1)).ini
  endef

  PHP5_MODULES+= php5-mod-$(1)
endef

$(eval $(call BuildPackage,php5))
$(eval $(call BuildPackage,php5-cli))
$(eval $(call BuildPackage,php5-cgi))
$(eval $(call BuildPackage,php5-fastcgi))

$(eval $(call BuildModule,ctype,Ctype))
$(eval $(call BuildModule,curl,cURL,php5 +libcurl))
$(eval $(call BuildModule,fileinfo,Fileinfo,php5 +libmagic))
$(eval $(call BuildModule,dom,DOM,php5 +libxml2,depends on PHP5_LIBXML))
$(eval $(call BuildModule,exif,EXIF))
$(eval $(call BuildModule,ftp,FTP))
$(eval $(call BuildModule,gd,GD graphics,php5 +libgd))
$(eval $(call BuildModule,gmp,GMP,php5 +libgmp))
$(eval $(call BuildModule,hash,Hash))
$(eval $(call BuildModule,iconv,iConv,php5 +libiconv))
$(eval $(call BuildModule,json,JSON))
$(eval $(call BuildModule,ldap,LDAP,php5 +libopenldap +libsasl2))
$(eval $(call BuildModule,mbstring,MBString))
$(eval $(call BuildModule,mcrypt,Mcrypt,php5 +libmcrypt +libltdl))
$(eval $(call BuildModule,mysql,MySQL,php5 +libmysqlclient))
$(eval $(call BuildModule,openssl,OpenSSL,php5 +libopenssl))
$(eval $(call BuildModule,pcntl,PCNTL))
$(eval $(call BuildModule,pdo,PHP Data Objects))
$(eval $(call BuildModule,pdo-mysql,PDO driver for MySQL,php5-mod-pdo +libmysqlclient))
$(eval $(call BuildModule,pdo-pgsql,PDO driver for PostgreSQL,php5-mod-pdo +libpq))
$(eval $(call BuildModule,pdo-sqlite,PDO driver for SQLite 3.x,php5-mod-pdo +libsqlite3 +libpthread))
$(eval $(call BuildModule,pgsql,PostgreSQL,php5 +libpq))
$(eval $(call BuildModule,session,Session))
$(eval $(call BuildModule,simplexml,SimpleXML,php5 +libxml2,depends on PHP5_LIBXML))
$(eval $(call BuildModule,soap,SOAP,php5 +libxml2,depends on PHP5_LIBXML))
$(eval $(call BuildModule,sockets,Sockets))
$(eval $(call BuildModule,sqlite,SQLite 2.x,php5 +libsqlite2))
$(eval $(call BuildModule,sqlite3,SQLite3,php5 +libsqlite3 +libpthread))
$(eval $(call BuildModule,sysvmsg,System V messages))
$(eval $(call BuildModule,sysvsem,System V shared memory))
$(eval $(call BuildModule,sysvshm,System V semaphore))
$(eval $(call BuildModule,tokenizer,Tokenizer))
$(eval $(call BuildModule,xml,XML,php5 $(if $(CONFIG_PHP5_LIBXML),+libxml2,+libexpat)))
$(eval $(call BuildModule,xmlreader,XMLReader,php5 +libxml2 +libiconv,depends on PHP5_LIBXML))
$(eval $(call BuildModule,xmlwriter,XMLWriter,php5 +libxml2 +libiconv,depends on PHP5_LIBXML))

PKG_CONFIG_DEPENDS:= $(patsubst %,CONFIG_PACKAGE_%,$(PHP5_MODULES))
$(foreach p,$(PHP5_MODULES),$(eval $(call BuildPackage,$(p))))
