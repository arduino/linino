# Copyright (C) 2006 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
# $Id$

include $(TOPDIR)/rules.mk

PKG_NAME:=aircrack-ng
PKG_VERSION:=0.6
PKG_RELEASE:=1
PKG_MD5SUM:=6b85fe925c93c972f3d9f8170dce46c6

PKG_SOURCE_URL:=http://download.aircrack-ng.org
PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_CAT:=zcat

PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)-$(PKG_VERSION)
PKG_INSTALL_DIR:=$(PKG_BUILD_DIR)/ipkg-install

include $(INCLUDE_DIR)/package.mk

define Package/aircrack-ng
  SECTION:=net
  CATEGORY:=Network
  TITLE:=Aircrack-ng the next generation of aircrack with new features
  DESCRIPTION:=Aircrack-ng the next generation of aircrack with new features
  URL:=http://www.aircrack-ng.org
endef

define Build/Configure
endef

define Build/Compile
	rm -rf $(PKG_INSTALL_DIR)
	mkdir -p $(PKG_INSTALL_DIR)
	$(MAKE) -C $(PKG_BUILD_DIR) \
		CC="$(TARGET_CC)" \
		CFLAGS="$(TARGET_CFLAGS) -Wall" \
		prefix="/usr" \
		destdir="$(PKG_INSTALL_DIR)" \
	all install
endef

define Package/aircrack-ng/install
	install -d -m0755 $(1)/usr/bin
	$(CP) $(PKG_INSTALL_DIR)/usr/bin/aircrack-ng $(1)/usr/bin/
	$(CP) $(PKG_INSTALL_DIR)/usr/bin/airdecap-ng $(1)/usr/bin/
	$(CP) $(PKG_INSTALL_DIR)/usr/bin/arpforge-ng $(1)/usr/bin/
	$(CP) $(PKG_INSTALL_DIR)/usr/bin/ivstools $(1)/usr/bin/
	$(CP) $(PKG_INSTALL_DIR)/usr/bin/kstats $(1)/usr/bin/
	install -d -m0755 $(1)/usr/sbin
	$(CP) $(PKG_INSTALL_DIR)/usr/sbin/aireplay-ng $(1)/usr/sbin/
	$(CP) $(PKG_INSTALL_DIR)/usr/sbin/airodump-ng $(1)/usr/sbin/
	$(CP) $(PKG_INSTALL_DIR)/usr/sbin/airmon-ng $(1)/usr/sbin/
endef

$(eval $(call BuildPackage,aircrack-ng))
