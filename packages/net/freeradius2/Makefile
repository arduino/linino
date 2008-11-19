# 
# Copyright (C) 2008 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
# $Id: $

include $(TOPDIR)/rules.mk

PKG_NAME:=freeradius2
PKG_VERSION:=2.1.1
PKG_RELEASE:=2

PKG_SOURCE:=freeradius-server-$(PKG_VERSION).tar.bz2
PKG_SOURCE_URL:=ftp://ftp.freeradius.org/pub/freeradius/
PKG_MD5SUM:=4ccf748ef9851d90844d085647351ca4

PKG_BUILD_DIR:=$(BUILD_DIR)/freeradius-server-$(PKG_VERSION)

include $(INCLUDE_DIR)/package.mk

define Package/freeradius2/Default
  SECTION:=net
  CATEGORY:=Network
  URL:=http://www.freeradius2.org/
endef

define Package/freeradius2
  $(call Package/freeradius2/Default)
  DEPENDS:=+libltdl +libopenssl +libpthread +libreadline
  TITLE:=A flexible RADIUS server (version 2)
  MENU:=1
endef

define Package/freeradius2/conffiles
/etc/freeradius2/clients.conf
/etc/freeradius2/radiusd.conf
endef

define Package/freeradius2-democerts
  $(call Package/freeradius2/Default)
  DEPENDS:=freeradius2
  TITLE:=Demo certificates to test the server
endef

define Package/freeradius2-mod-chap
  $(call Package/freeradius2/Default)
  DEPENDS:=freeradius2
  TITLE:=CHAP module
endef

define Package/freeradius2-mod-detail
  $(call Package/freeradius2/Default)
  DEPENDS:=freeradius2
  TITLE:=Detailed accounting module
endef

define Package/freeradius2-mod-eap
  $(call Package/freeradius2/Default)
  DEPENDS:=freeradius2
  TITLE:=Base EAP module
endef

define Package/freeradius2-mod-eap/conffiles
/etc/freeradius2/eap.conf
endef

define Package/freeradius2-mod-eap-gtc
  $(call Package/freeradius2/Default)
  DEPENDS:=freeradius2-mod-eap
  TITLE:=EAP/GTC module
endef

define Package/freeradius2-mod-eap-md5
  $(call Package/freeradius2/Default)
  DEPENDS:=freeradius2-mod-eap
  TITLE:=EAP/MD5 module
endef

define Package/freeradius2-mod-eap-mschapv2
  $(call Package/freeradius2/Default)
  DEPENDS:=freeradius2-mod-eap
  TITLE:=EAP/MS-CHAPv2 module
endef

define Package/freeradius2-mod-eap-peap
  $(call Package/freeradius2/Default)
  DEPENDS:=freeradius2-mod-eap
  TITLE:=EAP/PEAP module
endef

define Package/freeradius2-mod-eap-tls
  $(call Package/freeradius2/Default)
  DEPENDS:=freeradius2-mod-eap
  TITLE:=EAP/TLS module
endef

define Package/freeradius2-mod-eap-ttls
  $(call Package/freeradius2/Default)
  DEPENDS:=freeradius2-mod-eap-tls
  TITLE:=EAP/TTLS module
endef

define Package/freeradius2-mod-exec
  $(call Package/freeradius2/Default)
  DEPENDS:=freeradius2
  TITLE:=EXEC module
endef

define Package/freeradius2-mod-attr-rewrite
  $(call Package/freeradius2/Default)
  DEPENDS:=freeradius2
  TITLE:=ATTR rewrite module
endef

define Package/freeradius2-mod-files
  $(call Package/freeradius2/Default)
  DEPENDS:=freeradius2
  TITLE:=Module using local files for authorization
endef

define Package/freeradius2-mod-files/conffiles
/etc/freeradius2/acct_users
/etc/freeradius2/preproxy_users
/etc/freeradius2/users
endef

define Package/freeradius2-mod-ldap
  $(call Package/freeradius2/Default)
  DEPENDS:=freeradius2 +libopenldap
  TITLE:=LDAP module
endef

define Package/freeradius2-mod-ldap/conffiles
/etc/freeradius2/ldap.attrmap
endef

