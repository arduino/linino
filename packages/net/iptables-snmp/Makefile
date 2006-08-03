# Copyright (C) 2006 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
# $Id$

include $(TOPDIR)/rules.mk

PKG_NAME:=iptables-snmp
PKG_VERSION:=0.1
PKG_RELEASE:=1
PKG_MD5SUM:=8370d2f0c899461a053da491400119d1

PKG_SOURCE_URL:=http://www.nobiscuit.com/iptables-snmp
PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_CAT:=zcat

PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)-$(PKG_VERSION)
PKG_INSTALL_DIR:=$(PKG_BUILD_DIR)/ipkg-install

include $(INCLUDE_DIR)/package.mk

define Package/iptables-snmp
  SECTION:=net
  CATEGORY:=Network
  DEPENDS:=+snmpd
  TITLE:=An snmpd plugin to access iptables rules
  DESCRIPTION:=This is a plugin that makes iptables rules accessable from snmpd.
  URL:=http://www.nobiscuit.com/iptables-snmp/
endef

define Build/Configure
$(call Build/Configure/Default)
endef

define Build/Compile	
	rm -rf $(PKG_INSTALL_DIR)
	mkdir -p $(PKG_INSTALL_DIR)
	$(MAKE) -C $(PKG_BUILD_DIR) \
		INSTALL_PREFIX="$(PKG_INSTALL_DIR)" \
		all install
endef
 
define Package/iptables-snmp/install	
	install -d -m0755 $(1)/usr/lib
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/iptables-snmp.so $(1)/usr/lib
endef 

$(eval $(call BuildPackage,iptables-snmp))
