#
# Copyright (C) 2006-2010 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=freeradius
PKG_VERSION:=1.1.8
PKG_RELEASE:=2

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.bz2
PKG_SOURCE_URL:=ftp://ftp.freeradius.org/pub/radius/old/ \
	http://freeradius.portal-to-web.de/ \
	ftp://ftp.uk.freeradius.org/pub/radius/
PKG_MD5SUM:=d367452a837bbe8d9c8731e21dc43593

PKG_FIXUP:=libtool

include $(INCLUDE_DIR)/package.mk

define Package/freeradius/Default
  SECTION:=net
  CATEGORY:=Network
  URL:=http://freeradius.org/
endef

define Package/freeradius
  $(call Package/freeradius/Default)
  DEPENDS:=+libltdl +libopenssl +libpthread +libreadline
  TITLE:=A flexible RADIUS server
  MENU:=1
endef

define Package/freeradius/conffiles
/etc/freeradius/clients.conf
/etc/freeradius/radiusd.conf
endef

define Package/freeradius-democerts
  $(call Package/freeradius/Default)
  DEPENDS:=freeradius
  TITLE:=Demo certificates to test the server
endef

define Package/freeradius-mod-chap
  $(call Package/freeradius/Default)
  DEPENDS:=freeradius
  TITLE:=CHAP module
endef

define Package/freeradius-mod-detail
  $(call Package/freeradius/Default)
  DEPENDS:=freeradius
  TITLE:=Detailed accounting module
endef

define Package/freeradius-mod-eap
  $(call Package/freeradius/Default)
  DEPENDS:=freeradius
  TITLE:=Base EAP module
endef

define Package/freeradius-mod-eap/conffiles
/etc/freeradius/eap.conf
endef

define Package/freeradius-mod-eap-gtc
  $(call Package/freeradius/Default)
  DEPENDS:=freeradius-mod-eap
  TITLE:=EAP/GTC module
endef

define Package/freeradius-mod-eap-md5
  $(call Package/freeradius/Default)
  DEPENDS:=freeradius-mod-eap
  TITLE:=EAP/MD5 module
endef

define Package/freeradius-mod-eap-mschapv2
  $(call Package/freeradius/Default)
  DEPENDS:=freeradius-mod-eap
  TITLE:=EAP/MS-CHAPv2 module
endef

define Package/freeradius-mod-eap-peap
  $(call Package/freeradius/Default)
  DEPENDS:=freeradius-mod-eap
  TITLE:=EAP/PEAP module
endef

define Package/freeradius-mod-eap-tls
  $(call Package/freeradius/Default)
  DEPENDS:=freeradius-mod-eap
  TITLE:=EAP/TLS module
endef

define Package/freeradius-mod-eap-ttls
  $(call Package/freeradius/Default)
  DEPENDS:=freeradius-mod-eap-tls
  TITLE:=EAP/TTLS module
endef

define Package/freeradius-mod-exec
  $(call Package/freeradius/Default)
  DEPENDS:=freeradius
  TITLE:=EXEC module
endef

define Package/freeradius-mod-attr-rewrite
  $(call Package/freeradius/Default)
  DEPENDS:=freeradius
  TITLE:=ATTR rewrite module
endef

define Package/freeradius-mod-files
  $(call Package/freeradius/Default)
  DEPENDS:=freeradius
  TITLE:=Module using local files for authorization
endef

define Package/freeradius-mod-files/conffiles
/etc/freeradius/acct_users
/etc/freeradius/preproxy_users
/etc/freeradius/users
endef

define Package/freeradius-mod-ldap
  $(call Package/freeradius/Default)
  DEPENDS:=freeradius +libopenldap
  TITLE:=LDAP module
endef

define Package/freeradius-mod-ldap/conffiles
/etc/freeradius/ldap.attrmap
endef

define Package/freeradius-mod-mschap
  $(call Package/freeradius/Default)
  DEPENDS:=freeradius
  TITLE:=MS-CHAP and MS-CHAPv2 module
endef

define Package/freeradius-mod-pap
  $(call Package/freeradius/Default)
  DEPENDS:=freeradius
  TITLE:=PAP module
