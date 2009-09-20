#
# Copyright (C) 2007 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=nano
PKG_VERSION:=2.1.9
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=http://www.nano-editor.org/dist/v2.1
PKG_MD5SUM:=41e9ffb4a055eba666cdb17c4e50ba21

include $(INCLUDE_DIR)/package.mk

define Package/nano
  SECTION:=utils
  CATEGORY:=Utilities
  DEPENDS:=+libncurses
  TITLE:=An enhanced clone of the Pico text editor
  URL:=http://www.nano-editor.org/
  SUBMENU:=Editors
endef

define Package/nano/description
	GNU nano (Nano's ANOther editor, or Not ANOther editor) is an enhanced clone
	of the Pico text editor..
endef

CONFIGURE_ARGS += \
	--enable-tiny \
	--disable-glibtest \
	--disable-utf8 \
	--without-slang \

CONFIGURE_VARS += \
	ac_cv_header_regex_h=no \

define Package/nano/install	
	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/src/$(PKG_NAME) $(1)/usr/bin/
endef

$(eval $(call BuildPackage,nano))
