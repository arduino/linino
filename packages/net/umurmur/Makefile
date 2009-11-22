#
# Copyright (C) 2009 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
include $(TOPDIR)/rules.mk


PKG_NAME:=umurmur
PKG_VERSION:=0.1.3
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=http://umurmur.googlecode.com/files/
PKG_MD5SUM:=f72b6f0aee7fdba31cd4faa9fb01ab6d

include $(INCLUDE_DIR)/package.mk

define Package/umurmur
  SECTION:=net
  CATEGORY:=Network
  TITLE:=uMurmur
  DEPENDS:=+libopenssl +libconfig
  URL:=http://code.google.com/p/umurmur
  MAINTAINER:=Martin Johansson <martin@fatbob.nu>
endef

define Package/umurmur/description
  Minimalistic Mumble server daemon.
endef

TARGET_CFLAGS := \
	-DWRT_TARGET \
	-I$(STAGING_DIR)/usr/include \
	$(TARGET_CFLAGS)

define Build/Compile
	CC="$(TARGET_CC)" \
	CFLAGS="$(TARGET_CFLAGS)" \
	LDFLAGS="$(TARGET_LDFLAGS)" \
	$(MAKE) -C $(PKG_BUILD_DIR)/src \
		all
endef

define Package/umurmur/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/src/umurmurd $(1)/usr/bin/
	$(INSTALL_DIR) $(1)/etc
	$(INSTALL_CONF) $(PKG_BUILD_DIR)/files/umurmur.conf $(1)/etc/
	$(INSTALL_DIR) $(1)/etc/init.d
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/files/umurmur.init $(1)/etc/init.d/umurmur
	$(INSTALL_DIR) $(1)/etc/umurmur
endef

$(eval $(call BuildPackage,umurmur))