endef

define Package/freeradius-mod-preprocess
  $(call Package/freeradius/Default)
  DEPENDS:=freeradius
  TITLE:=Request pre-processing module
endef

define Package/freeradius-mod-preprocess/conffiles
/etc/freeradius/hints
/etc/freeradius/huntgroups
endef

define Package/freeradius-mod-realm
  $(call Package/freeradius/Default)
  DEPENDS:=freeradius
  TITLE:=Realms handling module
endef

define Package/freeradius-mod-realm/conffiles
/etc/freeradius/proxy.conf
endef

define Package/freeradius-mod-sql
  $(call Package/freeradius/Default)
  DEPENDS:=freeradius
  TITLE:=Base SQL module
endef

define Package/freeradius-mod-sql-mysql
  $(call Package/freeradius/Default)
  DEPENDS:=freeradius-mod-sql +libmysqlclient
  TITLE:=MySQL module
endef

define Package/freeradius-mod-sql-pgsql
  $(call Package/freeradius/Default)
  DEPENDS:=freeradius-mod-sql +libpq
  TITLE:=PostgreSQL module
endef

define Package/freeradius-mod-sqlcounter
  $(call Package/freeradius/Default)
  DEPENDS:=freeradius-mod-sql
  TITLE:=Generic SQL Counter module
endef

define Package/freeradius-mod-radutmp
  $(call Package/freeradius/Default)
  DEPENDS:=freeradius
  TITLE:=Radius UTMP module
endef

define Package/freeradius-utils
  $(call Package/freeradius/Default)
  DEPENDS:=freeradius
  TITLE:=Misc. client utilities
endef

CONFIGURE_ARGS+= \
	--libdir=/usr/lib/freeradius \
	--libexecdir=/usr/lib/freeradius \
	--enable-shared \
	--disable-static \
	--disable-developer \
	--with-openssl-includes="$(STAGING_DIR)/usr/include" \
	--with-openssl-libraries="$(STAGING_DIR)/usr/lib" \
	--with-system-libtool \
	--disable-ltdl-install \
	--enable-strict-dependencies \
	--with-raddbdir=/etc/freeradius \
	--without-edir \
	--without-snmp \
	--with-experimental-modules \
	--without-rlm_checkval \
	--without-rlm_counter \
	--without-rlm_dbm \
	--with-rlm_eap \
	--without-rlm_eap_sim \
	--without-rlm_example \
	--without-rlm_ippool \
	--without-rlm_krb5 \
	--without-rlm_otp \
	--without-rlm_pam \
	--without-rlm_perl \
	--without-rlm_python \
	--without-rlm_smb \
	--with-rlm_sql \
	--with-rlm_sqlcounter \
	--without-rlm_sqlhpwippool \
	--without-rlm_sqlippool \
	--without-rlm_sql_db2 \
	--without-rlm_sql_firebird \
	--without-rlm_sql_freetds \
	--without-rlm_sql_iodbc \
	--without-rlm_sql_oracle \
	--without-rlm_sql_sybase \
	--without-rlm_sql_unixodbc \
	--without-rlm_sql_log \
	--without-rlm_unix \

PKG_DICTIONARIES:= \
	freeradius freeradius.internal \
	rfc2865 rfc2866 rfc2867 rfc2868 rfc2869 rfc3162 rfc3576 rfc3580 \
	rfc4372 rfc4675 rfc4679 \
	microsoft \
	wispr \

ifneq ($(SDK)$(CONFIG_PACKAGE_freeradius-mod-ldap),)
  CONFIGURE_ARGS+= \
		--with-rlm_ldap-include-dir="$(STAGING_DIR)/usr/include" \
		--with-rlm_ldap-lib-dir="$(STAGING_DIR)/usr/lib"
  CONFIGURE_LIBS+= -lcrypto -lssl
else
  CONFIGURE_ARGS+= --without-rlm_ldap
endif

