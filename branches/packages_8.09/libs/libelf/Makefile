# 
# Copyright (C) 2006 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
# $Id$

include $(TOPDIR)/rules.mk

PKG_NAME:=libelf
PKG_VERSION:=0.8.10
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=http://www.mr511.de/software/
PKG_MD5SUM:=9db4d36c283d9790d8fa7df1f4d7b4d9

include $(INCLUDE_DIR)/package.mk

define Package/libelf
  SECTION:=libs
  CATEGORY:=Libraries
  TITLE:=ELF object file access library
  URL:=http://www.stud.uni-hannover.de/~michael/software/
endef

TARGET_CFLAGS += $(FPIC)

CONFIGURE_ARGS += \
	--enable-shared \
	--enable-static \
	--enable-elf64=yes \

CONFIGURE_VARS += \
	mr_cv_target_elf=yes \
	libelf_64bit=yes \
	libelf_cv_struct_elf64_ehdr=yes \
	libelf_cv_type_elf64_addr=no \
	libelf_cv_struct_elf64_rel=yes \

define Build/Compile
	$(MAKE) -C $(PKG_BUILD_DIR) \
		instroot="$(PKG_INSTALL_DIR)" \
		all install
endef

define Build/InstallDev
	mkdir -p $(1)/usr/include
	$(CP) $(PKG_INSTALL_DIR)/usr/include/libelf* $(1)/usr/include/
	mkdir -p $(1)/usr/lib
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/libelf.{a,so*} $(1)/usr/lib/
	mkdir -p $(1)/usr/lib/pkgconfig
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/pkgconfig/libelf.pc $(1)/usr/lib/pkgconfig/
endef

define Package/libelf/install
	$(INSTALL_DIR) $(1)/usr/lib
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/libelf.so.* $(1)/usr/lib/
endef

$(eval $(call BuildPackage,libelf))
