#
# Copyright (C) 2006 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
# $Id$

include $(TOPDIR)/rules.mk

PKG_NAME:=miniupnpd
PKG_VERSION:=0.1
PKG_RELEASE:=2
PKG_MD5SUM:=4ba2a49c593d0c1088cc5791b8c6a985

PKG_SOURCE_URL:=http://ftp.berlios.de/pub/xwrt/storage/
PKG_SOURCE:=$(PKG_NAME)_$(PKG_VERSION).tar.gz
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

define Build/Clean
	# remove the client dir since the build system doesnt know about it
	rm -rf $(PKG_BUILD_DIR)/../miniupnpc
endef

define Package/miniupnpd/install
	$(INSTALL_DIR) $(1)/usr/bin $(1)/etc/init.d
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/miniupnpd $(1)/usr/bin/
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/linux/*.sh $(1)/usr/bin/
	$(INSTALL_BIN) ./files/miniupnpd.init $(1)/etc/init.d/miniupnpd
	$(STRIP) $(1)/usr/bin/miniupnpd
endef

$(eval $(call BuildPackage,miniupnpd))
