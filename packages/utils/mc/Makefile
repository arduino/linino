# 
# Copyright (C) 2006-2009 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=mc
PKG_VERSION:=4.6.2
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=http://www.midnight-commander.org/downloads/
PKG_MD5SUM:=ec92966f4d0c8b50c344fe901859ae2a

include $(INCLUDE_DIR)/package.mk

define Package/mc
  SECTION:=utils
  CATEGORY:=Utilities
  DEPENDS:=+glib1 +libncurses
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
	--with-included-gettext \
	--with-ncurses \
	--without-sco \
	--without-sunos-curses \
	--without-osf1-curses \
	--without-vcurses \
	--without-gpm-mouse \
	--without-hsc \
	--without-termnet \
	--without-debug \
	--without-efence \
	--without-terminfo \
	--without-termcap \
	--without-slang \
	--without-vfs \
	--without-netrc \
	--without-ext2undel \
	--without-catgets \
	--without-x \
	--without-tk \
	--without-xview \
	--without-subshell \
	--disable-glibtest \
	--with-glib12 \
	--with-glib-prefix="$(STAGING_DIR)/usr" \


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
	ln -nsf mc $(1)/usr/bin/mcedit
endef

$(eval $(call BuildPackage,mc))
