#
# Copyright (C) 2006 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
# $Id: $

include $(TOPDIR)/rules.mk

PKG_NAME:=weechat
PKG_VERSION:=0.2.0
PKG_RELEASE:=1
PKG_MD5SUM:=69c292237bebd4b7a1ff29c0f9c76380

PKG_SOURCE_URL:=http://weechat.flashtux.org/download/
PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.bz2
PKG_CAT:=bzcat

PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)-$(PKG_VERSION)
PKG_INSTALL_DIR:=$(PKG_BUILD_DIR)/ipkg-install

include $(INCLUDE_DIR)/package.mk

define Package/weechat
  SECTION:=net
  CATEGORY:=Network
  DEPENDS:=+libncurses +liblua +libgnutls +libiconv
  TITLE:=Lightweight IRC client
  DESCRIPTION:=\
  	Weechat is fast, light & extensible IRC client.
  URL:=http://weechat.flashtux.org
endef

define Build/Configure	
	(cd $(PKG_BUILD_DIR); \
	$(TARGET_CONFIGURE_OPTS) \
	CFLAGS="$(TARGET_CFLAGS)" \
	CPPFLAGS="-I$(STAGING_DIR)/usr/include" \
	LDFLAGS="-L$(STAGING_DIR)/usr/lib -liconv" \
	./configure \
		--target=$(GNU_TARGET_NAME) \
		--host=$(GNU_TARGET_NAME) \
		--build=$(GNU_HOST_NAME) \
		--prefix=/usr \
		--sysconfdir=/etc \
		--disable-nls \
		--with-libgnutls-prefix=$(STAGING_DIR)/usr \
		--with-debug=0 \
		--disable-perl \
		--disable-python \
		--disable-ruby \
	);
endef

define Build/Compile
$(call Build/Compile/Default,DESTDIR="$(PKG_INSTALL_DIR)" \
	all install)
endef

define Package/weechat/install	
	install -d -m0755 $(1)/usr/bin
	$(CP) $(PKG_INSTALL_DIR)/usr/bin/weechat-curses $(1)/usr/bin
endef
 
$(eval $(call BuildPackage,weechat))
