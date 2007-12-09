#
# Copyright (C) 2006 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
# $Id$

include $(TOPDIR)/rules.mk

PKG_NAME:=weechat
PKG_VERSION:=0.2.5
PKG_RELEASE:=2

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.bz2
PKG_SOURCE_URL:=http://weechat.flashtux.org/download/
PKG_MD5SUM:=42f96620c3b2fd3dca9768d9ce16dd06

include $(INCLUDE_DIR)/package.mk

define Package/weechat/Default
  SUBMENU:=Instant Messaging
  SECTION:=net
  CATEGORY:=Network
  TITLE:=Lightweight IRC client
  URL:=http://weechat.flashtux.org/
endef

define Package/weechat/Default/description
 Weechat is fast, light & extensible IRC client.
endef


define Package/weechat
$(call Package/weechat/Default)
 MENU=1
 DEPENDS:=+libiconv +libgnutls +libncurses
endef

define Package/weechat/description
$(call Package/weechat/Default/description)
endef


define Package/weechat-mod-charset
$(call Package/weechat/Default)
 TITLE+= (charset plugin)
 DEPENDS:=weechat
endef

define Package/weechat-mod-charset/description
$(call Package/weechat/Default/description)
 This packages contains a charset plugin for Weechat.
endef


define Package/weechat-mod-lua
$(call Package/weechat/Default)
 TITLE+= (LUA plugin)
 DEPENDS:=weechat +liblua
endef

define Package/weechat-mod-lua/description
$(call Package/weechat/Default/description)
 This packages contains an LUA scripting plugin for Weechat.
endef


CONFIGURE_ARGS+= \
	--with-debug=0 \
	--with-libgnutls-prefix=$(STAGING_DIR)/usr \
	--without-doc-xsl-prefix \
	--with-libiconv-prefix="$(STAGING_DIR)/usr/lib/libiconv" \
	--without-libintl-prefix \
	--disable-aspell \
	--disable-perl \
	--disable-python \
	--disable-ruby \

CONFIGURE_VARS+= \
	LDFLAGS="$$$$LDFLAGS -L$(STAGING_DIR)/usr/lib/libiconv/lib" \

ifndef ($(SDK)$(CONFIG_PACKAGE_weechat-mod-lua),)
  CONFIGURE_ARGS+= \
	--enable-lua \
	--with-lua-inc="$(STAGING_DIR)/usr/include" \
	--with-lua-lib="$(STAGING_DIR)/usr/lib"
  CONFIGURE_VARS+= \
	LIBS="-ldl -lm"
else
  CONFIGURE_ARGS+= \
	--disable-lua
endif


define Build/Configure
	$(call Build/Configure/Default)
	$(call libtool_disable_rpath)
endef

define Build/Compile
	$(MAKE) -C $(PKG_BUILD_DIR) all
	$(call libtool_fixup_libdir,$(PKG_INSTALL_DIR))
	$(MAKE) -C $(PKG_BUILD_DIR) DESTDIR="$(PKG_INSTALL_DIR)" install
endef

define Package/weechat/install	
	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/usr/bin/weechat-curses $(1)/usr/bin/
	$(INSTALL_DIR) $(1)/usr/lib/weechat/plugins
endef

define BuildPlugin

  define Package/weechat-mod-$(1)/install	
	$(INSTALL_DIR) $$(1)/usr/lib/weechat/plugins
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/weechat/plugins/$(1).so* $$(1)/usr/lib/weechat/plugins/
  endef

  $$(eval $$(call BuildPackage,weechat-mod-$(1)))
endef

$(eval $(call BuildPackage,weechat))
$(eval $(call BuildPlugin,charset))
$(eval $(call BuildPlugin,lua))
