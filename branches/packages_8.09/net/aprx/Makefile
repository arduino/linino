#
# Copyright (C) 2008 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
# $Id: Makefile 2 07/06/2008 18:59:01Z jrhopper@gmail.com$

include $(TOPDIR)/rules.mk

PKG_NAME:=aprx
PKG_VERSION:=0.99
PKG_RELEASE:=svn121

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).$(PKG_RELEASE).tar.gz
PKG_SOURCE_URL:=http://ham.zmailer.org/oh2mqk/aprx
PKG_MD5SUM:=095ec0aa24432196002ae717593bfe5c

PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)-$(PKG_VERSION).$(PKG_RELEASE)

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

define Build/Configure
	$(call Build/Configure/Default, \
		--with-embedded \
	)
endef

define Package/aprx/install	
	$(INSTALL_DIR) $(1)/etc/init.d
	$(INSTALL_BIN) ./files/aprx.init $(1)/etc/init.d/aprx
	$(INSTALL_DIR) $(1)/etc
	$(INSTALL_CONF) $(PKG_BUILD_DIR)/aprx.conf $(1)/etc/
	$(INSTALL_DIR) $(1)/usr/sbin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/aprx $(1)/usr/sbin/
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/aprx-stat $(1)/usr/sbin/
endef

$(eval $(call BuildPackage,aprx))
