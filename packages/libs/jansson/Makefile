#
# Copyright (C) 2011 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#


include $(TOPDIR)/rules.mk

PKG_NAME:=jansson
PKG_VERSION:=2.2
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=http://www.digip.org/jansson/releases/
PKG_MD5SUM:=198fbff8265686894b6d088dca22896d

PKG_INSTALL:=1
PKG_BUILD_PARALLEL:=1

include $(INCLUDE_DIR)/package.mk

define Package/jansson
  SECTION:=libs
  CATEGORY:=Libraries
  TITLE:=JSON library
endef

CONFIGURE_ARGS+= LIBS="-Wl,-rpath-link=$(STAGING_DIR)/usr/lib"

TARGET_CFLAGS += $(FPIC)

define Build/InstallDev
	$(INSTALL_DIR) $(1)/usr/{lib,include}
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/libjansson* $(1)/usr/lib
	$(CP) $(PKG_INSTALL_DIR)/usr/include/* $(1)/usr/include/
endef

define Package/jansson/install
	$(INSTALL_DIR) $(1)/usr/lib
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/libjansson*so* $(1)/usr/lib/
endef

$(eval $(call BuildPackage,jansson))
