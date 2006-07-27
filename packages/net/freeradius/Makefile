# 
# Copyright (C) 2006 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
# $Id$

include $(TOPDIR)/rules.mk

PKG_NAME:=freeradius
PKG_VERSION:=1.1.1
PKG_RELEASE:=1

PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)-$(PKG_VERSION)
PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=ftp://ftp.freeradius.org/pub/radius/ \
	http://freeradius.portal-to-web.de/ \
	ftp://ftp.uk.freeradius.org/pub/radius/
PKG_MD5SUM:=b38b24f6352090fdb571b9e8da52e12e
PKG_CAT:=zcat

PKG_INSTALL_DIR:=$(PKG_BUILD_DIR)/ipkg-install

include $(INCLUDE_DIR)/package.mk

define Package/freeradius
  SECTION:=net
  CATEGORY:=Network
  DEPENDS:=+libltdl +libopenssl +libpthread
  TITLE:=A flexible RADIUS server
  URL:=http://www.freeradius.org/
endef

define Package/freeradius/conffiles
/etc/freeradius/clients.conf
/etc/freeradius/radiusd.conf
endef

define Package/freeradius-democerts
  $(call Package/freeradius)
  DEPENDS:=freeradius
  TITLE:=Demo certificates to test the server
endef

define Package/freeradius-mod-chap
  $(call Package/freeradius)
  DEPENDS:=freeradius
  TITLE:=CHAP module
endef

define Package/freeradius-mod-detail
  $(call Package/freeradius)
  DEPENDS:=freeradius
  TITLE:=Detailed accounting module
endef

define Package/freeradius-mod-eap
  $(call Package/freeradius)
  DEPENDS:=freeradius
  TITLE:=Base EAP module
endef

define Package/freeradius-mod-eap/conffiles
/etc/freeradius/eap.conf
endef

define Package/freeradius-mod-eap-gtc
  $(call Package/freeradius)
  DEPENDS:=freeradius-mod-eap
  TITLE:=EAP/GTC module
endef

define Package/freeradius-mod-eap-md5
  $(call Package/freeradius)
  DEPENDS:=freeradius-mod-eap
  TITLE:=EAP/MD5 module
endef

define Package/freeradius-mod-eap-mschapv2
  $(call Package/freeradius)
  DEPENDS:=freeradius-mod-eap
  TITLE:=EAP/MS-CHAPv2 module
endef

define Package/freeradius-mod-eap-peap
  $(call Package/freeradius)
  DEPENDS:=freeradius-mod-eap
  TITLE:=EAP/PEAP module
endef

define Package/freeradius-mod-eap-tls
  $(call Package/freeradius)
  DEPENDS:=freeradius-mod-eap
  TITLE:=EAP/TLS module
endef

define Package/freeradius-mod-eap-ttls
  $(call Package/freeradius)
  DEPENDS:=freeradius-mod-eap-tls
  TITLE:=EAP/TTLS module
endef

define Package/freeradius-mod-files
  $(call Package/freeradius)
  DEPENDS:=freeradius
  TITLE:=Module using local files for authorization
endef

define Package/freeradius-mod-files/conffiles
/etc/freeradius/acct_users
/etc/freeradius/preproxy_users
/etc/freeradius/users
endef

define Package/freeradius-mod-ldap
  $(call Package/freeradius)
  DEPENDS:=freeradius +libopenldap
  TITLE:=LDAP module
endef

define Package/freeradius-mod-ldap/conffiles
/etc/freeradius/ldap.attrmap
endef

define Package/freeradius-mod-mschap
  $(call Package/freeradius)
  DEPENDS:=freeradius
  TITLE:=MS-CHAP and MS-CHAPv2 module
endef

define Package/freeradius-mod-pap
  $(call Package/freeradius)
  DEPENDS:=freeradius
  TITLE:=PAP module
endef

define Package/freeradius-mod-preprocess
  $(call Package/freeradius)
  DEPENDS:=freeradius
  TITLE:=Request pre-processing module
endef

define Package/freeradius-mod-preprocess/conffiles
/etc/freeradius/hints
/etc/freeradius/huntgroups
endef

define Package/freeradius-mod-realm
  $(call Package/freeradius)
  DEPENDS:=freeradius
  TITLE:=Realms handling module
