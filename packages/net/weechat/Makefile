#
# Copyright (C) 2006 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
# $Id$

include $(TOPDIR)/rules.mk

PKG_NAME:=weechat
PKG_VERSION:=0.2.0
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.bz2
PKG_SOURCE_URL:=http://weechat.flashtux.org/download/
PKG_MD5SUM:=69c292237bebd4b7a1ff29c0f9c76380
PKG_CAT:=bzcat

PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)-$(PKG_VERSION)
PKG_INSTALL_DIR:=$(PKG_BUILD_DIR)/ipkg-install

include $(INCLUDE_DIR)/package.mk

define Package/weechat
  SECTION:=net
  CATEGORY:=Network
  DEPENDS:=+libncurses +liblua +libgnutls
  TITLE:=Lightweight IRC client
  DESCRIPTION:=\
  	Weechat is fast, light & extensible IRC client.
  URL:=http://weechat.flashtux.org/
endef

define Build/Configure	
	$(call Build/Configure/Default, \
		--with-debug=0 \
		--with-libgnutls-prefix=$(STAGING_DIR)/usr \
		--without-doc-xsl-prefix \
		--without-libiconv-prefix \
		--without-libintl-prefix \
		--disable-aspell \
		--enable-lua \
		--with-lua-inc="$(STAGING_DIR)/usr/include" \
		--with-lua-lib="$(STAGING_DIR)/usr/lib" \
		--disable-perl \
		--disable-python \
		--disable-ruby \
	)
endef

define Build/Compile
	$(MAKE) -C $(PKG_BUILD_DIR) \
		DESTDIR="$(PKG_INSTALL_DIR)" \
		all install
endef

define Package/weechat/install	
	install -d -m0755 $(1)/usr/bin
	$(CP) $(PKG_INSTALL_DIR)/usr/bin/weechat-curses $(1)/usr/bin/
	install -d -m0755 $(1)/usr/lib/weechat/plugins
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/weechat/plugins/lua.so* $(1)/usr/lib/weechat/plugins/
endef
 
$(eval $(call BuildPackage,weechat))
