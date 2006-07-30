# Copyright (C) 2006 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
# $Id$

include $(TOPDIR)/rules.mk

PKG_NAME:=arpwatch
PKG_VERSION:=2.1a11
PKG_RELEASE:=1
PKG_MD5SUM:=9ecd00db892737431b0e524f3e52e19e

PKG_SOURCE_URL:=http://nbd.vd-s.ath.cx/openwrt
PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_CAT:=zcat

PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)-$(PKG_VERSION)
PKG_INSTALL_DIR:=$(PKG_BUILD_DIR)/ipkg-install

include $(INCLUDE_DIR)/package.mk

define Package/arpwatch
  SECTION:=net
  CATEGORY:=Network
  DEPENDS:=+libpcap
  TITLE:=Ethernet station activity monitor
  DESCRIPTION:=Ethernet monitor program for keeping track of ethernet/ip address pairings
  URL:=http://nbd.vd-s.ath.cx/openwrt
endef

define Package/arpwatch/conffiles
/etc/arpwatch/arp.dat
endef

define Build/Compile
	rm -rf $(PKG_INSTALL_DIR)
	mkdir -p $(PKG_INSTALL_DIR)
	$(MAKE) -C $(PKG_BUILD_DIR) \
		ARPDIR=/etc/arpwatch \
		CCOPT="$(TARGET_CFLAGS)" \
		INCLS="-I. -I$(STAGING_DIR)/usr/include" \
		LIBS="-L$(STAGING_DIR)/usr/lib -lpcap"
endef

define Package/arpwatch/install
	install -m0755 -d $(1)/usr/sbin $(1)/etc/arpwatch
	$(CP) $(PKG_BUILD_DIR)/arp{watch,snmp} $(1)/usr/sbin/
	$(CP) $(PKG_BUILD_DIR)/arp.dat $(1)/etc/arpwatch/
endef

$(eval $(call BuildPackage,arpwatch))
