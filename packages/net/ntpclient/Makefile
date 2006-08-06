#
# Copyright (C) 2006 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
# $Id$

include $(TOPDIR)/rules.mk

PKG_NAME:=ntpclient
PKG_VERSION:=2003_194
PKG_RELEASE:=2
PKG_MD5SUM:=94e84d5c6023c5e1f3890b28d0a08c92

PKG_SOURCE_URL:=http://doolittle.faludi.com/ntpclient
PKG_SOURCE:=$(PKG_NAME)_$(PKG_VERSION).tar.gz
PKG_CAT:=zcat

PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)

include $(INCLUDE_DIR)/package.mk

define Package/ntpclient
  SECTION:=net
  CATEGORY:=Network
  TITLE:=NTP (Network Time Protocol) client
  DESCRIPTION:=NTP client for setting system time from NTP servers.
  URL:=http://doolittle.faludi.com/ntpclient
endef

define Build/Compile	
	$(MAKE) -C $(PKG_BUILD_DIR) \
		CC=$(TARGET_CC) CFLAGS="$(TARGET_CFLAGS)" all adjtimex
endef

define Package/ntpclient/install	
	install -d -m0755 $(1)/etc/hotplug.d/iface
	install -m0755 ./files/ntpclient.init $(1)/etc/hotplug.d/iface/10-ntpclient
	install -d -m0755 $(1)/usr/sbin
	install -m0755 $(PKG_BUILD_DIR)/ntpclient $(1)/usr/sbin/
	install -m0755 $(PKG_BUILD_DIR)/adjtimex $(1)/usr/sbin/
	install -m0755 $(PKG_BUILD_DIR)/rate.awk $(1)/usr/sbin/
endef

$(eval $(call BuildPackage,ntpclient))
