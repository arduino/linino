# 
# Copyright (C) 2006-2009 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=mc
PKG_VERSION:=4.7.5.1
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=http://www.midnight-commander.org/downloads/
PKG_MD5SUM:=e673b7ec0191e4061b5d8b69368aa113

include $(INCLUDE_DIR)/package.mk
include $(INCLUDE_DIR)/nls.mk

define Package/mc
  SECTION:=utils
  CATEGORY:=Utilities
  DEPENDS:=+glib2 +libncurses +libiconv
  TITLE:=midnight commander - a powerful file manager
  URL:=http://www.midnight-commander.org/
  SUBMENU:=filemanager
endef

define Package/mc/description
	GNU Midnight Commander is a text-mode full-screen file manager. 
	It uses a two panel interface and a subshell for command execution. 
	It includes an internal editor with syntax highlighting and an 
	internal viewer with support for binary files. Also included is 
	Virtual Filesystem (VFS), that allows files on remote systems 
	(e.g. FTP, SSH, SMB servers) and files inside archives to be 
	manipulated like real files.
endef

CONFIGURE_ARGS += \
	--without-edit \
	--without-gpm-mouse \
	--without-subshell \
	--without-x \
	--disable-vfs \
	--with-screen=ncurses

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
endef

$(eval $(call BuildPackage,mc))
