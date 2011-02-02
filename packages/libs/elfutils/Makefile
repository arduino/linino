#
# Copyright (C) 2010 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
include $(TOPDIR)/rules.mk

PKG_NAME:=elfutils
PKG_VERSION:=0.150
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.bz2
PKG_SOURCE_URL:=http://fedorahosted.org/releases/e/l/$(PKG_NAME)/$(PKG_VERSION)
PKG_MD5SUM:=3dcfb28fa339090a1d29a9e148cce469

PKG_INSTALL:=1

include $(INCLUDE_DIR)/package.mk
include $(INCLUDE_DIR)/nls.mk

define Package/elfutils
  SECTION:=libs
  CATEGORY:=Libraries
  DEPENDS:=$(INTL_DEPENDS)
  TITLE:=ELF utilities
  URL:=https://fedorahosted.org/elfutils/
endef

CONFIGURE_OPTS += \
	--disable-generic \

MAKE_PATH:=./libelf

define Build/InstallDev
	$(INSTALL_DIR) $(1)/usr/include
	$(CP) $(PKG_BUILD_DIR)/libelf/libelf.h $(1)/usr/include/
	$(INSTALL_DIR) $(1)/usr/lib
	$(CP) $(PKG_BUILD_DIR)/libelf/libelf.{a,so*} $(1)/usr/lib/
endef

define Package/elfutils/install
	$(INSTALL_DIR) $(1)/usr/lib
	$(CP) $(PKG_BUILD_DIR)/libelf/libelf.so.* $(1)/usr/lib/
endef

$(eval $(call BuildPackage,elfutils))
