#
# Copyright (C) 2006 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
# $Id$

include $(TOPDIR)/rules.mk

PKG_NAME:=nano
PKG_VERSION:=2.0.6
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=http://www.nano-editor.org/dist/v2.0
PKG_MD5SUM:=619107f0fc3c4383d668cef15aa3ca32

PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)-$(PKG_VERSION)
PKG_INSTALL_DIR:=$(PKG_BUILD_DIR)/ipkg-install

include $(INCLUDE_DIR)/package.mk

define Package/nano
  SECTION:=utils
  CATEGORY:=Utilities
  DEPENDS:=+libncurses
  TITLE:=An enhanced clone of the Pico text editor
  URL:=http://www.nano-editor.org/
  SUBMENU:=editors
endef

define Package/nano/description
	GNU nano (Nano's ANOther editor, or Not ANOther editor) is an enhanced clone 
	of the Pico text editor..
endef

define Build/Configure
	$(call Build/Configure/Default, \
		--enable-tiny \
		--disable-glibtest \
		--disable-utf8 \
		--without-slang \
		, \
		ac_cv_header_regex_h=no \
	)
endef

define Build/Compile	
	$(MAKE) -C $(PKG_BUILD_DIR) \
		DESTDIR="$(PKG_INSTALL_DIR)" \
		all install
endef

define Package/nano/install	
	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/usr/bin/nano $(1)/usr/bin/
endef

$(eval $(call BuildPackage,nano))
