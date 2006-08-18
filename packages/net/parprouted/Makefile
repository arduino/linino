#
# Copyright (C) 2006 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
# $Id$

include $(TOPDIR)/rules.mk

PKG_NAME:=parprouted
PKG_VERSION:=0.63
PKG_RELEASE:=1
PKG_MD5SUM:=12753098a22e82997d1941d6d2284750

PKG_SOURCE_URL:=http://www.hazard.maks.net/parprouted/
PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_CAT:=zcat

PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)-$(PKG_VERSION)

include $(INCLUDE_DIR)/package.mk

define Package/parprouted
  SECTION:=net
  CATEGORY:=Network
  TITLE:=Proxy ARP daemon
  DESCRIPTION:=parprouted is a daemon for transparent IP (Layer 3) proxy ARP bridging.\\\
	This is useful for creation of transparent firewalls and bridging networks\\\
	with different MAC protocols. Also, unlike standard bridging, proxy ARP\\\
	bridging allows to bridge Ethernet networks behind wireless nodes without\\\
	using WDS or layer 2 bridging.\\\
 URL:=http://www.hazard.maks.net/parprouted/
endef

define Build/Compile
  $(call Build/Compile/Default,CFLAGS="$(TARGET_CFLAGS)" LDFLAGS="" all)
endef

define Package/parprouted/install	
	install -d -m0755 $(1)/etc/default
	install -m0755 ./files/parprouted.default $(1)/etc/default/parprouted
	install -d -m0755 $(1)/etc/init.d
	install -m0755 ./files/parprouted.init $(1)/etc/init.d/parprouted
	ln -sf parprouted $(1)/etc/init.d/S50parpouted
	install -d -m0755 $(1)/usr/sbin
	install -m0755 $(PKG_BUILD_DIR)/parprouted $(1)/usr/sbin/
endef

$(eval $(call BuildPackage,parprouted))
