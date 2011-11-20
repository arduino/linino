#
# Copyright (C) 2009 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=xfwm4-themes
PKG_VERSION:=4.6.0
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.bz2
PKG_SOURCE_URL:=http://archive.xfce.org/xfce/$(PKG_VERSION)/src/
PKG_MD5SUM:=4dc5cb29cbd40e3b9dece12a85e20854

PKG_INSTALL:=1

include $(INCLUDE_DIR)/package.mk

define Package/xfwm4-themes
  SECTION:=xorg-data
  CATEGORY:=Xorg
  SUBMENU:=data
  TITLE:=xfwm4-themes
  DEPENDS:=xfwm4
endef

define Package/xfwm4-themes/install
	$(INSTALL_DIR) $(1)/usr/share/themes
	$(CP) \
		$(PKG_INSTALL_DIR)/usr/share/themes/* \
		$(1)/usr/share/themes
endef

$(eval $(call BuildPackage,xfwm4-themes))
