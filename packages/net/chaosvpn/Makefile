# 
# Copyright (C) 2006-2008 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
# $Id: Makefile 12693 2008-09-25 10:47:39Z nico $

include $(TOPDIR)/rules.mk
include $(INCLUDE_DIR)/kernel.mk

PKG_NAME:=chaosvpn
PKG_VERSION:=2.0-rc11
PKG_MD5SUM:=8c5c9ee78151d521492ceeb41a812456
PKG_REV:=2.0-rc11
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.bz2
PKG_SOURCE_URL:=git://github.com/ryd/chaosvpn.git
PKG_SOURCE_PROTO:=git
PKG_SOURCE_SUBDIR:=$(PKG_NAME)-$(PKG_VERSION)
PKG_SOURCE_VERSION:=$(PKG_REV)

PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)-$(PKG_VERSION)

include $(INCLUDE_DIR)/package.mk

define Package/chaosvpn
  SECTION:=net
  CATEGORY:=Network
  TITLE:=Config generator for chaos vpn
  MAINTAINER:=Christopher J. Pilkington <cjp@0x1.net>
  URL:=http://github.com/ryd/chaosvpn
  DEPENDS:=+tinc +kmod-tun +ip +libopenssl
endef

define Package/chaosvpn/description
  Configure tincd for the chaosvpn network
endef

define Build/Compile
  $(MAKE) -C $(PKG_BUILD_DIR) \
    CC="$(TARGET_CC)" \
    COPT="$(TARGET_CFLAGS) -I$(STAGING_DIR)/usr/include -I$(STAGING_DIR)/include -I$(STAGING_DIR)/usr/lib" \
    LIB="$(TARGET_LDFLAGS) -L$(STAGING_DIR)/usr/lib -Wl,-rpath-link,$(STAGING_DIR)/usr/lib"
endef

define Package/chaosvpn/install
	$(INSTALL_DIR) $(1)/usr/sbin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/chaosvpn $(1)/usr/sbin/
	$(INSTALL_DIR) $(1)/etc/tinc
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/chaosvpn.conf $(1)/etc/tinc/chaosvpn.conf.sample
endef

$(eval $(call BuildPackage,chaosvpn))