define Package/freeradius2-mod-mschap
  $(call Package/freeradius2/Default)
  DEPENDS:=freeradius2
  TITLE:=MS-CHAP and MS-CHAPv2 module
endef

define Package/freeradius2-mod-pap
  $(call Package/freeradius2/Default)
  DEPENDS:=freeradius2
  TITLE:=PAP module
endef

define Package/freeradius2-mod-preprocess
  $(call Package/freeradius2/Default)
  DEPENDS:=freeradius2
  TITLE:=Request pre-processing module
endef

define Package/freeradius2-mod-preprocess/conffiles
/etc/freeradius2/hints
/etc/freeradius2/huntgroups
endef

define Package/freeradius2-mod-realm
  $(call Package/freeradius2/Default)
  DEPENDS:=freeradius2
  TITLE:=Realms handling module
endef

define Package/freeradius2-mod-realm/conffiles
/etc/freeradius2/proxy.conf
endef

define Package/freeradius2-mod-sql
  $(call Package/freeradius2/Default)
  DEPENDS:=freeradius2
  TITLE:=Base SQL module
endef

define Package/freeradius2-mod-sql-mysql
  $(call Package/freeradius2/Default)
  DEPENDS:=freeradius2-mod-sql +libmysqlclient
  TITLE:=MySQL module
endef

define Package/freeradius2-mod-sql-pgsql
  $(call Package/freeradius2/Default)
  DEPENDS:=freeradius2-mod-sql +libpq
  TITLE:=PostgreSQL module
endef

define Package/freeradius2-mod-sqlcounter
  $(call Package/freeradius2/Default)
  DEPENDS:=freeradius2-mod-sql
  TITLE:=Generic SQL Counter module
endef

define Package/freeradius2-mod-radutmp
  $(call Package/freeradius2/Default)
  DEPENDS:=freeradius2
  TITLE:=Radius UTMP module
endef

define Package/freeradius2-utils
  $(call Package/freeradius2/Default)
  DEPENDS:=freeradius2
  TITLE:=Misc. client utilities
endef

CONFIGURE_ARGS+= \
	--libdir=/usr/lib/freeradius2 \
	--libexecdir=/usr/lib/freeradius2 \
	--enable-shared \
	--disable-static \
	--disable-developer \
	--with-openssl-includes="$(STAGING_DIR)/usr/include" \
	--with-openssl-libraries="$(STAGING_DIR)/usr/lib" \
	--enable-strict-dependencies \
	--with-raddbdir=/etc/freeradius2 \
	--without-edir \
	--without-snmp \
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
	--without-rlm_sql_sqlite \
	--without-rlm_unix \
	--without-rlm_eap_tnc \
	--without-rlm_eap_ikev2 \
	--without-rlm_opendirectory \
	--without-rlm_wimax \

PKG_DICTIONARIES:= \
	freeradius freeradius.internal \
	rfc2865 rfc2866 rfc2867 rfc2868 rfc2869 rfc3162 rfc3576 rfc3580 \
	rfc4372 rfc4675 rfc4679 \
	microsoft \
	wispr \

ifneq ($(SDK)$(CONFIG_PACKAGE_freeradius2-mod-ldap),)
  CONFIGURE_ARGS+= \
		--with-rlm_ldap-include-dir="$(STAGING_DIR)/usr/include" \
		--with-rlm_ldap-lib-dir="$(STAGING_DIR)/usr/lib"
  CONFIGURE_LIBS+= -lcrypto -lssl
else
  CONFIGURE_ARGS+= --without-rlm_ldap
endif

ifneq ($(SDK)$(CONFIG_PACKAGE_freeradius2-mod-sql-mysql),)
  CONFIGURE_ARGS+= \
		--with-mysql-include-dir="$(STAGING_DIR)/usr/include" \
		--with-mysql-lib-dir="$(STAGING_DIR)/usr/lib/mysql" \
		--without-threads
  CONFIGURE_LIBS+= -lz
else
  CONFIGURE_ARGS+= --without-rlm_sql_mysql
endif

ifneq ($(SDK)$(CONFIG_PACKAGE_freeradius2-mod-sql-pgsql),)
  CONFIGURE_ARGS+= \
		--with-rlm_sql_postgresql-include-dir="$(STAGING_DIR)/usr/include" \
		--with-rlm_sql_postgresql-lib-dir="$(STAGING_DIR)/usr/lib"
