#
# Copyright (C) 2009 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk


PKG_NAME:=tmux
PKG_VERSION:=1.1
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=@SF/tmux
PKG_MD5SUM:=faf2fc52ac3ae63d899f6fece2c112cd

include $(INCLUDE_DIR)/package.mk

define Package/tmux
  SECTION:=utils
  CATEGORY:=Utilities
  TITLE:=Terminal multiplexer
  DEPENDS:=+libncurses
  URL:=http://tmux.sourceforge.net
endef

define Package/tmux/description
  tmux is a modern, BSD-licensed alternative to GNU screen.
endef

define Build/Compile
	CC="$(TARGET_CC)" \
	CFLAGS="$(TARGET_CFLAGS) -I$(STAGING_DIR)/usr/include" \
	LDFLAGS="$(TARGET_LDFLAGS)" \
	TMUX_PLATFORM="Linux" \
	$(MAKE) -C $(PKG_BUILD_DIR) all
endef

define Package/tmux/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/tmux $(1)/usr/bin/
endef

$(eval $(call BuildPackage,tmux))
