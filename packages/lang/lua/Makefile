# 
# Copyright (C) 2006 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
# $Id$

include $(TOPDIR)/rules.mk

PKG_NAME:=lua
PKG_VERSION:=5.0.2
PKG_RELEASE:=1

PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)-$(PKG_VERSION)
PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=http://www.lua.org/ftp/ \
	http://ftp.gwdg.de/pub/languages/lua/ \
	http://mirrors.dotsrc.org/lua/ \
	http://www.tecgraf.puc-rio.br/lua/ftp/
PKG_MD5SUM:= dea74646b7e5c621fef7174df83c34b1
PKG_CAT:=zcat

PKG_INSTALL_DIR:=$(PKG_BUILD_DIR)/ipkg-install

include $(INCLUDE_DIR)/package.mk

define Package/liblua
  SECTION:=libs
  CATEGORY:=Libraries
  TITLE:=LUA programming language (libraries)
  DESCRIPTION:=LUA programming language (libraries).\\\
    Lua is a powerful light-weight programming language designed for extending \\\
    applications. Lua is also frequently used as a general-purpose, stand-alone \\\
    language. Lua is free software.\\\
    \\\
    This package contains the LUA shared libraries, needed by other programs.
  URL:=http://www.lua.org/
endef

define Package/lua
  SECTION:=utils
  CATEGORY:=Utilities
  DEPENDS:=+liblua
  TITLE:=LUA programming language (interpreter)
  DESCRIPTION:=LUA programming language (interpreter).\\\
    Lua is a powerful light-weight programming language designed for extending \\\
    applications. Lua is also frequently used as a general-purpose, stand-alone \\\
    language. Lua is free software.\\\
    \\\
    This package contains the LUA language interpreter.
  URL:=http://www.lua.org/
endef

define Package/lua-examples
  SECTION:=utils
  CATEGORY:=Utilities
  DEPENDS:=lua
  TITLE:=LUA programming language (examples)
  DESCRIPTION:=LUA programming language (examples).\\\
    Lua is a powerful light-weight programming language designed for extending \\\
    applications. Lua is also frequently used as a general-purpose, stand-alone \\\
    language. Lua is free software.\\\
    \\\
    This package contains LUA language examples.
  URL:=http://www.lua.org/
endef

define Package/luac
  SECTION:=utils
  CATEGORY:=Utilities
  DEPENDS:=+liblua
  TITLE:=LUA programming language (compiler)
  DESCRIPTION:=LUA programming language (compiler).\\\
    Lua is a powerful light-weight programming language designed for extending \\\
    applications. Lua is also frequently used as a general-purpose, stand-alone \\\
    language. Lua is free software.\\\
    \\\
    This package contains the LUA language compiler.
  URL:=http://www.lua.org/
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
		all so
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
		all
	rm -rf $(PKG_INSTALL_DIR)
	mkdir -p $(PKG_INSTALL_DIR)
	$(MAKE) -C $(PKG_BUILD_DIR) \
		INSTALL_ROOT="$(PKG_INSTALL_DIR)/usr" \
		install soinstall
endef

define Package/liblua/install
	install -d -m0755 $(1)/usr/lib
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/liblua{,lib}.so.* $(1)/usr/lib/
endef

define Package/lua/install
	install -d -m0755 $(1)/usr/bin
	$(CP) $(PKG_INSTALL_DIR)/usr/bin/lua $(1)/usr/bin/
endef

define Package/luac/install
	install -d -m0755 $(1)/usr/bin
	$(CP) $(PKG_INSTALL_DIR)/usr/bin/luac $(1)/usr/bin/
endef

define Package/lua-examples/install
	install -d -m0755 $(1)/usr/share/lua/examples
	install -m0644 $(PKG_BUILD_DIR)/test/*.lua \
		$(1)/usr/share/lua/examples/
endef

define Build/InstallDev
	mkdir -p $(STAGING_DIR)/usr/include
	$(CP) $(PKG_INSTALL_DIR)/usr/include/lua{,lib}.h $(STAGING_DIR)/usr/include/
	$(CP) $(PKG_INSTALL_DIR)/usr/include/lauxlib.h $(STAGING_DIR)/usr/include/
	mkdir -p $(STAGING_DIR)/usr/lib
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/liblua{,lib}.{a,so*} $(STAGING_DIR)/usr/lib/
endef

define Build/UninstallDev
	rm -rf \
		$(STAGING_DIR)/usr/include/lua{,lib}.h \
		$(STAGING_DIR)/usr/include/lauxlib.h \
		$(STAGING_DIR)/usr/lib/liblua{,lib}.{a,so*}
endef

$(eval $(call BuildPackage,liblua))
$(eval $(call BuildPackage,lua))
$(eval $(call BuildPackage,lua-examples))
$(eval $(call BuildPackage,luac))
