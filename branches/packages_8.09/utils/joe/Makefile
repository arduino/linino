#
# Copyright (C) 2007 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
# $Id$

include $(TOPDIR)/rules.mk

PKG_NAME:=joe
PKG_VERSION:=3.5
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=@SF/joe-editor
PKG_MD5SUM:=9bdffecce7ef910feaa06452d48843de

include $(INCLUDE_DIR)/package.mk

define Package/joe
  SECTION:=utils
  CATEGORY:=Utilities
  DEPENDS:=+libncurses
  TITLE:=JOE - Joes own editor
  URL:=http://sourceforge.net/projects/joe-editor/
  SUBMENU:=Editors
endef

define Package/joe/description
Joe is world-famous Wordstar like text editor.
endef

define Package/joe/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/joe $(1)/usr/bin/
endef

$(eval $(call BuildPackage,joe))
