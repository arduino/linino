#
# Copyright (C) 2006 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
# $Id$

include $(TOPDIR)/rules.mk

PKG_NAME:=netperf
PKG_VERSION:=2.3pl1
PKG_RELEASE:=1
PKG_MD5SUM:=b74314d78af31cb13516fb9a372d2e86

PKG_SOURCE_URL:=ftp://ftp.netperf.org/netperf/archive/ \
	ftp://ftp.cup.hp.com/dist/networking/benchmarks/netperf/
PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_CAT:=zcat

PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)-$(PKG_VERSION)

include $(INCLUDE_DIR)/package.mk

define Package/netperf
  SECTION:=net
  CATEGORY:=Network
  TITLE:=network performance measurement tool
  DESCRIPTION:=Program and service to do network performance measurement.
  URL:=http://www.netperf.org
endef

define Build/Compile	
	$(MAKE) -C $(PKG_BUILD_DIR) \
	    TARGET_NETPERF_HOME="/etc/netperf.conf" \
	    TARGET_CC="$(TARGET_CROSS)gcc" \
	    TARGET_CFLAGS="$(TARGET_CFLAGS)" \
		TARGET_LIBS="" \
		all
endef

define Package/netperf/install	
	install -d -m0755 $(1)/etc/init.d
	install -m0755 ./files/netserver.init $(1)/etc/init.d/S51netserver
	install -d -m0755 $(1)/usr/bin
	install -m0755 $(PKG_BUILD_DIR)/netperf $(1)/usr/bin/
	install -m0755 $(PKG_BUILD_DIR)/netserver $(1)/usr/bin/
endef

$(eval $(call BuildPackage,netperf))
