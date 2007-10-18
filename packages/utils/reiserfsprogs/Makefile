# 
# Copyright (C) 2006 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
# $Id$

include $(TOPDIR)/rules.mk

PKG_NAME:=reiserfsprogs
PKG_VERSION:=3.6.19
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=ftp://ftp.namesys.com/pub/reiserfsprogs
PKG_MD5SUM:=b42cf15f6651c3ceff5cb84996c0d539

PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)-$(PKG_VERSION)
PKG_INSTALL_DIR:=$(PKG_BUILD_DIR)/ipkg-install

include $(INCLUDE_DIR)/package.mk

define Package/reiserfsprogs
  SECTION:=utils
  CATEGORY:=Utilities
  TITLE:=ReiserFS filesystems utilities
  URL:=http://www.namesys.com/
  SUBMENU:=filesystem
endef

define Package/reiserfsprogs/description
	This package contains utilities to create, check, resize, and debug 
	ReiserFS filesystems.
endef

#use Build/Configure/Default

define Build/Compile
	$(MAKE) -C $(PKG_BUILD_DIR) \
		DESTDIR="$(PKG_INSTALL_DIR)" \
		all install
endef

define Package/reiserfsprogs/install
	$(INSTALL_DIR) $(1)/usr/sbin
	$(CP) $(PKG_INSTALL_DIR)/usr/sbin/debugreiserfs $(1)/usr/sbin/
	$(CP) $(PKG_INSTALL_DIR)/usr/sbin/mkreiserfs $(1)/usr/sbin/
	$(CP) $(PKG_INSTALL_DIR)/usr/sbin/reiserfsck $(1)/usr/sbin/
	$(CP) $(PKG_INSTALL_DIR)/usr/sbin/reiserfstune $(1)/usr/sbin/
	$(CP) $(PKG_INSTALL_DIR)/usr/sbin/resize_reiserfs $(1)/usr/sbin/
	ln -sf mkreiserfs $(1)/usr/sbin/mkfs.reiserfs
	ln -sf reiserfsck $(1)/usr/sbin/fsck.reiserfs
endef

$(eval $(call BuildPackage,reiserfsprogs))
