#
# Copyright (C) 2006-2012 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=weechat
PKG_VERSION:=0.3.7
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.bz2
PKG_SOURCE_URL:=http://www.weechat.org/files/src
PKG_MD5SUM:=62bb5002b2ba9e5816dfeededc3fa276

PKG_FIXUP:=autoreconf

include $(INCLUDE_DIR)/package.mk
include $(INCLUDE_DIR)/nls.mk
include $(INCLUDE_DIR)/cmake.mk

define Package/weechat
  SUBMENU:=Instant Messaging
  SECTION:=net
  CATEGORY:=Network
  TITLE:=Lightweight IRC client
  URL:=http://www.weechat.org/
  DEPENDS:=+libcurl +libgnutls +libncursesw $(ICONV_DEPENDS)
endef

define Package/weechat/description
 Weechat is fast, light & extensible IRC client.
endef

CMAKE_OPTIONS+= \
	-DENABLE_PYTHON=OFF \
	-DENABLE_PERL=OFF \
	-DENABLE_LUA=OFF \
	-DENABLE_GUILE=OFF \
	-DENABLE_RUBY=OFF \
	-DENABLE_TCL=OFF

TARGET_LDFLAGS += \
	-L$(ICONV_PREFIX)/lib -ldl \
	-Wl,-rpath-link,$(STAGING_DIR)/usr/lib

define Package/weechat/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/usr/bin/weechat-curses $(1)/usr/bin/
	$(INSTALL_DIR) $(1)/usr/lib/weechat/plugins
	$(CP) \
		$(PKG_INSTALL_DIR)/usr/lib/weechat/plugins/* \
		$(1)/usr/lib/weechat/plugins/
endef

$(eval $(call BuildPackage,weechat))
