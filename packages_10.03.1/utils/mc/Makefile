# 
# Copyright (C) 2006-2011 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=mc
PKG_VERSION:=4.7.5.2
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=http://www.midnight-commander.org/downloads/
PKG_MD5SUM:=9fdfe7c0fcff362436eb35fcd1adf0fd

PKG_BUILD_PARALLEL:=1

include $(INCLUDE_DIR)/package.mk
include $(INCLUDE_DIR)/nls.mk

define Package/mc
  SECTION:=utils
  CATEGORY:=Utilities
  DEPENDS:=+glib2 +libncurses +libiconv
  TITLE:=midnight commander - a powerful file manager
  URL:=http://www.midnight-commander.org/
  SUBMENU:=filemanager
  MAINTAINER:=Luka Perkov <openwrt@lukaperkov.net>
endef

define Package/mc/description
 GNU Midnight Commander is a visual file manager, licensed under GNU General
 Public License and therefore qualifies as Free Software. It's a feature rich
 full-screen text mode application that allows you to copy, move and delete
 files and whole directory trees, search for files and run commands in the
 subshell.
endef

CONFIGURE_ARGS += \
	--enable-utf8 \
	--disable-vfs \
	--with-screen=ncurses \
	--without-edit \
	--without-gpm-mouse \
	--without-subshell \
	--without-x

AM_HOST=$(firstword $(wildcard $(STAGING_DIR_HOST)/share/automake-*))

define Build/Prepare
	$(Build/Prepare/Default)
	for script in config.guess config.sub depcomp install-sh missing; do \
		rm -f $(PKG_BUILD_DIR)/config/$$$$script; \
		ln -s $(AM_HOST)/$$$$script $(PKG_BUILD_DIR)/config/$$$$script; \
	done
endef

define Package/mc/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/src/mc $(1)/usr/bin/
	$(INSTALL_DIR) $(1)/etc/mc
	$(INSTALL_DATA) $(PKG_BUILD_DIR)/misc/mc.menu $(1)/etc/mc
	$(INSTALL_DIR) $(1)/etc/mc/skins
	$(INSTALL_DATA) $(PKG_BUILD_DIR)/misc/skins/default.ini $(1)/etc/mc/skins
endef

define Package/mc/conffiles
/etc/mc/mc.menu
/etc/mc/skins/default.ini
endef

$(eval $(call BuildPackage,mc))
