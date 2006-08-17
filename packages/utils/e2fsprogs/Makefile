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

PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)-$(PKG_VERSION)
PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=@SF/e2fsprogs
PKG_MD5SUM:=d774d4412bfb80d12cf3a4fdfd59de5a
PKG_CAT:=zcat

PKG_INSTALL_DIR:=$(PKG_BUILD_DIR)/ipkg-install

include $(INCLUDE_DIR)/package.mk

define Package/e2fsprogs
  SECTION:=utils
  CATEGORY:=Utilities
  TITLE:=Ext2/3 filesystem utilities
  DESCRIPTION:=Ext2/3 filesystem utilities.\\\
    This package contains essential ext2 filesystem utilities which consists of \\\
    e2fsck, mke2fs, debugfs, dumpe2fs, tune2fs, and most of the other core ext2 \\\
    filesystem utilities.
  URL:=http://e2fsprogs.sourceforge.net/
endef

define Build/Configure
	(cd $(PKG_BUILD_DIR); rm -rf config.{cache,status}; \
		$(TARGET_CONFIGURE_OPTS) \
		CFLAGS="$(TARGET_CFLAGS)" \
		CPPFLAGS="-I$(STAGING_DIR)/usr/include" \
		LDFLAGS="-L$(STAGING_DIR)/lib -L$(STAGING_DIR)/usr/lib" \
		./configure \
			--target=$(GNU_TARGET_NAME) \
			--host=$(GNU_TARGET_NAME) \
			--build=$(GNU_HOST_NAME) \
			--program-prefix="" \
			--program-suffix="" \
			--prefix=/usr \
			--exec-prefix=/usr \
			--bindir=/usr/bin \
			--datadir=/usr/share \
			--includedir=/usr/include \
			--infodir=/usr/share/info \
			--libdir=/usr/lib \
			--libexecdir=/usr/lib \
			--localstatedir=/var \
			--mandir=/usr/share/man \
			--sbindir=/sbin \
			--sysconfdir=/etc \
			$(DISABLE_LARGEFILE) \
			$(DISABLE_NLS) \
			--enable-shared \
			--enable-static \
			--disable-rpath \
			--with-gnu-ld \
			--enable-elf-shlibs \
			--enable-dynamic-e2fsck \
	);
endef

define Build/Compile
	rm -rf $(PKG_INSTALL_DIR)
	mkdir -p $(PKG_INSTALL_DIR)
	$(MAKE) -C $(PKG_BUILD_DIR)/util \
		BUILDCC="$(HOSTCC)" \
		CFLAGS="" \
		subst
	$(MAKE) -C $(PKG_BUILD_DIR) \
		BUILDCC="$(HOSTCC)" \
		DESTDIR="$(PKG_INSTALL_DIR)" \
		all install
endef

define Package/e2fsprogs/install
	install -d -m0755 $(1)/sbin
	$(CP) $(PKG_INSTALL_DIR)/sbin/e2fsck $(1)/sbin/
	$(CP) $(PKG_INSTALL_DIR)/sbin/mke2fs $(1)/sbin/
	$(CP) $(PKG_INSTALL_DIR)/sbin/mkfs.ext{2,3} $(1)/sbin/
	$(CP) $(PKG_INSTALL_DIR)/sbin/tune2fs $(1)/sbin/
	$(CP) $(PKG_INSTALL_DIR)/sbin/resize2fs $(1)/sbin/
	install -d -m0755 $(1)/usr/lib
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/lib{blkid,com_err,e2p,ext2fs,uuid}.so.* $(1)/usr/lib/
endef

$(eval $(call BuildPackage,e2fsprogs))
