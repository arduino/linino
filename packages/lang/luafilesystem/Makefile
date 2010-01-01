#
# Copyright (C) 2008-2010 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=luafilesystem
PKG_VERSION:=1.4.2
PKG_RELEASE:=2

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=http://luaforge.net/frs/download.php/3931
PKG_MD5SUM:=8e7b2a9b899d669280456d0f95afd961

include $(INCLUDE_DIR)/package.mk

define Package/luafilesystem
  SUBMENU:=Lua
  SECTION:=lang
  CATEGORY:=Languages
  TITLE:=LuaFileSystem
  URL:=http://www.luaforge.net/projects/luafilesystem
  DEPENDS:=+liblua
endef

define Package/luafilesystem/description
 This package contains the LuaFileSystem library, a set of portable
 functions for directory creation, listing and deletion and for file
 locking.
endef

define Build/Configure
endef

TARGET_CFLAGS += $(FPIC) $(TARGET_CPPFLAGS)

TARGET_LDFLAGS += -llua

define Build/Compile
	$(MAKE) -C $(PKG_BUILD_DIR) \
		$(TARGET_CONFIGURE_OPTS) \
		CFLAGS="$(TARGET_CFLAGS) -std=gnu99" \
		LDFLAGS="$(TARGET_LDFLAGS)"
	$(TARGET_CROSS)ar r $(PKG_BUILD_DIR)/src/luafilesystem.a $(PKG_BUILD_DIR)/src/lfs.o
endef

define Build/InstallDev
	$(INSTALL_DIR) $(STAGING_DIR)/usr/include
	$(INSTALL_DIR) $(STAGING_DIR)/usr/lib/lua
	$(INSTALL_DATA) $(PKG_BUILD_DIR)/src/lfs.h $(STAGING_DIR)/usr/include
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/src/lfs.so $(STAGING_DIR)/usr/lib/lua
	$(INSTALL_DATA) $(PKG_BUILD_DIR)/src/luafilesystem.a $(STAGING_DIR)/usr/lib/lua
endef

define Package/luafilesystem/install
	$(INSTALL_DIR) $(1)/usr/lib/lua
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/src/lfs.so $(1)/usr/lib/lua/lfs.so
endef

$(eval $(call BuildPackage,luafilesystem))
