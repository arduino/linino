# 
# Copyright (C) 2006 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
# $Id$

include $(TOPDIR)/rules.mk

PKG_NAME:=shorewall
PKG_VERSION:=3.4.3
PKG_RELEASE:=1
PKG_MD5SUM:=4ac779d02d4befc72a0ce1534fbb328d

PKG_SOURCE_URL:=http://www1.shorewall.net/pub/$(PKG_NAME)/3.4/$(PKG_NAME)-$(PKG_VERSION)/
PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tgz
PKG_CAT:=zcat

PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)-$(PKG_VERSION)
PKG_INSTALL_DIR:=$(PKG_BUILD_DIR)/ipkg-install

include $(INCLUDE_DIR)/package.mk

define Package/shorewall
  SECTION:=net
  CATEGORY:=Network
  DEPENDS:=+iptables
  TITLE:=Shorewall firewall
  DESCRIPTION:=\
	Shorewall Firewall is an iptables-based firewall for Linux.
  URL:=http://www.shorewall.net/
endef


define Build/Compile
	rm -rf $(PKG_INSTALL_DIR)
	mkdir -p $(PKG_INSTALL_DIR)
	PREFIX=$(PKG_INSTALL_DIR) $(PKG_BUILD_DIR)/install.sh
endef

define Package/shorewall/install
	$(INSTALL_DIR) $(1)/sbin
	$(INSTALL_DIR) $(1)/etc/init.d
	$(INSTALL_DIR) $(1)/usr/share
	$(INSTALL_BIN) ./files/shorewall.init $(1)/etc/init.d/shorewall
	$(CP) $(PKG_INSTALL_DIR)/sbin/shorewall $(1)/sbin
	$(CP) $(PKG_INSTALL_DIR)/usr/share/shorewall $(1)/usr/share
	$(CP) $(PKG_INSTALL_DIR)/etc/shorewall $(1)/etc
endef

$(eval $(call BuildPackage,shorewall))
