#
# Copyright (C) 2009 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=luasec
PKG_VERSION:=0.3.3
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=http://luaforge.net/frs/download.php/4160
PKG_MD5SUM:=88261020372dfe8f850fdb60e4fae186

include $(INCLUDE_DIR)/package.mk

define Package/luasec
  SUBMENU:=Lua
  SECTION:=lang
  CATEGORY:=Languages
  TITLE:=LuaSec
  URL:=http://luasec.luaforge.net/
  DEPENDS:=+lua +libopenssl +luasocket
endef

define Package/luasec/description
  LuaSec is a binding for OpenSSL library to provide TLS/SSL communication.
endef

define Build/Configure
endef

define Build/Compile
	$(MAKE) -C $(PKG_BUILD_DIR)/src linux \
		INCDIR="$(TARGET_CPPFLAGS)" \
		LIBDIR="$(TARGET_LDFLAGS)" \
		CC="$(TARGET_CC) $(TARGET_CFLAGS) -std=gnu99" \
		LD="$(TARGET_CROSS)ld -shared"
endef


define Package/luasec/install
	$(INSTALL_DIR) $(1)/usr/lib/lua
	$(INSTALL_DATA) $(PKG_BUILD_DIR)/src/{ssl.so,ssl.lua} $(1)/usr/lib/lua
endef

$(eval $(call BuildPackage,luasec))
