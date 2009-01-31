#
# Copyright (C) 2006 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
# $Id$

include $(TOPDIR)/rules.mk

PKG_NAME:=net-tools
PKG_VERSION:=1.60
PKG_RELEASE:=1

PKG_MD5SUM:=888774accab40217dde927e21979c165
PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.bz2
PKG_SOURCE_URL:=http://www.tazenda.demon.co.uk/phil/net-tools/

PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)-$(PKG_VERSION)

include $(INCLUDE_DIR)/package.mk

define Package/net-tools
  SECTION:=net
  CATEGORY:=Network
  TITLE:=Original net-tools
  URL:=http://www.tazenda.demon.co.uk/phil/net-tools/
endef

define Package/net-tools/description
	The net-tools package contains usual linux commands: 
	arp, hostname, ipmaddr, iptunnel, mii-tool, nameif, netstat, plipconfig, rarp, 
	route and slattach.
endef

define Build/Compile
        $(MAKE) -C $(PKG_BUILD_DIR) \
                CC="$(TARGET_CC)" \
                COPTS="$(TARGET_CFLAGS)" 
endef

define Package/net-tools/install
	$(INSTALL_DIR) $(1)/bin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/netstat $(1)/bin/
	$(INSTALL_DIR) $(1)/sbin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/route $(1)/sbin/
	$(INSTALL_DIR) $(1)/usr/sbin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/arp $(1)/usr/sbin/
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/hostname $(1)/usr/sbin/
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/ipmaddr $(1)/usr/sbin/
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/iptunnel $(1)/usr/sbin/
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/mii-tool $(1)/usr/sbin/
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/nameif $(1)/usr/sbin/
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/plipconfig $(1)/usr/sbin/
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/rarp $(1)/usr/sbin/
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/slattach $(1)/usr/sbin/
endef

# FIXME: check if commands are really provided by busybox (busybox | grep <name>)
define Package/net-tools/postrm
#!/bin/sh
ln -sf busybox $${IPKG_INSTROOT}/bin/netstat
ln -sf ../bin/busybox $${IPKG_INSTROOT}/sbin/route
endef

$(eval $(call BuildPackage,net-tools))
