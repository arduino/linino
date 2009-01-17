#
# Copyright (C) 2009 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
# $Id$

include $(TOPDIR)/rules.mk

PKG_NAME:=tango-icon-theme
PKG_VERSION:=0.8.1
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=http://tango.freedesktop.org/releases/
PKG_MD5SUM:=32d5258f448b5982af9cfa4364f31d41
PKG_INSTALL:=1
PKG_BUILD_DEPENDS:=icon-naming-utils

include $(INCLUDE_DIR)/package.mk


define Package/tango-icon-theme
  SECTION:=xorg-data
  CATEGORY:=Xorg
  SUBMENU:=data
  TITLE:=Tango icon theme
  URL:=http://tango.freedesktop.org/
  DEPENDS:=+hicolor-icon-theme
endef

define Build/Configure
	$(call Build/Configure/Default, \
	    --disable-icon-framing \
	)
endef

define Package/tango-icon-theme/install
	$(INSTALL_DIR) $(1)/usr/share/icons
	$(CP) \
		$(PKG_INSTALL_DIR)/usr/share/icons/* \
		$(1)/usr/share/icons/
endef

$(eval $(call BuildPackage,tango-icon-theme))
