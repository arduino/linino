#
# Copyright (C) 2006-2011 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=zabbix
PKG_VERSION:=1.6
PKG_RELEASE:=3

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=@SF/zabbix
PKG_MD5SUM:=39d4c871439b1b4f0429964b4abbfc45

PKG_BUILD_DEPENDS:=libsqlite3
PKG_INSTALL:=1

include $(INCLUDE_DIR)/package.mk

define Package/zabbix/Default
  SECTION:=admin
  CATEGORY:=Administration
  TITLE:=Zabbix
  URL:=http://www.zabbix.com/
  SUBMENU:=zabbix
  DEPENDS:=+libcurl
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
  DEPENDS += +libsqlite3
endef


ifneq ($(SDK),)
CONFIG_PACKAGE_zabbix-server:=m
endif

CONFIGURE_ARGS+= \
	--bindir="/usr/sbin" \
	--enable-agent

ifneq ($(CONFIG_PACKAGE_zabbix-server),)
  CONFIGURE_ARGS+= \
	--enable-server \
	--with-sqlite3="$(STAGING_DIR)/usr"
endif

MAKE_FLAGS += ARCH="linux"

define Package/zabbix-agent/conffiles
/etc/zabbix/zabbix_agentd.conf
endef

define Package/zabbix-agent/install
	$(INSTALL_DIR) $(1)/usr/sbin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/usr/sbin/zabbix_agentd $(1)/usr/sbin/
	$(INSTALL_DIR) $(1)/etc/zabbix
	$(INSTALL_CONF) ./files/zabbix_agentd.conf $(1)/etc/zabbix/
	$(INSTALL_DIR) $(1)/etc/init.d
	$(INSTALL_BIN) ./files/zabbix_agentd.init $(1)/etc/init.d/zabbix_agentd
endef

define Package/zabbix-sender/install
	$(INSTALL_DIR) $(1)/usr/sbin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/usr/sbin/zabbix_sender $(1)/usr/sbin/
	$(INSTALL_DIR) $(1)/etc/zabbix
endef

define Package/zabbix-server/conffiles
/etc/zabbix/zabbix_server.conf
endef

define Package/zabbix-server/install
	$(INSTALL_DIR) $(1)/usr/sbin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/usr/sbin/zabbix_server $(1)/usr/sbin/
	$(INSTALL_DIR) $(1)/etc/zabbix
	$(INSTALL_CONF) $(PKG_BUILD_DIR)/misc/conf/zabbix_server.conf $(1)/etc/zabbix/
endef

$(eval $(call BuildPackage,zabbix-agent))
$(eval $(call BuildPackage,zabbix-sender))
$(eval $(call BuildPackage,zabbix-server))
