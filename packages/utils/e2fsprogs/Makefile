# 
# Copyright (C) 2006 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
# $Id$

include $(TOPDIR)/rules.mk

PKG_NAME:=e2fsprogs
PKG_VERSION:=1.38
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=@SF/e2fsprogs
PKG_MD5SUM:=d774d4412bfb80d12cf3a4fdfd59de5a
PKG_CAT:=zcat

PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)-$(PKG_VERSION)
PKG_INSTALL_DIR:=$(PKG_BUILD_DIR)/ipkg-install

include $(INCLUDE_DIR)/package.mk

define Package/e2fsprogs
  SECTION:=utils
  CATEGORY:=Utilities
  TITLE:=Ext2/3 filesystem utilities
  DESCRIPTION:=\
	This package contains essential ext2 filesystem utilities which consists of \\\
	e2fsck, mke2fs, debugfs, dumpe2fs, tune2fs, and most of the other core ext2 \\\
	filesystem utilities.
  URL:=http://e2fsprogs.sourceforge.net/
endef

define Build/Configure
	$(call Build/Configure/Default, \
		--enable-shared \
		--enable-static \
		--disable-rpath \
		--enable-elf-shlibs \
		--enable-dynamic-e2fsck \
	)
endef

define Build/Compile
	$(MAKE) -C $(PKG_BUILD_DIR)/util \
		BUILDCC="$(HOSTCC)" \
		CFLAGS="" \
		CPPFLAGS="" \
		LDFLAGS="" \
		subst
	$(MAKE) -C $(PKG_BUILD_DIR) \
		BUILDCC="$(HOSTCC)" \
		DESTDIR="$(PKG_INSTALL_DIR)" \
		all install
endef

define Package/e2fsprogs/install
	$(INSTALL_DIR) $(1)/usr/sbin
	$(CP) $(PKG_INSTALL_DIR)/usr/sbin/e2fsck $(1)/usr/sbin/
	ln -sf mkfs.ext2 $(1)/usr/sbin/mke2fs
	$(CP) $(PKG_INSTALL_DIR)/usr/sbin/mkfs.ext{2,3} $(1)/usr/sbin/
	$(CP) $(PKG_INSTALL_DIR)/usr/sbin/tune2fs $(1)/usr/sbin/
	$(CP) $(PKG_INSTALL_DIR)/usr/sbin/resize2fs $(1)/usr/sbin/
	$(INSTALL_DIR) $(1)/usr/lib
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/lib{blkid,com_err,e2p,ext2fs,uuid}.so.* $(1)/usr/lib/
endef

$(eval $(call BuildPackage,e2fsprogs))
