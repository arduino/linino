#
# Copyright (C) 2006-2009 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=zabbix
PKG_VERSION:=1.6
PKG_RELEASE:=2
PKG_MD5SUM:=39d4c871439b1b4f0429964b4abbfc45

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=@SF/zabbix

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

define Package/zabbix-agent/postinst
#!/bin/sh

name=zabbix
id=53

# do not change below
# check if we are on real system
if [ -z "$${IPKG_INSTROOT}" ]; then
	# create copies of passwd and group, if we use squashfs
	rootfs=`mount |awk '/root/ { print $$5 }'`
	if [ "$$rootfs" = "squashfs" ]; then
		if [ -h /etc/group ]; then
			rm /etc/group
			cp /rom/etc/group /etc/group
		fi
		if [ -h /etc/passwd ]; then
			rm /etc/passwd
			cp /rom/etc/passwd /etc/passwd
		fi
	fi
fi

echo ""
if [ -z "$$(grep ^\\$${name}: $${IPKG_INSTROOT}/etc/group)" ]; then
	echo "adding group $$name to /etc/group"
	echo "$${name}:x:$${id}:" >> $${IPKG_INSTROOT}/etc/group
fi

if [ -z "$$(grep ^\\$${name}: $${IPKG_INSTROOT}/etc/passwd)" ]; then
	echo "adding user $$name to /etc/passwd"
	echo "$${name}:x:$${id}:$${id}:$${name}:/tmp/.$${name}:/bin/false" >> $${IPKG_INSTROOT}/etc/passwd
fi

chown $${name} $${IPKG_INSTROOT}/etc/zabbix/zabbix_agentd.conf

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
