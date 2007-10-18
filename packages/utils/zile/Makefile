# 
# Copyright (C) 2006 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
# $Id$

include $(TOPDIR)/rules.mk

PKG_NAME:=zile
PKG_VERSION:=2.2.37
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=@SF/zile
PKG_MD5SUM:=041e047ff293739166c9d17174645200

PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)-$(PKG_VERSION)

include $(INCLUDE_DIR)/package.mk

define Package/zile
  SECTION:=utils
  CATEGORY:=Utilities
  DEPENDS:=+libncurses
  TITLE:=very small emacs-like editor
  URL:=http://zile.sourceforge.net
  SUBMENU:=editors
endef

define Package/zile/description
	Zile is a small Emacs clone. Zile is a customizable, self-documenting 
	real-time display editor. Zile was written to be as similar as possible 
	to Emacs; every Emacs user should feel at home with Zile.
endef

define Build/Compile
	$(MAKE) -C $(PKG_BUILD_DIR)/src
endef

define Package/zile/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(CP) $(PKG_BUILD_DIR)/src/$(PKG_NAME) $(1)/usr/bin/
endef

$(eval $(call BuildPackage,zile))
