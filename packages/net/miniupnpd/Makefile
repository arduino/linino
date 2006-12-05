#
# Copyright (C) 2006 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
# $Id$

include $(TOPDIR)/rules.mk

PKG_NAME:=miniupnpd
PKG_VERSION:=20061129
PKG_RELEASE:=1
PKG_MD5SUM:=1826c480e61e0573dfa1d835ee9d8802

PKG_SOURCE_URL:=http://miniupnp.tuxfamily.org/files
PKG_SOURCE:=$(PKG_NAME)$(PKG_VERSION).tar.gz
PKG_CAT:=zcat

PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)
PKG_INSTALL_DIR:=$(PKG_BUILD_DIR)/ipkg-install

include $(INCLUDE_DIR)/package.mk

define Package/miniupnpd
  SECTION:=net
  CATEGORY:=Network
  DEPENDS:=+iptables
  TITLE:=Lightweight UPnP daemon
  DESCRIPTION:=\
	Lightweight UPnP daemon
  URL:=http://miniupnp.tuxfamily.org/
endef

define Build/Compile
	$(MAKE) -C $(PKG_BUILD_DIR) -f Makefile.openwrt
endef

define Package/miniupnpd/install
	$(INSTALL_DIR) $(1)/usr/bin $(1)/etc/init.d $(1)/etc/config $(1)/CONTROL
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/miniupnpd $(1)/usr/bin/
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/linux/*.sh $(1)/usr/bin/
	$(INSTALL_BIN) ./files/miniupnpd.init $(1)/etc/init.d/miniupnpd
	$(INSTALL_BIN) ./files/upnpd.config $(1)/etc/config/upnpd
	$(INSTALL_BIN) ./ipkg/miniupnp.postinst $(1)/CONTROL/postinst
	$(STRIP) $(1)/usr/bin/miniupnpd
endef

$(eval $(call BuildPackage,miniupnpd))
