# 
# Copyright (C) 2006 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
# $Id: Makefile 7845 2007-07-01 23:09:45Z florian $

include $(TOPDIR)/rules.mk

PKG_NAME:=shorewall-common
PKG_VERSION:=4.2.4
PKG_RELEASE:=1

PKG_SOURCE_URL:=http://www.shorewall.net/pub/shorewall/4.2/shorewall-$(PKG_VERSION)/
PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.bz2
PKG_MD5SUM:=888130a12280f7bf9022009153ac63cd

include $(INCLUDE_DIR)/package.mk

define Package/shorewall-common
  SECTION:=net
  CATEGORY:=Network
  DEPENDS:=+shorewall-shell
  TITLE:=Shorewall
  URL:=http://www.shorewall.net/
  SUBMENU:=firewall
endef

define Package/shorewall-common/description
	Shorewall Firewall is an iptables-based firewall for Linux.
endef

define Build/Compile
	rm -rf $(PKG_INSTALL_DIR)
	mkdir -p $(PKG_INSTALL_DIR)
	PREFIX=$(PKG_INSTALL_DIR) $(PKG_BUILD_DIR)/install.sh
endef

define Package/shorewall-common/install
	$(INSTALL_DIR) $(1)/sbin
	$(INSTALL_DIR) $(1)/etc/init.d
	$(INSTALL_DIR) $(1)/usr/share
	$(INSTALL_DIR) $(1)/bin
	$(INSTALL_BIN) ./files/shorewall.init $(1)/etc/init.d/shorewall
	$(INSTALL_BIN) ./files/hostname $(1)/bin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/sbin/shorewall $(1)/sbin
	$(CP) $(PKG_INSTALL_DIR)/usr/share/shorewall $(1)/usr/share
	$(CP) $(PKG_INSTALL_DIR)/etc/shorewall $(1)/etc
endef

$(eval $(call BuildPackage,shorewall-common))
