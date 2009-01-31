#
# Copyright (C) 2008 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=patch
PKG_VERSION:=2.5.4
PKG_RELEASE:=1
PKG_MD5SUM:=ee5ae84d115f051d87fcaaef3b4ae782
PKG_SOURCE_URL:=http://ftp.gnu.org/gnu/patch/
PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz

include $(INCLUDE_DIR)/package.mk

define Package/patch
  SECTION:=devel
  CATEGORY:=Development
  TITLE:=patch
  URL:=http://www.gnu.org/
endef

define Package/patch/description
  The Patch package contains a program for modifying or creating files by applying a "patch" file typically created by the diff program.
endef

define Build/Configure
	$(call Build/Configure/Default)
endef

define Build/Compile
	$(MAKE_VARS) $(MAKE) $(MAKE_ARGS) exec_prefix=$(PKG_INSTALL_DIR) -C $(PKG_BUILD_DIR) all install 
endef

define Package/patch/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/bin/patch $(1)/usr/bin/
endef

$(eval $(call BuildPackage,patch))
