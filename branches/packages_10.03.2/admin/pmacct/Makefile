#
# Copyright (C) 2006-2011 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=pmacct
PKG_VERSION:=0.12.5
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=http://www.pmacct.net/
PKG_MD5SUM:=3d10f9301a17f034a0f221490a99a5d0

PKG_BUILD_DEPENDS:=libpcap

include $(INCLUDE_DIR)/package.mk

define Package/pmacct/Default
  SECTION:=admin
  CATEGORY:=Administration
  SUBMENU:=Pmacct suite
  URL:=http://www.pmacct.net/
endef

define Package/nfacctd/Default
  $(call Package/pmacct/Default)
  TITLE:=NetFlow accounting daemon
endef

define Package/nfacctd
  $(call Package/nfacctd/Default)
endef

define Package/nfacctd-mysql
  $(call Package/nfacctd/Default)
  TITLE+= with MySQL support
  DEPENDS+= +libmysqlclient
endef

define Package/nfacctd-pgsql
  $(call Package/nfacctd/Default)
  TITLE+= with PostreSQL support
  DEPENDS+= +libpq
endef

define Package/nfacctd-sqlite
  $(call Package/nfacctd/Default)
  TITLE+= with SQLite support
  DEPENDS+= +libsqlite3
endef

define Package/pmacctd/Default
  $(call Package/pmacct/Default)
  DEPENDS+= +libpcap
  TITLE:=IP pcap-based accounting daemon
endef

define Package/pmacctd
  $(call Package/pmacctd/Default)
endef

define Package/pmacctd-mysql
  $(call Package/pmacctd/Default)
  TITLE+= with MySQL support
  DEPENDS+= +libmysqlclient
endef

define Package/pmacctd-pgsql
  $(call Package/pmacctd/Default)
  TITLE+= with PostreSQL support
  DEPENDS+= +libpq
endef

define Package/pmacctd-sqlite
  $(call Package/pmacctd/Default)
  TITLE+= with SQLite support
  DEPENDS+= +libsqlite3
endef

define Package/uacctd/Default
  $(call Package/pmacct/Default)
  DEPENDS+= +iptables-mod-ulog
  TITLE:=ulog accounting daemon
endef

define Package/uacctd
  $(call Package/pmacctd/Default)
endef

define Package/uacctd-mysql
  $(call Package/pmacctd/Default)
  TITLE+= with MySQL support
  DEPENDS+= +libmysqlclient
endef

define Package/uacctd-pgsql
  $(call Package/pmacctd/Default)
  TITLE+= with PostreSQL support
  DEPENDS+= +libpq
endef

define Package/uacctd-sqlite
  $(call Package/pmacctd/Default)
  TITLE+= with SQLite support
  DEPENDS+= +libsqlite3
endef

define Package/pmacct-client
  $(call Package/pmacct/Default)
  TITLE:=Command-line client to gather data from the IMT plugin
endef

define Compile/Template

$(PKG_BUILD_DIR)/nfacctd$(1) $(PKG_BUILD_DIR)/pmacctd$(1) $(PKG_BUILD_DIR)/uacctd$(1): $(STAMP_CONFIGURED)
	-$(MAKE) -C $(PKG_BUILD_DIR) distclean
	$(call Build/Configure/Default, \
		--with-pcap-includes="$(STAGING_DIR)/usr/include" \
		--with-pcap-libs="$(STAGING_DIR)/usr/lib" \
		--enable-ulog \
		$(2) \
		,\
		LIBS="-lz" \
		,,\
	);
	$(MAKE) -C $(PKG_BUILD_DIR) \
		all
	mv -f $(PKG_BUILD_DIR)/src/nfacctd $(PKG_BUILD_DIR)/nfacctd$(1)
	mv -f $(PKG_BUILD_DIR)/src/pmacctd $(PKG_BUILD_DIR)/pmacctd$(1)
	mv -f $(PKG_BUILD_DIR)/src/uacctd $(PKG_BUILD_DIR)/uacctd$(1)

$(PKG_BUILD_DIR)/.built: $(PKG_BUILD_DIR)/nfacctd$(1) $(PKG_BUILD_DIR)/pmacctd$(1) $(PKG_BUILD_DIR)/uacctd$(1)

endef


define Install/Template

define Package/$(1)$(2)/conffiles
/etc/default/$(1)
/etc/$(1).conf
endef

