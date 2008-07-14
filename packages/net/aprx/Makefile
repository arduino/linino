#
# Copyright (C) 2008 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
# $Id: $

include $(TOPDIR)/rules.mk

PKG_NAME:=aprx
PKG_VERSION:=0.22
PKG_RELEASE:=svn115

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).$(PKG_RELEASE).tar.gz
PKG_SOURCE_URL:=http://ham.zmailer.org/oh2mqk/aprx
PKG_MD5SUM:=e376bb1c420858b5053584bae00d498d

PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)-$(PKG_VERSION).$(PKG_RELEASE)
PKG_INSTALL_DIR:=$(PKG_BUILD_DIR)/ipkg-install

include $(INCLUDE_DIR)/package.mk

define Package/aprx
  SECTION:=net
  CATEGORY:=Network
  TITLE:=APRS RX only I-gate
  URL:=http://ham.zmailer.org/oh2mqk/aprx/
endef

define Package/aprx/description
	This daemon listens for traffic on the specified serial interfaces.
	It then forwards appropriate packets to APRS-IS servers.
endef

define Package/aprx/install	
	$(INSTALL_DIR) $(1)/etc
	$(INSTALL_CONF) $(PKG_BUILD_DIR)/aprx.conf $(1)/etc/
	$(INSTALL_DIR) $(1)/usr/sbin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/aprx $(1)/usr/sbin/
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/aprx-stat $(1)/usr/sbin/
endef

$(eval $(call BuildPackage,aprx))
