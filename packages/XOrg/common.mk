# 
# Copyright (C) 2007 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
# blogic@openwrt.org 

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.bz2

PKG_BUILD_DIR=$(BUILD_DIR)/Xorg/$(_CATEGORY)/${PKG_NAME}-$(PKG_VERSION)/

include $(INCLUDE_DIR)/package.mk

define Package/${PKG_NAME}
  SECTION:=xorg-${_CATEGORY}
  CATEGORY:=Xorg
  SUBMENU:=${_CATEGORY}
  DEPENDS:=${_DEPEND} @TARGET_x86
  TITLE:=${PKG_NAME}
  URL:=http://xorg.freedesktop.org/
endef

define Build/InstallDev
	DESTDIR=$(STAGING_DIR) $(MAKE) -C $(PKG_BUILD_DIR)/$(SUBPACKAGE)  $(MAKE_FLAGS) install
endef
