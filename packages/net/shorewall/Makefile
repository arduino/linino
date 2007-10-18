# 
# Copyright (C) 2007 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
# $Id$

include $(TOPDIR)/rules.mk

PKG_NAME:=shorewall
PKG_VERSION:=3.4.6
PKG_RELEASE:=2

PKG_SOURCE_URL:=http://www1.shorewall.net/pub/$(PKG_NAME)/3.4/$(PKG_NAME)-$(PKG_VERSION)/
PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tgz
PKG_MD5SUM:=ec6a8bd3d6d0468b6302a7725851c39b

include $(INCLUDE_DIR)/package.mk

define Package/shorewall
  SECTION:=net
  CATEGORY:=Network
  DEPENDS:=+iptables
  TITLE:=Shorewall firewall
  URL:=http://www.shorewall.net/
  SUBMENU:=firewall
endef

define define Package/shorewall/description
 Shorewall Firewall is an iptables-based firewall for Linux.
endef

define Build/Compile
	rm -rf $(PKG_INSTALL_DIR)
	mkdir -p $(PKG_INSTALL_DIR)
	PREFIX=$(PKG_INSTALL_DIR) $(PKG_BUILD_DIR)/install.sh
endef

define Package/shorewall/install
	$(INSTALL_DIR) $(1)/sbin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/sbin/$(PKG_NAME) $(1)/sbin
	$(INSTALL_DIR) $(1)/etc/init.d
	$(INSTALL_BIN) ./files/$(PKG_NAME).init $(1)/etc/init.d/$(PKG_NAME)
	$(INSTALL_DIR) $(1)/usr/share
	$(CP) $(PKG_INSTALL_DIR)/usr/share/shorewall $(1)/usr/share
	$(CP) $(PKG_INSTALL_DIR)/etc/shorewall $(1)/etc
endef

$(eval $(call BuildPackage,shorewall))
