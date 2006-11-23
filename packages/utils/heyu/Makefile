#
# Copyright (C) 2006 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
# $Id$

include $(TOPDIR)/rules.mk

PKG_NAME:=heyu
PKG_VERSION:=2.0beta.5
PKG_RELEASE:=1

PKG_SOURCE:=heyu-$(PKG_VERSION).tgz
PKG_SOURCE_URL:=http://heyu.tanj.com/download/
PKG_MD5SUM:=8289d5ca5b972333a72bc0fc3e640c13
PKG_CAT:=zcat

PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)-$(PKG_VERSION)

include $(INCLUDE_DIR)/package.mk

define Package/heyu
  SECTION:=utils
  CATEGORY:=Utilities
  DEPENDS:=+setserial
  TITLE:=X10 home automation control using a CM11A
  URL:=http://heyu.tanj.com/heyu2/
endef

define Package/heyu/conffiles
/etc/heyu/x10.conf
endef

define Build/Compile
	$(call Build/Compile/Default, \
		CFLAGS="$(TARGET_CFLAGS) \$$$$(DFLAGS)" \
	)
endef

define Package/heyu/install	
	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/heyu $(1)/usr/bin/
	$(INSTALL_DIR) $(1)/etc/$(PKG_NAME)
	$(INSTALL_DATA) ./files/x10.conf $(1)/etc/$(PKG_NAME)/x10.conf
endef

$(eval $(call BuildPackage,heyu))
