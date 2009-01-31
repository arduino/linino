# 
# Copyright (C) 2007,2008 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.

include $(TOPDIR)/rules.mk

PKG_NAME:=input-utils
PKG_VERSION:=20051128-143821
PKG_RELEASE:=1

PKG_BUILD_DIR:=$(BUILD_DIR)/input/
PKG_SOURCE:=input-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=http://dl.bytesex.org/cvs-snapshots/
PKG_MD5SUM:=3f8504c769c41de0456baaaca1484fa6

include $(INCLUDE_DIR)/package.mk

define Package/input-utils
  SECTION:=utils
  CATEGORY:=Utilities
  TITLE:=Utilities for the input layer of the Linux kernel
endef

define Build/Configure
endef

define Build/Compile
	rm -rf $(PKG_INSTALL_DIR)
	mkdir -p $(PKG_INSTALL_DIR)
	$(MAKE) -C "$(PKG_BUILD_DIR)" \
		$(TARGET_CONFIGURE_OPTS) \
		CFLAGS="$(TARGET_CFLAGS)" \
		STRIP="true" \
		build
endef

define Package/input-utils/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/input-events $(1)/usr/bin/
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/input-kbd $(1)/usr/bin/
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/lsinput $(1)/usr/bin/

endef

$(eval $(call BuildPackage,input-utils))