else
  CONFIGURE_ARGS+= --without-rlm_sql_postgresql
endif

ifneq ($(SDK)$(CONFIG_PACKAGE_freeradius2-mod-eap-peap),)
  CONFIGURE_ARGS+= \
  		--with-rlm_eap_peap \
		--with-rlm_eap_peap-include-dir="$(STAGING_DIR)/usr/include" \
		--with-rlm_eap_peap-lib-dir="$(STAGING_DIR)/usr/lib"
  CONFIGURE_LIBS+= -lcrypto -lssl
else
  CONFIGURE_ARGS+= --without-rlm_eap_peap
endif

ifneq ($(SDK)$(CONFIG_PACKAGE_freeradius2-mod-eap-tls),)
  CONFIGURE_ARGS+= \
  		--with-rlm_eap_tls \
		--with-rlm_eap_tls-include-dir="$(STAGING_DIR)/usr/include" \
		--with-rlm_eap_tls-lib-dir="$(STAGING_DIR)/usr/lib"
  CONFIGURE_LIBS+= -lcrypto -lssl
else
  CONFIGURE_ARGS+= --without-rlm_eap_tls
endif

ifneq ($(SDK)$(CONFIG_PACKAGE_freeradius2-mod-eap-ttls),)
  CONFIGURE_ARGS+= \
  		--with-rlm_eap_ttls \
		--with-rlm_eap_ttls-include-dir="$(STAGING_DIR)/usr/include" \
		--with-rlm_eap_ttls-lib-dir="$(STAGING_DIR)/usr/lib"
  CONFIGURE_LIBS+= -lcrypto -lssl
else
  CONFIGURE_ARGS+= --without-rlm_eap_ttls
endif

ifneq ($(SDK)$(CONFIG_PACKAGE_freeradius2-mod-attr-rewrite),)
  CONFIGURE_ARGS+= --with-rlm_attr-rewrite
else
  CONFIGURE_ARGS+= --without-rlm_attr-rewrite
endif

ifneq ($(SDK)$(CONFIG_PACKAGE_freeradius2-mod-radutmp),)
  CONFIGURE_ARGS+= --with-rlm_radutmp
else
  CONFIGURE_ARGS+= --without-rlm_radutmp
endif

CONFIGURE_VARS+= \
	LDFLAGS="$$$$LDFLAGS" \
	LIBS="$(CONFIGURE_LIBS)" \
	MYSQL_CONFIG="no" \
	ac_cv_lib_readline=no \

define Build/Compile
	$(MAKE) -C $(PKG_BUILD_DIR) \
		R="$(PKG_INSTALL_DIR)" \
		INSTALLSTRIP="" \
		all install
endef

define Package/freeradius2/install
	$(INSTALL_DIR) $(1)/etc/freeradius2
	for f in clients.conf dictionary radiusd.conf; do \
		$(CP) $(PKG_INSTALL_DIR)/etc/freeradius2/$$$${f} $(1)/etc/freeradius2/ ; \
	done
	$(INSTALL_DIR) $(1)/usr/share/freeradius2
	$(CP) $(PKG_INSTALL_DIR)/usr/share/freeradius/dictionary $(1)/usr/share/freeradius2/
	$(SED) "s,^\(\$$$$INCLUDE\),#\1,g" $(1)/usr/share/freeradius2/dictionary
	for f in $(PKG_DICTIONARIES); do \
		$(CP) $(PKG_INSTALL_DIR)/usr/share/freeradius/dictionary.$$$${f} $(1)/usr/share/freeradius2/ ; \
		$(SED) "s,^#\(\$$$$INCLUDE dictionary\.$$$${f}\),\1,g" $(1)/usr/share/freeradius2/dictionary ; \
	done
	$(INSTALL_DIR) $(1)/usr/lib/freeradius2
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/freeradius2/libfreeradius-radius{,-*}.so $(1)/usr/lib/
	$(INSTALL_DIR) $(1)/usr/sbin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/usr/sbin/radiusd $(1)/usr/sbin/
	$(INSTALL_DIR) $(1)/etc/init.d
	$(INSTALL_BIN) ./files/radiusd.init $(1)/etc/init.d/radiusd
