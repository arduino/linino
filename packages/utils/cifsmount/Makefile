# 
# Copyright (C) 2006 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
# $Id$

include $(TOPDIR)/rules.mk

PKG_NAME:=cifsmount
PKG_VERSION:=1.5
PKG_RELEASE:=2

PKG_BUILD_DIR:=$(BUILD_DIR)/cifsmount

include $(INCLUDE_DIR)/package.mk

define Package/cifsmount
  SECTION:=utils
  CATEGORY:=Utilities
  TITLE:=CIFS mounting helper utility
  DESCRIPTION:=Helper utility for mounting remote CIFS shares.\\\
    An user space helper for mounting remote CIFS shares
endef

define Build/Prepare
	mkdir -p $(PKG_BUILD_DIR)
endef

define Build/Configure
endef

define Build/Compile
	$(TARGET_CC) $(TARGET_CFLAGS) -o $(PKG_BUILD_DIR)/mount.cifs mount.cifs.c
endef

define Package/cifsmount/install
	install -d -m0755 $(1)/sbin
	install -m0755 $(PKG_BUILD_DIR)/mount.cifs $(1)/sbin/
endef

$(eval $(call BuildPackage,cifsmount))