endef

define Package/freeradius-mod-realm/conffiles
/etc/freeradius/proxy.conf
endef

define Package/freeradius-mod-sql
  $(call Package/freeradius)
  DEPENDS:=freeradius
  TITLE:=Base SQL module
endef

define Package/freeradius-mod-sql-mysql
  $(call Package/freeradius)
  DEPENDS:=freeradius-mod-sql +libmysqlclient
  TITLE:=MySQL module
endef

define Package/freeradius-mod-sql-pgsql
  $(call Package/freeradius)
  DEPENDS:=freeradius-mod-sql +libpq
  TITLE:=PostgreSQL module
endef

define Package/freeradius-mod-sqlcounter
  $(call Package/freeradius)
  DEPENDS:=freeradius-mod-sql
  TITLE:=Generic SQL Counter module
endef

define Package/freeradius-utils
  $(call Package/freeradius)
  DEPENDS:=freeradius
  TITLE:=Misc. client utilities
endef

PKG_CONFIGURE_OPTIONS := \
	--enable-shared \
	--disable-static \
	--disable-ltdl-install \
	--with-ltdl-include="$(STAGING_DIR)/usr/include" \
	--with-ltdl-lib="$(STAGING_DIR)/usr/lib" \
	--with-openssl-includes="$(STAGING_DIR)/usr/include" \
	--with-openssl-libraries="$(STAGING_DIR)/usr/lib" \
	--enable-strict-dependencies \
	--with-raddbdir=/etc/freeradius \
	--without-edir \
	--without-snmp \
	--with-experimental-modules \
	--without-rlm_attr-rewrite \
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
	--without-rlm_radutmp \
	--without-rlm_smb \
	--with-rlm_sql \
	--with-rlm_sqlcounter \
	--without-rlm_sql_db2 \
	--without-rlm_sql_freetds \
	--without-rlm_sql_iodbc \
	--without-rlm_sql_oracle \
	--without-rlm_sql_sybase \
	--without-rlm_sql_unixodbc \
	--without-rlm_sql_log \
	--without-rlm_unix \

ifeq ($(SDK),)
  ifneq ($(CONFIG_PACKAGE_freeradius-mod-ldap),)
    PKG_CONFIGURE_LIBS += -lcrypto -lssl
    PKG_CONFIGURE_OPTIONS += \
		--with-rlm_ldap-include-dir="$(STAGING_DIR)/usr/include" \
		--with-rlm_ldap-lib-dir="$(STAGING_DIR)/usr/lib"
  else
    PKG_CONFIGURE_OPTIONS += --without-rlm_ldap
  endif
  ifneq ($(CONFIG_PACKAGE_freeradius-mod-sql-mysql),)
    PKG_CONFIGURE_LIBS += -lz
    PKG_CONFIGURE_OPTIONS += \
		--with-mysql-include-dir="$(STAGING_DIR)/usr/include" \
		--with-mysql-lib-dir="$(STAGING_DIR)/usr/lib/mysql" \
		--without-threads
  else
    PKG_CONFIGURE_OPTIONS += --without-rlm_sql_mysql
  endif
  ifneq ($(CONFIG_PACKAGE_freeradius-mod-sql-pgsql),)
    PKG_CONFIGURE_OPTIONS += \
		--with-rlm_sql_postgresql-include-dir="$(STAGING_DIR)/usr/include" \
		--with-rlm_sql_postgresql-lib-dir="$(STAGING_DIR)/usr/lib"
  else
    PKG_CONFIGURE_OPTIONS += --without-rlm_sql_postgresql
  endif
else
  PKG_CONFIGURE_LIBS += -lcrypto -lssl -lz
  PKG_CONFIGURE_OPTIONS += \
		--with-rlm_ldap-include-dir="$(STAGING_DIR)/usr/include" \
		--with-rlm_ldap-lib-dir="$(STAGING_DIR)/usr/lib" \
		--with-mysql-include-dir="$(STAGING_DIR)/usr/include" \
		--with-mysql-lib-dir="$(STAGING_DIR)/usr/lib/mysql" \
		--without-threads \
		--with-rlm_sql_postgresql-include-dir="$(STAGING_DIR)/usr/include" \
		--with-rlm_sql_postgresql-lib-dir="$(STAGING_DIR)/usr/lib"
