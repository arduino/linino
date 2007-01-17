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

PKG_SOURCE:=$(PKG_NAME)_$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=http://doolittle.icarus.com/ntpclient/
PKG_MD5SUM:=94e84d5c6023c5e1f3890b28d0a08c92
PKG_CAT:=zcat

PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)

include $(INCLUDE_DIR)/package.mk

define Package/ntpclient
  SECTION:=net
  CATEGORY:=Network
  TITLE:=NTP (Network Time Protocol) client
  DESCRIPTION:=\
	NTP client for setting system time from NTP servers.
  URL:=http://doolittle.icarus.com/ntpclient/
endef

define Build/Compile
	$(call Build/Compile/Default,all adjtimex)
endef

define Package/ntpclient/install	
	$(INSTALL_DIR) $(1)/etc/hotplug.d/iface
	$(INSTALL_BIN) ./files/ntpclient.init $(1)/etc/hotplug.d/iface/10-ntpclient
	$(INSTALL_DIR) $(1)/etc/config
	$(INSTALL_DATA) ./files/ntpclient.config $(1)/etc/config/ntp_client
	$(INSTALL_DIR) $(1)/usr/sbin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/ntpclient $(1)/usr/sbin/
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/adjtimex $(1)/usr/sbin/
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/rate.awk $(1)/usr/sbin/
endef

$(eval $(call BuildPackage,ntpclient))