ifneq ($(SDK)$(CONFIG_PACKAGE_freeradius-mod-sql-mysql),)
  CONFIGURE_ARGS+= \
		--with-mysql-include-dir="$(STAGING_DIR)/usr/include" \
		--with-mysql-lib-dir="$(STAGING_DIR)/usr/lib/mysql" \
		--without-threads
  CONFIGURE_LIBS+= -lz
else
  CONFIGURE_ARGS+= --without-rlm_sql_mysql
endif

ifneq ($(SDK)$(CONFIG_PACKAGE_freeradius-mod-sql-pgsql),)
  CONFIGURE_ARGS+= \
		--with-rlm_sql_postgresql-include-dir="$(STAGING_DIR)/usr/include" \
		--with-rlm_sql_postgresql-lib-dir="$(STAGING_DIR)/usr/lib"
else
  CONFIGURE_ARGS+= --without-rlm_sql_postgresql
endif

ifneq ($(SDK)$(CONFIG_PACKAGE_freeradius-mod-eap-peap),)
  CONFIGURE_ARGS+= --with-rlm_eap_peap
  CONFIGURE_LIBS+= -lcrypto -lssl
else
  CONFIGURE_ARGS+= --without-rlm_eap_peap
endif

ifneq ($(SDK)$(CONFIG_PACKAGE_freeradius-mod-eap-tls),)
  CONFIGURE_ARGS+= --with-rlm_eap_tls
  CONFIGURE_LIBS+= -lcrypto -lssl
else
  CONFIGURE_ARGS+= --without-rlm_eap_tls
endif

ifneq ($(SDK)$(CONFIG_PACKAGE_freeradius-mod-eap-ttls),)
  CONFIGURE_ARGS+= --with-rlm_eap_ttls
  CONFIGURE_LIBS+= -lcrypto -lssl
else
  CONFIGURE_ARGS+= --without-rlm_eap_ttls
endif

ifneq ($(SDK)$(CONFIG_PACKAGE_freeradius-mod-attr-rewrite),)
  CONFIGURE_ARGS+= --with-rlm_attr-rewrite
else
  CONFIGURE_ARGS+= --without-rlm_attr-rewrite
endif

ifneq ($(SDK)$(CONFIG_PACKAGE_freeradius-mod-radutmp),)
  CONFIGURE_ARGS+= --with-rlm_radutmp
else
  CONFIGURE_ARGS+= --without-rlm_radutmp
endif

CONFIGURE_VARS+= \
	LDFLAGS="$$$$LDFLAGS -L$(PKG_INSTALL_DIR)/usr/lib/freeradius" \
	LIBS="$(CONFIGURE_LIBS)" \
	MYSQL_CONFIG="no" \

define Build/Compile
	$(MAKE) -C $(PKG_BUILD_DIR) \
		R="$(PKG_INSTALL_DIR)" \
		INSTALLSTRIP="" \
		all install
endef

define Package/freeradius/install
	$(INSTALL_DIR) $(1)/etc/freeradius
	for f in clients.conf dictionary radiusd.conf; do \
		$(CP) $(PKG_INSTALL_DIR)/etc/freeradius/$$$${f} $(1)/etc/freeradius/ ; \
	done
	$(INSTALL_DIR) $(1)/usr/share/freeradius
	$(CP) $(PKG_INSTALL_DIR)/usr/share/freeradius/dictionary $(1)/usr/share/freeradius/
	$(SED) "s,^\(\$$$$INCLUDE\),#\1,g" $(1)/usr/share/freeradius/dictionary
	for f in $(PKG_DICTIONARIES); do \
		$(CP) $(PKG_INSTALL_DIR)/usr/share/freeradius/dictionary.$$$${f} $(1)/usr/share/freeradius/ ; \
		$(SED) "s,^#\(\$$$$INCLUDE dictionary\.$$$${f}\),\1,g" $(1)/usr/share/freeradius/dictionary ; \
	done
	$(INSTALL_DIR) $(1)/usr/lib/freeradius
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/freeradius/libradius{,-*}.so $(1)/usr/lib/
	$(INSTALL_DIR) $(1)/usr/sbin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/usr/sbin/radiusd $(1)/usr/sbin/
	$(INSTALL_DIR) $(1)/etc/init.d
	$(INSTALL_BIN) ./files/radiusd.init $(1)/etc/init.d/radiusd
