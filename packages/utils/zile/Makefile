#
# Copyright (C) 2006-2009 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=zile
PKG_VERSION:=2.3.11
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=@GNU/zile
PKG_MD5SUM:=eda8745c2681dd7bea478496c0178e90

include $(INCLUDE_DIR)/package.mk

define Package/zile
  SECTION:=utils
  CATEGORY:=Utilities
  DEPENDS:=+libncurses
  TITLE:=very small emacs-like editor
  URL:=http://zile.sourceforge.net
  SUBMENU:=Editors
endef

define Package/zile/description
	Zile is a small Emacs clone. Zile is a customizable, self-documenting
	real-time display editor. Zile was written to be as similar as possible
	to Emacs; every Emacs user should feel at home with Zile.
endef

define Package/zile/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/src/$(PKG_NAME) $(1)/usr/bin/
endef

$(eval $(call BuildPackage,zile))
