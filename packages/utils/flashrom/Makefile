# 
# Copyright (C) 2010 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=flashrom
PKG_VERSION:=0.9.1
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.bz2
PKG_SOURCE_URL:=http://qa.coreboot.org/releases/
PKG_MD5SUM:=2b7cc0e45a0ac4c6d43c0f7cd05b041a

include $(INCLUDE_DIR)/package.mk


define Package/flashrom
  SECTION:=utils
  CATEGORY:=Utilities
  TITLE:=FlashROM Utility
  URL:=http://www.flashrom.org/
# XXX: needs <sys/io.h>, only available on theese arch right now
  DEPENDS:=+zlib +pciutils @(arm||armeb||i386||i686||x86_64)
endef

define Package/flashrom/description
 flashrom is a utility for identifying, reading, writing, verifying
 and erasing flash chips. It's often used to flash BIOS/EFI/coreboot
 /firmware images. 
endef

define Package/flashrom/install
	$(INSTALL_DIR) $(1)/usr/sbin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/flashrom $(1)/usr/sbin/
endef

$(eval $(call BuildPackage,flashrom))
