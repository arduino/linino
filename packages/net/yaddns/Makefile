#
# Copyright (C) 2006-2010 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=yaddns
PKG_VERSION:=1.0-rc3
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=http://download.gna.org/yaddns/
PKG_MD5SUM:=fa1492212a09e0f5f39d3fa65ddf257e

PKG_INSTALL:=1

include $(INCLUDE_DIR)/package.mk

define Package/yaddns
  SECTION:=net
  CATEGORY:=Network
  TITLE:=Yet Another DDNS client
  URL:=http://patatrac.info/yaddns
endef

define Package/yaddns/description
Yaddns is a small ddns client with multiple ddns server supports (dyndns, ...)
and a high flexibility. Yaddns is particularly appropriate for embedded systems.
endef

define Package/yaddns/conffiles
/etc/config/ddns
endef

define Package/yaddns/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/usr/bin/yaddns $(1)/usr/bin/
	$(CP) ./files/* $(1)/
endef

$(eval $(call BuildPackage,yaddns))
