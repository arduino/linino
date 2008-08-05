#
# Copyright (C) 2007 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
# $Id: $

include $(TOPDIR)/rules.mk

PKG_NAME:=dhcpcd
PKG_VERSION:=3.0.17
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.bz2
PKG_SOURCE_URL:=http://download.berlios.de/dhcpcd/
PKG_MD5SUM:=e9100e53f64ca1f9fb0d392c3a623738
PKG_CAT:=bzcat

include $(INCLUDE_DIR)/package.mk

define Package/dhcpcd
  SECTION:=net
  CATEGORY:=Network
  TITLE:=DHCP client for automatically configuring IPv4 networking
  URL:=http://dhcpcd.berlios.de/
endef

define Package/dhcpcd/description
	Simple configuration: supports executions of a script when the
	IP address changes.
endef

define Build/Compile
	$(MAKE) -C $(PKG_BUILD_DIR) \
		DESTDIR="$(PKG_INSTALL_DIR)" \
		CC="$(TARGET_CC)" \
		CFLAGS="$(TARGET_CFLAGS)" \
		all install
endef

define Package/dhcpcd/install
	$(INSTALL_DIR) $(1)/sbin
	$(CP) $(PKG_INSTALL_DIR)/sbin/* $(1)/sbin/
endef

$(eval $(call BuildPackage,dhcpcd))

