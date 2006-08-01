#
# Copyright (C) 2006 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
# $Id$

include $(TOPDIR)/rules.mk

PKG_NAME:=frickin
PKG_VERSION:=1.3
PKG_RELEASE:=1
PKG_MD5SUM:= 5b2e98da2310c71c703d4617b88a173f

PKG_SOURCE_URL:=@SF/frickin
PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_CAT:=zcat

PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)-$(PKG_VERSION)
PKG_INSTALL_DIR:=$(PKG_BUILD_DIR)/ipkg-install

include $(INCLUDE_DIR)/package.mk

define Package/frickin
  SECTION:=net
  CATEGORY:=Network
  TITLE:=PPTP (Point-to-Point Tunneling Protocol) proxy
  DESCRIPTION:=Frickin PPTP Proxy allows a Point-to-Point Tunneling Protocol (PPTP)\\\
client to connect to a PPTP server through Network Address\\\
Translation (NAT).\\\
  URL:=http://frickin.sourceforge.net
endef

define Package/frickin/conffiles
/etc/default/frickin
endef

define Build/Configure
	$(MAKE) -C $(PKG_BUILD_DIR) \
		$(TARGET_CONFIGURE_OPTS) \
		CFLAGS="$(TARGET_CFLAGS)" \
		all
endef

define Package/frickin/install
	install -d -m0755 $(1)/etc/default
	install -m0644 ./files/frickin.default $(1)/etc/default/frickin
	install -d -m0755 $(1)/etc/init.d
	install -m0755 ./files/frickin.init $(1)/etc/init.d/frickin
	install -d -m0755 $(1)/usr/sbin
	install -m0755 $(PKG_BUILD_DIR)/frickin $(1)/usr/sbin/
endef

$(eval $(call BuildPackage,frickin))
