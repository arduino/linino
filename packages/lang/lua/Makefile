# 
# Copyright (C) 2006 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
# $Id$

include $(TOPDIR)/rules.mk

PKG_NAME:=lua
PKG_VERSION:=5.1.1
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=http://www.lua.org/ftp/ \
	http://ftp.gwdg.de/pub/languages/lua/ \
	http://mirrors.dotsrc.org/lua/ \
	http://www.tecgraf.puc-rio.br/lua/ftp/
PKG_MD5SUM:=22f4f912f20802c11006fe9b84d5c461
PKG_CAT:=zcat

PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)-$(PKG_VERSION)
PKG_INSTALL_DIR:=$(PKG_BUILD_DIR)/ipkg-install

include $(INCLUDE_DIR)/package.mk

define Package/lua/Default
  SECTION:=lang
  CATEGORY:=Languages
  TITLE:=LUA programming language
  DESCRIPTION:=\
	Lua is a powerful light-weight programming language designed for extending \\\
	applications. Lua is also frequently used as a general-purpose, stand-alone \\\
	language. Lua is free software.
  URL:=http://www.lua.org/
endef

define Package/liblua
  $(call Package/lua/Default)
  SECTION:=libs
  CATEGORY:=Libraries
  TITLE+= (libraries)
  DESCRIPTION+=\\\
	\\\
	This package contains the LUA shared libraries, needed by other programs.
endef

define Package/lua
  $(call Package/lua/Default)
  DEPENDS:=+liblua +libreadline +libncurses
  TITLE+= (interpreter)
  DESCRIPTION+=\\\
	\\\
	This package contains the LUA language interpreter.
endef

define Package/luac
  $(call Package/lua/Default)
  DEPENDS:=+liblua
  TITLE+= (compiler)
  DESCRIPTION+=\\\
	\\\
	This package contains the LUA language compiler.
endef

define Package/lua-examples
  $(call Package/lua/Default)
  DEPENDS:=lua
  TITLE+= (examples)
  DESCRIPTION+=\\\
	\\\
	This package contains LUA language examples.
endef

define Build/Configure
endef

define Build/Compile
	$(MAKE) -C $(PKG_BUILD_DIR) \
		CC="$(TARGET_CROSS)gcc" \
		LD="$(TARGET_CROSS)ld" \
		AR="$(TARGET_CROSS)ar rcu" \
		RANLIB="$(TARGET_CROSS)ranlib" \
		INSTALL_ROOT=/usr \
		MYCFLAGS="-I$(STAGING_DIR)/usr/include $(TARGET_CFLAGS)" \
		MYLDFLAGS="-L$(STAGING_DIR)/usr/lib" \
		PKG_VERSION=$(PKG_VERSION) \
		all linux 
	# remove statically linked binaries, so that they will get linked against shlib this time
	rm -f $(PKG_BUILD_DIR)/bin/lua{,c}
	$(MAKE) -C $(PKG_BUILD_DIR) \
		CC="$(TARGET_CROSS)gcc" \
		LD="$(TARGET_CROSS)ld" \
		AR="$(TARGET_CROSS)ar rcu" \
		RANLIB="$(TARGET_CROSS)ranlib" \
		INSTALL_ROOT=/usr \
		MYCFLAGS="-I$(STAGING_DIR)/usr/include $(TARGET_CFLAGS)" \
		MYLDFLAGS="-L$(STAGING_DIR)/usr/lib" \
		all linux
	rm -rf $(PKG_INSTALL_DIR)
	mkdir -p $(PKG_INSTALL_DIR)
	$(MAKE) -C $(PKG_BUILD_DIR) \
		INSTALL_TOP="$(PKG_INSTALL_DIR)/usr" \
		install
endef

define Build/InstallDev
	mkdir -p $(STAGING_DIR)/usr/include
	$(CP) $(PKG_INSTALL_DIR)/usr/include/lua{,lib,conf}.h $(STAGING_DIR)/usr/include/
	$(CP) $(PKG_INSTALL_DIR)/usr/include/lauxlib.h $(STAGING_DIR)/usr/include/
	mkdir -p $(STAGING_DIR)/usr/lib
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/liblua{,lib}.{a,so*} $(STAGING_DIR)/usr/lib/
endef

define Build/UninstallDev
	rm -rf \
		$(STAGING_DIR)/usr/include/lua{,lib,conf}.h \
		$(STAGING_DIR)/usr/include/lauxlib.h \
		$(STAGING_DIR)/usr/lib/liblua{,lib}.{a,so*}
endef

define Package/liblua/install
	$(INSTALL_DIR) $(1)/usr/lib
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/liblua{,lib}.so.* $(1)/usr/lib/
endef

define Package/lua/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(CP) $(PKG_INSTALL_DIR)/usr/bin/lua $(1)/usr/bin/
endef

define Package/luac/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(CP) $(PKG_INSTALL_DIR)/usr/bin/luac $(1)/usr/bin/
endef

define Package/lua-examples/install
	$(INSTALL_DIR) $(1)/usr/share/lua/examples
	$(INSTALL_DATA) $(PKG_BUILD_DIR)/test/*.lua \
		$(1)/usr/share/lua/examples/
endef

$(eval $(call BuildPackage,liblua))
$(eval $(call BuildPackage,lua))
$(eval $(call BuildPackage,luac))
$(eval $(call BuildPackage,lua-examples))
