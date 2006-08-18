#
# Copyright (C) 2006 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
# $Id$

include $(TOPDIR)/rules.mk

PKG_NAME:=vnstat
PKG_VERSION:=1.4
PKG_RELEASE:=1
PKG_MD5SUM:=9184f79b5e60499bc059f670032291e5

PKG_SOURCE_URL:=http://humdi.net/vnstat
PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_CAT:=zcat

PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)-$(PKG_VERSION)
PKG_INSTALL_DIR:=$(PKG_BUILD_DIR)/ipkg-install

include $(INCLUDE_DIR)/package.mk

define Package/vnstat
  SECTION:=net
  CATEGORY:=Network
  TITLE:=Console-based network traffic monitor
  DESCRIPTION:=vnStat is a network traffic monitor for Linux that keeps a log of daily\\\
  network traffic for the selected interface(s). vnStat isn't a packet\\\
  sniffer. The traffic information is analyzed from the /proc -filesystem,\\\
  so vnStat can be used without root permissions.\\\
  URL:=http://humdi.net/vnstat/
endef

define Package/vnstat/install	
	install -d -m0755 $(1)/usr/bin
	$(CP) $(PKG_BUILD_DIR)/src/vnstat $(1)/usr/bin/
endef

$(eval $(call BuildPackage,vnstat))
