# 
# Copyright (C) 2006 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=fconfig
PKG_VERSION:=20060419
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=http://andrzejekiert.ovh.org/software/fconfig/
PKG_MD5SUM:=abc1aca11ee9c9d9b65057c3cf1ca88c
PKG_CAT:=zcat

PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)
PKG_INSTALL_DIR:=$(PKG_BUILD_DIR)/ipkg-install

include $(INCLUDE_DIR)/package.mk

define Package/fconfig
  SECTION:=utils
  CATEGORY:=Utilities
  TITLE:=RedBoot configuration editor
  DESCRIPTION:=\
	displays and (if writable) also edits the RedBoot configuration.
  URL:=http://andrzejekiert.ovh.org/software.html.en
endef

define Build/Configure
endef

define Build/Compile
	$(call Build/Compile/Default)
endef

define Package/fconfig/install
	$(INSTALL_DIR) $(1)/usr/sbin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/fconfig $(1)/usr/sbin/
endef

$(eval $(call BuildPackage,fconfig))
