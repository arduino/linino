# 
# Copyright (C) 2006 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
# $Id$

include $(TOPDIR)/rules.mk

PKG_NAME:=dosfstools
PKG_VERSION:=2.11
PKG_RELEASE:=1

PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)-$(PKG_VERSION)
PKG_MD5SUM:=407d405ade410f7597d364ab5dc8c9f6
PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).src.tar.gz
PKG_SOURCE_URL:=ftp://ftp.uni-erlangen.de/pub/Linux/LOCAL/dosfstools/
PKG_CAT:=zcat

PKG_INSTALL_DIR:=$(PKG_BUILD_DIR)/ipkg-install

include $(INCLUDE_DIR)/package.mk

define Package/dosfstools
  SECTION:=utils
  CATEGORY:=Utilities
  TITLE:=MS-DOS FAT filesystems utilities
  DESCRIPTION:=MS-DOS FAT filesystems utilities.\\\
    Utilities to create and check MS-DOS FAT filesystems.
  URL:=ftp://ftp.uni-erlangen.de:/pub/Linux/LOCAL/dosfstools/
endef

define Build/Configure
endef

define Build/Compile
	rm -rf $(PKG_INSTALL_DIR)
	mkdir -p $(PKG_INSTALL_DIR)
	$(MAKE) -C $(PKG_BUILD_DIR) \
		$(TARGET_CONFIGURE_OPTS) \
		OPTFLAGS="$(TARGET_CFLAGS) -D_FILE_OFFSET_BITS=64" \
		PREFIX="$(PKG_INSTALL_DIR)" \
		all install
endef

define Package/dosfstools/install
	install -d -m0755 $(1)/sbin
	$(CP) $(PKG_INSTALL_DIR)/sbin/dosfsck $(1)/sbin/
	$(CP) $(PKG_INSTALL_DIR)/sbin/fsck.{msdos,vfat} $(1)/sbin/
	$(CP) $(PKG_INSTALL_DIR)/sbin/mkdosfs $(1)/sbin/
	$(CP) $(PKG_INSTALL_DIR)/sbin/mkfs.{msdos,vfat} $(1)/sbin/
endef

$(eval $(call BuildPackage,dosfstools))
