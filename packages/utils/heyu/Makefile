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
PKG_MD5SUM:=8289d5ca5b972333a72bc0fc3e640c13
PKG_SOURCE_URL:=http://heyu.tanj.com/download/
PKG_SOURCE:=heyu-$(PKG_VERSION).tgz
PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)-$(PKG_VERSION)
PKG_CAT:=zcat

include $(INCLUDE_DIR)/package.mk

define Package/heyu
  SECTION:=utils
  CATEGORY:=Utilities
  DEPENDS:=+setserial
  TITLE:=X10 home automation control using a CM11A
  DESCRIPTION:=10 home automation control using the CM11A serial device.
  URL:=http://heyu.tanj.com/heyu2/
endef

define Package/heyu/conffiles
/etc/heyu/x10.conf
endef

define Build/Compile	
	$(MAKE) -C $(PKG_BUILD_DIR) \
		CC=$(TARGET_CC) LD=$(TARGET_CROSS)ld \
		CFLAGS="$(TARGET_CFLAGS) -I$(PKG_BUILD_DIR) -DSYSV -DPOSIX -DHAS_ITIMER -DLINUX -DHASSELECT -DHASTZ"
endef

define Package/heyu/install	
	install -d -m0755 $(1)/etc/$(PKG_NAME)
	install -m0644 ./files/x10.conf $(1)/etc/$(PKG_NAME)/x10.conf
	install -d -m0755 $(1)/usr/bin
	install -m0644 $(PKG_BUILD_DIR)/heyu $(1)/usr/bin/
endef

$(eval $(call BuildPackage,heyu))
