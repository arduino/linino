#
# Copyright (C) 2008 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=diffutils
PKG_VERSION:=2.8.1
PKG_RELEASE:=1
PKG_MD5SUM:=71f9c5ae19b60608f6c7f162da86a428
PKG_SOURCE_URL:=http://ftp.gnu.org/gnu/diffutils/
PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz

include $(INCLUDE_DIR)/package.mk

define Package/diffutils
  SECTION:=devel
  CATEGORY:=Development
  TITLE:=diffutils
  URL:=http://www.gnu.org/
endef

define Package/diffutils/description
  The Diffutils package contains programs that show the differences between files or directories.
endef

define Build/Configure
	$(CP) $(SCRIPT_DIR)/config.* $(PKG_BUILD_DIR)/config/
	$(call Build/Configure/Default,ac_cv_func_mempcpy=n)
endef

define Build/Compile
	$(MAKE_VARS) $(MAKE) $(MAKE_ARGS) -C $(PKG_BUILD_DIR) all
endef

define Package/diffutils/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/src/{sdiff,diff3,diff,cmp} $(1)/usr/bin/
endef

$(eval $(call BuildPackage,diffutils))
