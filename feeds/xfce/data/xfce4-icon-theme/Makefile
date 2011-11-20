#
# Copyright (C) 2009-2011 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=xfce4-icon-theme
PKG_VERSION:=4.4.3
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.bz2
PKG_SOURCE_URL:=http://archive.xfce.org/xfce/$(PKG_VERSION)/src/
PKG_MD5SUM:=73ce2977b84f634a6a6c5d9c27e336db

PKG_INSTALL:=1

include $(INCLUDE_DIR)/package.mk

define Package/xfce4-icon-theme
  SECTION:=xorg-data
  CATEGORY:=Xorg
  SUBMENU:=data
  TITLE:=xfce4-icon-theme
  DEPENDS:=+hicolor-icon-theme
endef

define Package/xfce4-icon-theme/install
	$(INSTALL_DIR) $(1)/usr/share/icons
	$(CP) \
		$(PKG_INSTALL_DIR)/usr/share/icons/* \
		$(1)/usr/share/icons/

	$(INSTALL_DIR) $(1)/usr/share/xfce4/mime
	$(INSTALL_DATA) \
		$(PKG_INSTALL_DIR)/usr/share/xfce4/mime/* \
		$(1)/usr/share/xfce4/mime/
endef

$(eval $(call BuildPackage,xfce4-icon-theme))
