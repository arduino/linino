#
# Copyright (C) 2006 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
# $Id$

include $(TOPDIR)/rules.mk

PKG_NAME:=vrrpd
PKG_VERSION:=1.0
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=@SF/vrrpd
PKG_MD5SUM:=6d5066ea1a6ced817376ca0f54765447

PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)-$(PKG_VERSION)

include $(INCLUDE_DIR)/package.mk

define Package/vrrpd
  SECTION:=net
  CATEGORY:=Network
  TITLE:=Virtual Router Redundancy Protocol daemon
  URL:=http://www.sourceforge.net/projects/vrrpd
endef

define Package/vrrpd/description
	VRRPd is an implementation of Virtual Router Redundancy 
	Protocol as specified in rfc2338. VRRPd is interoperable with 
	other RFC-based VRRP implementations, including Cisco and 
	Juniper, and is included as a standard feature on ImageStream 
	routers.
endef

define Package/vrrpd/conffiles
/etc/default/vrrpd
endef

define Build/Compile	
	$(call Build/Compile/Default, \
		DBG_OPT="" \
		MAIN_OPT="$(TARGET_CFLAGS)" \
		vrrpd \
	)
endef

define Package/vrrpd/install	
	$(INSTALL_DIR) $(1)/usr/sbin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/vrrpd $(1)/usr/sbin/
	$(INSTALL_DIR) $(1)/etc/default
	$(INSTALL_DATA) ./files/vrrpd.default $(1)/etc/default/vrrpd
	$(INSTALL_DIR) $(1)/etc/init.d
	$(INSTALL_BIN) ./files/vrrpd.init $(1)/etc/init.d/vrrpd
endef

$(eval $(call BuildPackage,vrrpd))
