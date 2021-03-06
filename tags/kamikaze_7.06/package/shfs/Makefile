# 
# Copyright (C) 2006 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
# $Id$

include $(TOPDIR)/rules.mk
include $(INCLUDE_DIR)/kernel.mk

PKG_NAME:=shfs
PKG_VERSION:=0.35
PKG_RELEASE:=2

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=@SF/shfs
PKG_MD5SUM:=016f49d71bc32eee2b5d11fc1600cfbe

include $(INCLUDE_DIR)/package.mk

define Package/shfs/Default
  TITLE:=ShFS
  DESCRIPTION:=\
	ShFS is a simple and easy to use Linux kernel module which allows you to \\\
	mount remote filesystems using a plain shell (SSH) connection. When using \\\
	ShFS, you can access all remote files just like the local ones, only the \\\
	access is governed through the transport security of SSH.
  URL:=http://shfs.sourceforge.net/
endef

define KernelPackage/shfs
  $(call Package/shfs/Default)
  TITLE+= (kernel module)
  DESCRIPTION+=\\\
	\\\
	This package contains the ShFS kernel module.
  FILES:=$(PKG_INSTALL_DIR)/lib/modules/$(LINUX_VERSION)/kernel/fs/shfs/shfs.$(LINUX_KMOD_SUFFIX)
  SUBMENU:=Filesystems
  VERSION:=$(LINUX_VERSION)+$(PKG_VERSION)-$(BOARD)-$(PKG_RELEASE)
  AUTOLOAD:=$(call AutoLoad,40,shfs)
endef

define Package/shfs-utils
  $(call Package/shfs/Default)
  SECTION:=utils
  CATEGORY:=Utilities
  DEPENDS+=+kmod-shfs
  TITLE+= (utilities)
  DESCRIPTION+=\\\
	\\\
	This package contains the ShFS utilities.
endef

define Build/Compile
	$(MAKE) -C $(PKG_BUILD_DIR) \
		ARCH="$(LINUX_KARCH)" \
		CROSS_COMPILE="$(TARGET_CROSS)" \
		OFLAGS="$(TARGET_CFLAGS)" \
		CC="$(TARGET_CC)" \
		LINKER="$(TARGET_CC)" \
		KERNEL="$(LINUX_VERSION)" \
		KERNEL_SOURCES="$(LINUX_DIR)" \
		ROOT="$(PKG_INSTALL_DIR)" \
		module module-install
	$(MAKE) -C $(PKG_BUILD_DIR) \
		OFLAGS="$(TARGET_CFLAGS)" \
		CC="$(TARGET_CC)" \
		LINKER="$(TARGET_CC)" \
		KERNEL_SOURCES="$(LINUX_DIR)" \
		ROOT="$(PKG_INSTALL_DIR)" \
		utils utils-install
endef

define Package/shfs-utils/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(CP) $(PKG_INSTALL_DIR)/usr/bin/shfs{,u}mount $(1)/usr/bin/
	$(INSTALL_DIR) $(1)/sbin
	$(CP) $(PKG_INSTALL_DIR)/sbin/mount.shfs $(1)/sbin/
endef

$(eval $(call KernelPackage,shfs))
$(eval $(call BuildPackage,shfs-utils))
