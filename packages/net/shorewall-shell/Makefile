# 
# Copyright (C) 2006 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=shorewall-shell
PKG_VERSION:=4.2.7
PKG_RELEASE:=1

PKG_SOURCE_URL:=http://www1.shorewall.net/pub/shorewall/4.2/shorewall-$(PKG_VERSION)/
PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.bz2
PKG_MD5SUM:=c5555ef10e493af3d3ad40785bf33caa

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
