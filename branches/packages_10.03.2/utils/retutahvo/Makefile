#
# Copyright (C) 2010 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=retutahvo
PKG_RELEASE:=1

PKG_SOURCE_SUBDIR:=$(PKG_NAME)

include $(INCLUDE_DIR)/package.mk

define Package/retutahvo
  SECTION:=utils
  CATEGORY:=Utilities
  TITLE:=Retu/Tahvo userspace tool
  DEPENDS:=@TARGET_omap24xx
  MAINTAINER:=Michael Buesch <mb@bu3sch.de>
endef

define Package/retutahvo/description
	Nokia n810 Retu/Tahvo userspace tool.
	Warning: Do not use this, if you don't know what you're doing.
	This tool can physically damage the n810.
endef

define Build/Prepare
	mkdir -p $(PKG_BUILD_DIR)
	$(CP) ./files/src/* $(PKG_BUILD_DIR)/
endef

define Package/retutahvo/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/retutahvo $(1)/usr/bin/
endef

$(eval $(call BuildPackage,retutahvo))