define Package/$(1)$(2)/install
	$(INSTALL_DIR) $$(1)/usr/sbin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/$(1)$(2) $$(1)/usr/sbin/$(1)
	$(INSTALL_DIR) $$(1)/etc
	$(INSTALL_DATA) ./files/$(1).conf $$(1)/etc/
	$(INSTALL_DIR) $$(1)/etc/default
	$(INSTALL_DATA) ./files/$(1).default $$(1)/etc/default/$(1)
	$(INSTALL_DIR) $$(1)/etc/init.d
	$(INSTALL_BIN) ./files/$(1).init $$(1)/etc/init.d/$(1)
endef

endef

ifneq ($(SDK)$(CONFIG_PACKAGE_nfacctd)$(CONFIG_PACKAGE_pmacctd)$(CONFIG_PACKAGE_uacctd),)
  define Compile/pmacct/basic
    $(call Compile/Template,, \
	--disable-mysql \
	--disable-pgsql \
	--disable-sqlite3 \
    )
    $(call Install/Template,nfacctd,)
    $(call Install/Template,pmacctd,)
	$(call Install/Template,uacctd,)
  endef
endif
$(eval $(Compile/pmacct/basic))

ifneq ($(SDK)$(CONFIG_PACKAGE_nfacctd-mysql)$(CONFIG_PACKAGE_pmacctd-mysql)$(CONFIG_PACKAGE_uacctd-mysql),)
  define Compile/pmacct/mysql
    $(call Compile/Template,-mysql, \
	--enable-mysql \
	--with-mysql-includes="$(STAGING_DIR)/usr/include" \
	--with-mysql-libs="$(STAGING_DIR)/usr/lib/mysql" \
    )
    $(call Install/Template,nfacctd,-mysql)
    $(call Install/Template,pmacctd,-mysql)
	$(call Install/Template,uacctd,-mysql)
  endef
endif
$(eval $(Compile/pmacct/mysql))

ifneq ($(SDK)$(CONFIG_PACKAGE_nfacctd-pgsql)$(CONFIG_PACKAGE_pmacctd-pgsql)$(CONFIG_PACKAGE_uacctd-pgsql),)
  define Compile/pmacct/pgsql
    $(call Compile/Template,-pgsql, \
	--enable-pgsql \
	--with-pgsql-includes="$(STAGING_DIR)/usr/include" \
	--with-pgsql-libs="$(STAGING_DIR)/usr/lib" \
    )
    $(call Install/Template,nfacctd,-pgsql)
    $(call Install/Template,pmacctd,-pgsql)
	$(call Install/Template,uacctd,-pgsql)
  endef
endif
$(eval $(Compile/pmacct/pgsql))

ifneq ($(SDK)$(CONFIG_PACKAGE_nfacctd-sqlite)$(CONFIG_PACKAGE_pmacctd-sqlite)$(CONFIG_PACKAGE_uacctd-sqlite),)
  define Compile/pmacct/sqlite
    $(call Compile/Template,-sqlite, \
	--enable-sqlite3 \
	--with-sqlite3-includes="$(STAGING_DIR)/usr/include" \
	--with-sqlite3-libs="$(STAGING_DIR)/usr/lib" \
    )
    $(call Install/Template,nfacctd,-sqlite)
    $(call Install/Template,pmacctd,-sqlite)
	$(call Install/Template,uacctd,-sqlite)
  endef
endif
$(eval $(Compile/pmacct/sqlite))

define Build/Configure
endef

define Build/Compile
endef

define Package/pmacct-client/install
	$(INSTALL_DIR) $(1)/usr/sbin
	$(CP) $(PKG_BUILD_DIR)/src/pmacct $(1)/usr/sbin/
endef

$(eval $(call BuildPackage,nfacctd))
$(eval $(call BuildPackage,nfacctd-mysql))
$(eval $(call BuildPackage,nfacctd-pgsql))
$(eval $(call BuildPackage,nfacctd-sqlite))
$(eval $(call BuildPackage,pmacctd))
$(eval $(call BuildPackage,pmacctd-mysql))
$(eval $(call BuildPackage,pmacctd-pgsql))
$(eval $(call BuildPackage,pmacctd-sqlite))
$(eval $(call BuildPackage,pmacct-client))
$(eval $(call BuildPackage,uacctd))
$(eval $(call BuildPackage,uacctd-mysql))
$(eval $(call BuildPackage,uacctd-pgsql))
$(eval $(call BuildPackage,uacctd-sqlite))

