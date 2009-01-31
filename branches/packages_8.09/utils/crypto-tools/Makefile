#
# Copyright (C) 2008 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.

include $(TOPDIR)/rules.mk
include $(INCLUDE_DIR)/kernel.mk

PKG_NAME:=crypto-tools
PKG_VERSION:=20080917
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=@SF/ocf-linux
PKG_MD5SUM:=d20377afefa707fe528b161c2174e874

PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)
PKG_BUILD_DEPENDS:=libopenssl ocf-crypto-headers

include $(INCLUDE_DIR)/package.mk

define Package/crypto-tools
  SECTION:=utils
  CATEGORY:=Utilities
  DEPENDS:=+libopenssl
  TITLE:=OCF-Linux's crypto-tools
endef

define Build/Configure
endef

define Package/crypto-tools/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/cryptotest $(1)/usr/bin/
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/cryptokeytest $(1)/usr/bin/
endef

$(eval $(call BuildPackage,crypto-tools))
