# 
# Copyright (C) 2006 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
# $Id: Makefile 7845 2007-07-01 23:09:45Z florian $

include $(TOPDIR)/rules.mk

PKG_NAME:=shorewall-shell
PKG_VERSION:=4.2.4
PKG_RELEASE:=1

PKG_SOURCE_URL:=http://www1.shorewall.net/pub/shorewall/4.2/shorewall-$(PKG_VERSION)/
PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.bz2
PKG_MD5SUM:=95a645963e541aef5a39c707f67874b5

include $(INCLUDE_DIR)/package.mk

define Package/shorewall-shell
  SECTION:=net
  CATEGORY:=Network
  DEPENDS:=+iptables +iptables-mod-extra +ip
  TITLE:=Shorewall Shell
  URL:=http://www.shorewall.net/
  SUBMENU:=firewall
endef

define Package/shorewall-shell/description
	Shoreline Firewall shell-based compiler.
endef

define Build/Compile
	rm -rf $(PKG_INSTALL_DIR)
	mkdir -p $(PKG_INSTALL_DIR)
	PREFIX=$(PKG_INSTALL_DIR) $(PKG_BUILD_DIR)/install.sh
endef

define Package/shorewall-shell/install
	$(INSTALL_DIR) $(1)/usr/share
	$(CP) $(PKG_INSTALL_DIR)/usr/share/shorewall-shell $(1)/usr/share
endef

$(eval $(call BuildPackage,shorewall-shell))
