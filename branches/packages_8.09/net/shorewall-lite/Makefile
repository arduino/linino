# 
# Copyright (C) 2008 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
# $Id$

include $(TOPDIR)/rules.mk

PKG_NAME:=shorewall-lite
PKG_VERSION:=4.0.12
PKG_RELEASE:=1

PKG_SOURCE_URL:=http://www.shorewall.net/pub/shorewall/4.0/shorewall-$(PKG_VERSION)/ \
	http://www1.shorewall.net/pub/shorewall/4.0/shorewall-$(PKG_VERSION)/ \
	http://slovakia.shorewall.net/pub/shorewall/4.0/shorewall-$(PKG_VERSION)/ \
	http://shorewall.de/pub/shorewall/4.0/shorewall-$(PKG_VERSION)/ \
	http://www.shorewall.com.au/4.0/shorewall-$(PKG_VERSION)/ \
	http://shorewall.infohiiway.com/pub/shorewall/4.0/shorewall-$(PKG_VERSION)/ \
	http://www.shorewall.com.ar/pub/shorewall/shorewall/4.0/shorewall-$(PKG_VERSION)/
PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.bz2
PKG_MD5SUM:=ab82b03f987f69536d305db40dc7692c

include $(INCLUDE_DIR)/package.mk

define Package/shorewall-lite
  SECTION:=net
  CATEGORY:=Network
  DEPENDS:=+ip +iptables +iptables-utils
  TITLE:=Shorewall Lite
  URL:=http://www.shorewall.net/
  SUBMENU:=firewall
endef

define Package/shorewall-lite/description
	Shoreline Firewall Lite is an iptables-based firewall for Linux systems.
endef

define Package/shorewall-lite/conffiles
/etc/shorewall-lite/shorewall-lite.conf
/etc/shorewall-lite/vardir
endef

define Build/Compile
	rm -rf $(PKG_INSTALL_DIR)
	mkdir -p $(PKG_INSTALL_DIR)
	PREFIX=$(PKG_INSTALL_DIR) $(PKG_BUILD_DIR)/install.sh
endef

define Package/shorewall-lite/install
	$(INSTALL_DIR) $(1)/sbin
	$(INSTALL_DIR) $(1)/etc/init.d
	$(INSTALL_DIR) $(1)/etc/shorewall-lite
	$(INSTALL_DIR) $(1)/usr/share
	$(INSTALL_BIN) ./files/shorewall-lite.init $(1)/etc/init.d/shorewall-lite
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/sbin/shorewall-lite $(1)/sbin
	$(CP) $(PKG_INSTALL_DIR)/usr/share/shorewall-lite $(1)/usr/share
	$(INSTALL_BIN) ./files/hostname $(1)/usr/share/shorewall-lite
	$(CP) $(PKG_INSTALL_DIR)/etc/shorewall-lite $(1)/etc
	$(CP) ./files/vardir $(1)/etc/shorewall-lite
endef

$(eval $(call BuildPackage,shorewall-lite))
