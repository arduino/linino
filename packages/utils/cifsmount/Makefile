# 
# Copyright (C) 2006 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=cifsmount
PKG_VERSION:=1.5
PKG_RELEASE:=2

PKG_BUILD_DIR:=$(BUILD_DIR)/cifsmount

include $(INCLUDE_DIR)/package.mk

define Package/cifsmount
  SECTION:=utils
  CATEGORY:=Utilities
  SUBMENU:=Filesystem
  TITLE:=CIFS mounting helper utility
endef

define Package/cifsmount/description
	An user space helper utility for mounting remote CIFS shares.
endef

define Build/Prepare
endef

define Build/Compile
	$(TARGET_CC) $(TARGET_CFLAGS) -o $(PKG_BUILD_DIR)/mount.cifs mount.cifs.c
endef

define Package/cifsmount/install
	$(INSTALL_DIR) $(1)/sbin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/mount.cifs $(1)/sbin/
endef

$(eval $(call BuildPackage,cifsmount))