endef

define Package/freeradius-democerts/install
	$(INSTALL_DIR) $(1)/etc/freeradius
	$(CP) $(PKG_INSTALL_DIR)/etc/freeradius/certs $(1)/etc/freeradius/
	rm -rf $(1)/etc/freeradius/certs/README
	rm -rf $(1)/etc/freeradius/certs/new*
	rm -rf $(1)/etc/freeradius/certs/demoCA/index*
	rm -rf $(1)/etc/freeradius/certs/demoCA/serial*
endef

define Package/freeradius-utils/install
	$(INSTALL_DIR) $(1)/usr/bin
	for f in radclient radeapclient; do \
		$(INSTALL_BIN) $(PKG_INSTALL_DIR)/usr/bin/$$$${f} $(1)/usr/bin/ ; \
	done
endef

define BuildPlugin
  define Package/$(1)/install
	[ -z "$(2)" ] || $(INSTALL_DIR) $$(1)/usr/lib
	for m in $(2); do \
		$(CP) $(PKG_INSTALL_DIR)/usr/lib/freeradius/$$$$$$$${m}{,-*}.so $$(1)/usr/lib/ ; \
	done
	[ -z "$(3)" ] || $(INSTALL_DIR) $$(1)/etc/freeradius
	for f in $(3); do \
		$(CP) $(PKG_INSTALL_DIR)/etc/freeradius/$$$$$$$${f} $$(1)/etc/freeradius/ ; \
	done
  endef

  $$(eval $$(call BuildPackage,$(1)))
endef

$(eval $(call BuildPackage,freeradius))
$(eval $(call BuildPackage,freeradius-democerts))
$(eval $(call BuildPlugin,freeradius-mod-chap,rlm_chap,))
$(eval $(call BuildPlugin,freeradius-mod-detail,rlm_detail,))
$(eval $(call BuildPlugin,freeradius-mod-eap,libeap rlm_eap,eap.conf))
$(eval $(call BuildPlugin,freeradius-mod-eap-gtc,rlm_eap_gtc,))
$(eval $(call BuildPlugin,freeradius-mod-eap-md5,rlm_eap_md5,))
$(eval $(call BuildPlugin,freeradius-mod-eap-mschapv2,rlm_eap_mschapv2,))
$(eval $(call BuildPlugin,freeradius-mod-eap-peap,rlm_eap_peap,))
$(eval $(call BuildPlugin,freeradius-mod-eap-tls,rlm_eap_tls,))
$(eval $(call BuildPlugin,freeradius-mod-eap-ttls,rlm_eap_ttls,))
$(eval $(call BuildPlugin,freeradius-mod-exec,rlm_exec,))
$(eval $(call BuildPlugin,freeradius-mod-attr-rewrite,rlm_attr_rewrite))
$(eval $(call BuildPlugin,freeradius-mod-files,rlm_files,acct_users preproxy_users users))
$(eval $(call BuildPlugin,freeradius-mod-ldap,rlm_ldap,ldap.attrmap))
$(eval $(call BuildPlugin,freeradius-mod-mschap,rlm_mschap,))
$(eval $(call BuildPlugin,freeradius-mod-pap,rlm_pap,))
$(eval $(call BuildPlugin,freeradius-mod-preprocess,rlm_preprocess,hints huntgroups))
$(eval $(call BuildPlugin,freeradius-mod-realm,rlm_realm,proxy.conf))
$(eval $(call BuildPlugin,freeradius-mod-sql,rlm_sql,sql.conf))
$(eval $(call BuildPlugin,freeradius-mod-sql-mysql,rlm_sql_mysql,))
$(eval $(call BuildPlugin,freeradius-mod-sql-pgsql,rlm_sql_postgresql,))
$(eval $(call BuildPlugin,freeradius-mod-sqlcounter,rlm_sqlcounter,))
$(eval $(call BuildPlugin,freeradius-mod-radutmp,rlm_radutmp,))
$(eval $(call BuildPackage,freeradius-utils))