endef

define Package/freeradius2-democerts/install
	$(INSTALL_DIR) $(1)/etc/freeradius2
	$(CP) $(PKG_INSTALL_DIR)/etc/freeradius2/certs $(1)/etc/freeradius2/
	rm -rf $(1)/etc/freeradius2/certs/README
	rm -rf $(1)/etc/freeradius2/certs/new*
	rm -rf $(1)/etc/freeradius2/certs/demoCA/index*
	rm -rf $(1)/etc/freeradius2/certs/demoCA/serial*
endef

define Package/freeradius2-utils/install
	$(INSTALL_DIR) $(1)/usr/bin
	for f in radclient radeapclient; do \
		$(INSTALL_BIN) $(PKG_INSTALL_DIR)/usr/bin/$$$${f} $(1)/usr/bin/ ; \
	done
endef

define BuildPlugin
  define Package/$(1)/install
	[ -z "$(2)" ] || $(INSTALL_DIR) $$(1)/usr/lib
	for m in $(2); do \
		$(CP) $(PKG_INSTALL_DIR)/usr/lib/freeradius2/$$$$$$$${m}{,-*}.so $$(1)/usr/lib/ ; \
	done
	[ -z "$(3)" ] || $(INSTALL_DIR) $$(1)/etc/freeradius2
	for f in $(3); do \
		$(CP) $(PKG_INSTALL_DIR)/etc/freeradius2/$$$$$$$${f} $$(1)/etc/freeradius2/ ; \
	done
  endef

  $$(eval $$(call BuildPackage,$(1)))
endef

$(eval $(call BuildPackage,freeradius2))
$(eval $(call BuildPackage,freeradius2-democerts))
$(eval $(call BuildPlugin,freeradius2-mod-chap,rlm_chap,))
$(eval $(call BuildPlugin,freeradius2-mod-detail,rlm_detail,))
$(eval $(call BuildPlugin,freeradius2-mod-eap,libfreeradius-eap rlm_eap,eap.conf))
$(eval $(call BuildPlugin,freeradius2-mod-eap-gtc,rlm_eap_gtc,))
$(eval $(call BuildPlugin,freeradius2-mod-eap-md5,rlm_eap_md5,))
$(eval $(call BuildPlugin,freeradius2-mod-eap-mschapv2,rlm_eap_mschapv2,))
$(eval $(call BuildPlugin,freeradius2-mod-eap-peap,rlm_eap_peap,))
$(eval $(call BuildPlugin,freeradius2-mod-eap-tls,rlm_eap_tls,))
$(eval $(call BuildPlugin,freeradius2-mod-eap-ttls,rlm_eap_ttls,))
$(eval $(call BuildPlugin,freeradius2-mod-exec,rlm_exec,))
$(eval $(call BuildPlugin,freeradius2-mod-attr-rewrite,rlm_attr_rewrite))
$(eval $(call BuildPlugin,freeradius2-mod-files,rlm_files,acct_users preproxy_users users))
$(eval $(call BuildPlugin,freeradius2-mod-ldap,rlm_ldap,ldap.attrmap))
$(eval $(call BuildPlugin,freeradius2-mod-mschap,rlm_mschap,))
$(eval $(call BuildPlugin,freeradius2-mod-pap,rlm_pap,))
$(eval $(call BuildPlugin,freeradius2-mod-preprocess,rlm_preprocess,hints huntgroups))
$(eval $(call BuildPlugin,freeradius2-mod-realm,rlm_realm,proxy.conf))
$(eval $(call BuildPlugin,freeradius2-mod-sql,rlm_sql,sql.conf))
$(eval $(call BuildPlugin,freeradius2-mod-sql-mysql,rlm_sql_mysql,))
$(eval $(call BuildPlugin,freeradius2-mod-sql-pgsql,rlm_sql_postgresql,))
$(eval $(call BuildPlugin,freeradius2-mod-sqlcounter,rlm_sqlcounter,))
$(eval $(call BuildPlugin,freeradius2-mod-radutmp,rlm_radutmp,))
$(eval $(call BuildPackage,freeradius2-utils))
