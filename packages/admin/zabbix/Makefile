# 
# Copyright (C) 2006 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
# $Id$

include $(TOPDIR)/rules.mk

PKG_NAME:=zabbix
PKG_VERSION:=1.3.2
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=http://kent.dl.sourceforge.net/sourceforge/zabbix/
PKG_CAT:=zcat

PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)-$(PKG_VERSION)
PKG_INSTALL_DIR:=$(PKG_BUILD_DIR)/ipkg-install

PKG_BUILD_DEPENDS:=libsqlite3

include $(INCLUDE_DIR)/package.mk

define Package/zabbix/Default
  SECTION:=admin
  CATEGORY:=Administration
  TITLE:=Zabbix
  DESCRIPTION:=\
	ZABBIX is an enterprise-class distributed monitoring solution for networks \\\
	and applications. Native high-performance ZABBIX agents allow monitoring of \\\
	performance and availability data of all operating systems.
  URL:=http://www.zabbix.com/
  SUBMENU:=zabbix
endef

define Package/zabbix-agent
  $(call Package/zabbix/Default)
  TITLE+= agent
endef

define Package/zabbix-sender
  $(call Package/zabbix/Default)
  TITLE+= sender
endef

define Package/zabbix-server
  $(call Package/zabbix/Default)
  TITLE+= server
  DEPENDS:=+libsqlite3
endef

PKG_CONFIGURE_OPTIONS:= \
	--bindir="/usr/sbin" \
	--enable-agent

ifneq ($(CONFIG_PACKAGE_zabbix-server),)
PKG_CONFIGURE_OPTIONS+= \
	--enable-server \
	--with-sqlite3="$(STAGING_DIR)/usr"
endif

define Build/Configure
	$(call Build/Configure/Default, \
		$(PKG_CONFIGURE_OPTIONS) \
	)
endef

define Build/Compile
	$(MAKE) -C $(PKG_BUILD_DIR) \
		DESTDIR="$(PKG_INSTALL_DIR)" \
		all install
endef

define Package/zabbix-agent/conffiles
/etc/zabbix/zabbix_agentd.conf
endef

define Package/zabbix-agent/install
	$(INSTALL_DIR) $(1)/usr/sbin
	$(CP) $(PKG_INSTALL_DIR)/usr/sbin/zabbix_agentd $(1)/usr/sbin/
	$(INSTALL_DIR) $(1)/etc/zabbix
	$(INSTALL_CONF) $(PKG_BUILD_DIR)/misc/conf/zabbix_agentd.conf $(1)/etc/zabbix/
endef

define Package/zabbix-sender/install
	$(INSTALL_DIR) $(1)/usr/sbin
	$(CP) $(PKG_INSTALL_DIR)/usr/sbin/zabbix_sender $(1)/usr/sbin/
	$(INSTALL_DIR) $(1)/etc/zabbix
endef

define Package/zabbix-server/conffiles
/etc/zabbix/zabbix_server.conf
endef

define Package/zabbix-server/install
	$(INSTALL_DIR) $(1)/usr/sbin
	$(CP) $(PKG_INSTALL_DIR)/usr/sbin/zabbix_server $(1)/usr/sbin/
	$(INSTALL_DIR) $(1)/etc/zabbix
	$(INSTALL_CONF) $(PKG_BUILD_DIR)/misc/conf/zabbix_server.conf $(1)/etc/zabbix/
endef

$(eval $(call BuildPackage,zabbix-agent))
$(eval $(call BuildPackage,zabbix-sender))
$(eval $(call BuildPackage,zabbix-server))
