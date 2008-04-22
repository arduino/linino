#
# Copyright (C) 2008 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
# $Id$

include $(TOPDIR)/rules.mk

PKG_NAME:=sispmctl
PKG_VERSION:=2.7
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=@SF/$(PKG_NAME)
PKG_MD5SUM:=2457f76cd129f880634f3381be0aeb76

include $(INCLUDE_DIR)/package.mk

define Package/sispmctl
  SECTION:=utils
  CATEGORY:=Utilities
  TITLE:=Silver Shield PM Control for Linux
  URL:=http://sispmctl.sourceforge.net/
  DEPENDS:=+libusb
endef

CONFIGURE_ARGS += \
	--enable-webless \
	--disable-dependency-tracking \

CONFIGURE_VARS += \
	ac_cv_path_HAVELIBUSB="$(STAGING_DIR)/usr/bin/libusb-config" \

define Package/sispmctl/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/src/$(PKG_NAME) $(1)/usr/bin/
endef

$(eval $(call BuildPackage,sispmctl))
