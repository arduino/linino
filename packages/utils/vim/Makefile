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
PKG_MD5SUM:=
PKG_CAT:=zcat

PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)-$(PKG_VERSION)

include $(INCLUDE_DIR)/package.mk

define Package/vim
  SECTION:=utils
  CATEGORY:=Utilities
  DEPENDS:=+libncurses
  TITLE:=VI Improved
  DESCRIPTION:=An improved version of VI.
  URL:=http://www.vim.org
endef

define Build/Configure
$(call Build/Configure/Default,--enable-min-features \
			--disable-gui \
			--without-x \
			--disable-multibyte \
			--disable-cscope \
			--disable-gpm \
			--with-tlib=ncurses,ac_cv_c_bigendian=no \
			ac_cv_sizeof_off_t=8 \
			ac_cv_sizeof_int=4)
endef

define Build/Compile
$(call Build/Compile/Default,CC="$(TARGET_CC)")
endef

define Package/vim/install	
	mkdir -p $(1)/usr/bin
	mkdir -p $(1)//usr/share/vim
	$(CP) ./files/vimrc $(1)//usr/share/vim
	$(CP) $(PKG_BUILD_DIR)/src/$(PKG_NAME) $(1)/usr/bin/
endef

$(eval $(call BuildPackage,vim))
