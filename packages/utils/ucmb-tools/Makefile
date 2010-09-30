#
# Copyright (C) 2009 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.

include $(TOPDIR)/rules.mk

PKG_NAME:=ucmb-tools
PKG_RELEASE:=1

include $(INCLUDE_DIR)/package.mk


define Package/ucmb-tools
  SECTION:=utils
  CATEGORY:=Utilities
  TITLE:=Microcontroller Message Bus tools
  DEPENDS:=+kmod-ucmb
  MAINTAINER:=Michael Buesch <mb@bu3sch.de>
endef

define Package/ucmb-tools/description
	Debugging tool for UCMB
endef

define Build/Prepare
	$(CP) ./tools/* $(PKG_BUILD_DIR)/
endef

define Build/Compile
	$(MAKE) -C $(PKG_BUILD_DIR) \
		$(TARGET_CONFIGURE_OPTS) CFLAGS="$(TARGET_CFLAGS) -I$(LINUX_DIR)/include"
endef

define Package/ucmb-tools/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/ucmb $(1)/usr/bin/
endef

$(eval $(call BuildPackage,ucmb-tools))
