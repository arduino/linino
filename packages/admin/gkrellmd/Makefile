#
# Copyright (C) 2007 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
# $Id$

include $(TOPDIR)/rules.mk

PKG_NAME:=gkrellmd
PKG_VERSION:=2.2.10
PKG_RELEASE:=1

PKG_SOURCE_URL:=http://members.dslextreme.com/users/billw/gkrellm/
PKG_SOURCE:=gkrellm-$(PKG_VERSION).tar.bz2
PKG_MD5SUM:=57ef0525c0997ac2e7720712811f5a84
PKG_CAT:=bzcat

PKG_BUILD_DIR:=$(BUILD_DIR)/gkrellm-$(PKG_VERSION)
PKG_INSTALL_DIR:=$(PKG_BUILD_DIR)/ipkg-install

include $(INCLUDE_DIR)/package.mk

define Package/gkrellmd
  SECTION:=admin
  CATEGORY:=Administration
  DEPENDS:=+glib1
  TITLE:=System monitoring daemon
  URL:=http://gkrellm.net/
endef

define Build/Compile
	CFLAGS="$(TARGET_CFLAGS) $(EXTRA_CPPFLAGS)"
	LDFLAGS="$(EXTRA_LDFLAGS) "
	$(MAKE) -C $(PKG_BUILD_DIR)/server \
		CC="$(TARGET_CC)" \
		glib12="yes" \
		GLIB12_LIB="-L$(STAGING_DIR)/usr/lib -lglib -lgmodule" \
		GLIB12_INCLUDE="-I$(STAGING_DIR)/usr/include/glib-1.2 -I$(STAGING_DIR)/usr/lib/glib/include"
endef

define Package/gkrellmd/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/server/$(PKG_NAME) $(1)/usr/bin/
	$(INSTALL_DIR) $(1)/etc
	$(INSTALL_CONF) $(PKG_BUILD_DIR)/server/$(PKG_NAME).conf $(1)/etc/
	$(INSTALL_DIR) $(1)/etc/init.d
	$(INSTALL_BIN) ./files/gkrellmd.init $(1)/etc/init.d/gkrellmd
endef

$(eval $(call BuildPackage,gkrellmd))
