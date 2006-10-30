#
# Copyright (C) 2006 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
# $Id$

include $(TOPDIR)/rules.mk

PKG_NAME:=vim
PKG_VERSION:=5.8
PKG_RELEASE:=1

PKG_SOURCE_URL:=ftp://ftp.vim.org/pub/vim/unix/
PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION)-src.tar.gz
PKG_MD5SUM:=89ab05bb5cd39eeb9e259503436c11ed
PKG_CAT:=zcat

PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)-$(PKG_VERSION)

include $(INCLUDE_DIR)/package.mk

define Package/vim
  SECTION:=utils
  CATEGORY:=Utilities
  DEPENDS:=+libncurses
  TITLE:=VI Improved
  URL:=http://www.vim.org/
endef

define Build/Configure
	$(call Build/Configure/Default, \
		--enable-min-features \
		--disable-gui \
		--without-x \
		--disable-multibyte \
		--disable-cscope \
		--disable-gpm \
		--with-tlib=ncurses \
	)
endef

define Package/vim/install	
	install -d -m0755 $(1)/usr/bin
	$(CP) $(PKG_BUILD_DIR)/src/$(PKG_NAME) $(1)/usr/bin/
	install -d -m0755 $(1)/usr/share/vim
	$(CP) ./files/vimrc $(1)/usr/share/vim/
endef

$(eval $(call BuildPackage,vim))
