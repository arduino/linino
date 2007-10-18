# 
# Copyright (C) 2006 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
# $Id$

include $(TOPDIR)/rules.mk

PKG_NAME:=mc
PKG_VERSION:=4.6.1
PKG_RELEASE:=2

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=http://www.ibiblio.org/pub/Linux/utils/file/managers/mc/
PKG_MD5SUM:=18b20db6e40480a53bac2870c56fc3c4

PKG_BUILD_DEPENDS:=glib1 libncurses

include $(INCLUDE_DIR)/package.mk

define Package/mc
  SECTION:=utils
  CATEGORY:=Utilities
  DEPENDS:=+glib1 +libncurses
  TITLE:=midnight commander - a powerful file manager
  URL:=http://www.ibiblio.org/mc/
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
	--prefix=/usr \
	--disable-nls \
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
	, \
	PKG_CONFIG_PATH="$(STAGING_DIR)/usr/lib/pkgconfig"

define Package/mc/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/src/mc $(1)/usr/bin
	ln -sf mc $(1)/usr/bin/mcedit
endef

$(eval $(call BuildPackage,mc))
