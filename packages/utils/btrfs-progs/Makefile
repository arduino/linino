#
# Copyright (C) 2009 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=btrfs-progs
PKG_VERSION:=0.18
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=http://www.kernel.org/pub/linux/kernel/people/mason/btrfs/
PKG_MD5SUM:=1dfe59152a558eb2f79a4c398de6c4ef

include $(INCLUDE_DIR)/package.mk

define Package/btrfs-progs
  SECTION:=utils
  CATEGORY:=Utilities
  DEPENDS:=+libuuid +zlib
  TITLE:=Btrfs filesystems utilities
  URL:=http://btrfs.wiki.kernel.org/
endef

define Package/btrfs-progs/description
 Btrfs is a new copy on write filesystem for Linux aimed at implementing
 advanced features while focusing on fault tolerance, repair and easy
 administration. Initially developed by Oracle, Btrfs is licensed under the
 GPL and open for contribution from anyone. 
endef

progs = btrfsctl btrfsck mkfs.btrfs btrfs-debug-tree btrfs-show btrfs-vol \
	btrfstune btrfs-image

define Build/Compile
	$(MAKE) -C $(PKG_BUILD_DIR) \
		CC=$(TARGET_CC) \
		CFLAGS="$(TARGET_CPPFLAGS) $(TARGET_CFLAGS)" \
		LDFLAGS="$(TARGET_LDFLAGS)" \
		prefix=/usr \
		DESTDIR=$(PKG_INSTALL_DIR) \
		all install
endef

define Package/btrfs-progs/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_BIN) $(addprefix $(PKG_INSTALL_DIR)/usr/bin/, $(progs)) $(1)/usr/bin/
endef

$(eval $(call BuildPackage,btrfs-progs))
