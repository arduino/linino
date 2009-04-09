#
# Copyright (C) 2008 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
# $Id$

include $(TOPDIR)/rules.mk

PKG_NAME:=luafilesystem
PKG_VERSION:=1.4.1
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=http://luaforge.net/frs/download.php/3345
PKG_MD5SUM:=fe2fa6decc48f0267b4f09975750280e

include $(INCLUDE_DIR)/package.mk

define Package/liblua-filesystem
  SUBMENU:=LUA
  SECTION:=lang
  CATEGORY:=Languages
  TITLE:=luafilsystem - library for the LUA programming language
  URL:=http://www.luaforge.net/projects/luafilesystem
  DEPENDS:=+liblua
endef

define Package/luafilesystem/description
 This package contains the luafilesystem library, a set of portable
 functions for directory creation, listing and deletion and for file
 locking.
endef

define Build/Configure
endef

TARGET_CFLAGS += $(FPIC) \
	-I$(STAGING_DIR)/usr/include

TARGET_LDFLAGS += -llua

define Build/Compile
	$(MAKE) -C $(PKG_BUILD_DIR) \
		$(TARGET_CONFIGURE_OPTS) \
		CFLAGS="$(TARGET_CFLAGS)" \
		LDFLAGS="$(TARGET_LDFLAGS)"
	$(TARGET_CROSS)ar r $(PKG_BUILD_DIR)/src/liblua-filesystem.a $(PKG_BUILD_DIR)/src/lfs.o
endef

define Build/InstallDev
	mkdir -p $(STAGING_DIR)/usr/include
	mkdir -p $(STAGING_DIR)/usr/lib/lua/5.1/
	$(CP) $(PKG_BUILD_DIR)/src/lfs.h $(STAGING_DIR)/usr/include
	$(CP) $(PKG_BUILD_DIR)/src/lfs.so \
		$(STAGING_DIR)/usr/lib/liblua-filesystem.so.0.0.0
	cd $(STAGING_DIR)/usr/lib/ && \
		ln -fs liblua-filesystem.so.0.0.0 liblua-filesystem.so
	cd $(STAGING_DIR)/usr/lib/ && \
		ln -fs liblua-filesystem.so.0.0.0 liblua-filesystem.so.0
	cd $(STAGING_DIR)/usr/lib/lua/5.1/ && \
		ln -fs ../../liblua-filesystem.so.0.0.0 lfs.so
	$(CP) $(PKG_BUILD_DIR)/src/liblua-filesystem.a $(STAGING_DIR)/usr/lib
endef

define Package/liblua-filesystem/install
	$(INSTALL_DIR) $(1)/usr/lib/lua/5.1
	$(CP) $(PKG_BUILD_DIR)/src/lfs.so \
		$(1)/usr/lib/liblua-filesystem.so.0.0.0
	cd $(1)/usr/lib/ && ln -fs liblua-filesystem.so.0.0.0 liblua-filesystem.so
	cd $(1)/usr/lib/lua/5.1/ && \
		ln -fs ../../liblua-filesystem.so.0.0.0 lfs.so
endef

$(eval $(call BuildPackage,liblua-filesystem))