endif

define Build/Configure
	(cd $(PKG_BUILD_DIR); rm -f config.cache; \
		$(TARGET_CONFIGURE_OPTS) \
		CFLAGS="$(TARGET_CFLAGS)" \
		CPPFLAGS="-I$(STAGING_DIR)/usr/include -I$(STAGING_DIR)/include" \
		LDFLAGS="-L$(STAGING_DIR)/usr/lib -L$(STAGING_DIR)/lib -L$(PKG_INSTALL_DIR)/usr/lib/freeradius" \
		LIBS="$(PKG_CONFIGURE_LIBS)" \
		sys_lib_search_path_spec="$(STAGING_DIR)/usr/lib $(STAGING_DIR)/lib" \
		MYSQL_CONFIG="no" \
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
			--libdir=/usr/lib/freeradius \
			--libexecdir=/usr/lib/freeradius \
			--localstatedir=/var \
			--mandir=/usr/share/man \
			--sbindir=/usr/sbin \
			--sysconfdir=/etc \
			$(DISABLE_LARGEFILE) \
			$(DISABLE_NLS) \
			$(PKG_CONFIGURE_OPTIONS) \
	);
endef

define Build/Compile
	rm -rf $(PKG_INSTALL_DIR)
	mkdir -p $(PKG_INSTALL_DIR)
	$(MAKE) -C $(PKG_BUILD_DIR) \
		R="$(PKG_INSTALL_DIR)" \
		INSTALLSTRIP="" \
		all install
endef

define Package/freeradius/install
	install -m0755 -d $(1)/etc/init.d
	install -m0755 ./files/radiusd.init $(1)/etc/init.d/radiusd
	install -m0755 -d $(1)/etc/freeradius
	for f in clients.conf dictionary radiusd.conf; do \
		$(CP) $(PKG_INSTALL_DIR)/etc/freeradius/$$$${f} $(1)/etc/freeradius/ ; \
	done
	install -m0755 -d $(1)/usr/share/freeradius
	$(CP) $(PKG_INSTALL_DIR)/usr/share/freeradius/dictionary $(1)/usr/share/freeradius/
	for f in freeradius freeradius.internal rfc2865 rfc2866 rfc2867 rfc2868 rfc2869 rfc3162 rfc3576 rfc3580 microsoft wispr; do \
		$(CP) $(PKG_INSTALL_DIR)/usr/share/freeradius/dictionary.$$$${f} $(1)/usr/share/freeradius/ ; \
	done
	install -m0755 -d $(1)/usr/lib/freeradius
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/freeradius/libradius{,-*}.so $(1)/usr/lib/freeradius/
	install -m0755 -d $(1)/usr/sbin
	$(CP) $(PKG_INSTALL_DIR)/usr/sbin/radiusd $(1)/usr/sbin/
endef

define Package/freeradius-democerts/install
	install -m0755 -d $(1)/etc/freeradius
	$(CP) $(PKG_INSTALL_DIR)/etc/freeradius/certs $(1)/etc/freeradius/
	rm -rf $(1)/etc/freeradius/certs/README
	rm -rf $(1)/etc/freeradius/certs/new*
	rm -rf $(1)/etc/freeradius/certs/demoCA/index*
	rm -rf $(1)/etc/freeradius/certs/demoCA/serial*
endef

define Package/freeradius-utils/install
	install -m0755 -d $(1)/usr/bin
	for f in radclient; do \
		$(CP) $(PKG_INSTALL_DIR)/usr/bin/$$$${f} $(1)/usr/bin/ ; \
	done
endef

define BuildPlugin
  define Package/$(1)/install
	[ -z "$(2)" ] || install -d -m0755 $$(1)/usr/lib/freeradius
	for m in $(2); do \
		$(CP) $(PKG_INSTALL_DIR)/usr/lib/freeradius/$$$$$$$${m}{,-*}.so $$(1)/usr/lib/freeradius/ ; \
	done
	[ -z "$(3)" ] || install -d -m0755 $$(1)/etc/freeradius
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
$(eval $(call BuildPackage,freeradius-utils))
