#
# Copyright (C) 2006 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
# $Id$

include $(TOPDIR)/rules.mk

PKG_NAME:=vim
PKG_VERSION:=7.1
PKG_RELEASE:=2

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.bz2
PKG_SOURCE_URL:=ftp://ftp.vim.org/pub/vim/unix/
PKG_MD5SUM:=44c6b4914f38d6f9aa959640b89da329

PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)71

include $(INCLUDE_DIR)/package.mk

define Package/vim
  SECTION:=utils
  CATEGORY:=Utilities
  DEPENDS:=+libncurses
  TITLE:=Vi IMproved - enhanced vi editor
  URL:=http://www.vim.org/
  SUBMENU:=editors
endef

define Package/vim/description
	Vim is an almost compatible version of the UNIX editor Vi.
endef

CONFIGURE_ARGS += \
	--disable-gui \
	--enable-gui=none \
	--disable-gtktest \
	--disable-xim \
	--with-features=tiny \
	--without-x \
	--disable-multibyte \
	--disable-netbeans \
	--disable-cscope \
	--disable-gpm \
	--with-tlib=ncurses

define Package/vim/install	
	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/src/$(PKG_NAME) $(1)/usr/bin/
	$(INSTALL_DIR) $(1)/usr/share/vim
	$(INSTALL_CONF) ./files/vimrc $(1)/usr/share/vim/
endef

$(eval $(call BuildPackage,vim))
