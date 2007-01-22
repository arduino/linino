#
# Copyright (C) 2006 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
# $Id$

include $(TOPDIR)/rules.mk

PKG_NAME:=pmacct
PKG_VERSION:=0.10.3
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=http://www.ba.cnr.it/~paolo/pmacct/
PKG_MD5SUM:=0be1ffd9d4bda73575caa3240abbf4cb
PKG_CAT:=zcat

PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)-$(PKG_VERSION)

PKG_BUILDDEP:=libpcap

include $(INCLUDE_DIR)/package.mk

define Package/pmacct/Default
  SECTION:=net
  CATEGORY:=Network
  SUBMENU:=pmacct (accounting and aggregation tools)
  URL:=http://www.ba.cnr.it/~paolo/pmacct/
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

define Package/sfacctd/Default
  $(call Package/pmacct/Default)
  TITLE:=sFlow accounting daemon
endef

define Package/pmacct-client
  $(call Package/pmacct/Default)
  TITLE:=Command-line client to gather data from the IMT plugin
endef

ifneq ($(SDK),)
  CONFIG_PACKAGE_nfacctd:=m
  CONFIG_PACKAGE_nfacctd-mysql:=m
  CONFIG_PACKAGE_nfacctd-pgsql:=m
  CONFIG_PACKAGE_nfacctd-sqlite:=m
  CONFIG_PACKAGE_pmacctd:=m
  CONFIG_PACKAGE_pmacctd-mysql:=m
  CONFIG_PACKAGE_pmacctd-pgsql:=m
  CONFIG_PACKAGE_pmacctd-sqlite:=m
endif

define Compile/Template

$(PKG_BUILD_DIR)/nfacctd-$(1) $(PKG_BUILD_DIR)/pmacctd-$(1): $(PKG_BUILD_DIR)/.configured
	-$(MAKE) -C $(PKG_BUILD_DIR) distclean
	$(call Build/Configure/Default, \
		--with-pcap-includes="$(STAGING_DIR)/usr/include" \
		--with-pcap-libs="$(STAGING_DIR)/usr/lib" \
		$(2) \
		,\
		LIBS="-lz" \
		,
	);
	$(MAKE) -C $(PKG_BUILD_DIR) \
		CFLAGS="$(TARGET_CFLAGS) -I$(STAGING_DIR)/usr/include -I$(STAGING_DIR)/include" \
		all
	mv -f $(PKG_BUILD_DIR)/src/nfacctd $(PKG_BUILD_DIR)/nfacctd-$(1)
	mv -f $(PKG_BUILD_DIR)/src/pmacctd $(PKG_BUILD_DIR)/pmacctd-$(1)

ifneq ($(CONFIG_PACKAGE_nfacctd$(3))$(CONFIG_PACKAGE_pmacctd$(3)),)
  $(PKG_BUILD_DIR)/.built: $(PKG_BUILD_DIR)/nfacctd-$(1) $(PKG_BUILD_DIR)/pmacctd-$(1)
endif

endef


define Install/Template

define Package/$(1)/conffiles
/etc/default/$(3)
/etc/$(3).conf
endef

define Package/$(1)/install
	$(INSTALL_DIR) $$(1)/usr/sbin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/$(2) $$(1)/usr/sbin/$(3)
	$(INSTALL_DIR) $$(1)/etc
	$(INSTALL_DATA) ./files/$(3).conf $$(1)/etc/
	$(INSTALL_DIR) $$(1)/etc/default
	$(INSTALL_DATA) ./files/$(3).default $$(1)/etc/default/$(3)
	$(INSTALL_DIR) $$(1)/etc/init.d
	$(INSTALL_BIN) ./files/$(3).init $$(1)/etc/init.d/$(3)
endef

endef


$(eval $(call Compile/Template,basic,,))
$(eval $(call Install/Template,nfacctd,nfacctd-basic,nfacctd))
$(eval $(call Install/Template,pmacctd,pmacctd-basic,pmacctd))

$(eval $(call Compile/Template,mysql, \
	--enable-mysql \
	--with-mysql-includes="$(STAGING_DIR)/usr/include" \
	--with-mysql-libs="$(STAGING_DIR)/usr/lib/mysql" \
,-mysql))
$(eval $(call Install/Template,nfacctd-mysql,nfacctd-mysql,nfacctd))
$(eval $(call Install/Template,pmacctd-mysql,pmacctd-mysql,pmacctd))

$(eval $(call Compile/Template,pgsql, \
	--enable-pgsql \
	--with-pgsql-includes="$(STAGING_DIR)/usr/include" \
	--with-pgsql-libs="$(STAGING_DIR)/usr/lib" \
,-pgsql))

$(eval $(call Install/Template,nfacctd-pgsql,nfacctd-pgsql,nfacctd))
$(eval $(call Install/Template,pmacctd-pgsql,pmacctd-pgsql,pmacctd))

$(eval $(call Compile/Template,sqlite, \
	--enable-sqlite3 \
	--with-sqlite3-includes="$(STAGING_DIR)/usr/include" \
	--with-sqlite3-libs="$(STAGING_DIR)/usr/lib" \
,-sqlite))
$(eval $(call Install/Template,nfacctd-sqlite,nfacctd-sqlite,nfacctd))
$(eval $(call Install/Template,pmacctd-sqlite,pmacctd-sqlite,pmacctd))

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
