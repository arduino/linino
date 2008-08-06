# 
# Copyright (C) 2007 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
# $Id: $

include $(TOPDIR)/rules.mk

PKG_NAME:=libatomicops
PKG_VERSION:=1.2
PKG_RELEASE:=1

PKG_SOURCE:=libatomic_ops-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=http://www.hpl.hp.com/research/linux/atomic_ops/download/
PKG_MD5SUM:=1b65e48271c81e3fa2d7a9a69bab7504

PKG_BUILD_DIR:=$(BUILD_DIR)/libatomic_ops-$(PKG_VERSION)

include $(INCLUDE_DIR)/package.mk

define Package/libatomicops
  SECTION:=libs
  CATEGORY:=Libraries
  TITLE:=implementations for atomic memory update operations
  DEPENDS:=@!TARGET_avr32
  URL:=http://www.hpl.hp.com/research/linux/atomic_ops/
endef

define Package/libatomicops/description
  Provides implementations for atomic memory update
  operations on a number of architectures. This allows
  direct use of these in reasonably portable code. Unlike
  earlier similar packages, this one explicitly considers
  memory barrier semantics, and allows the construction of
  code that involves minimum overhead across a variety of
  architectures.
endef

TARGET_CFLAGS += $(FPIC)

CONFIGURE_ARGS += \
	--enable-shared \
	--enable-static \

define Build/Compile
	$(MAKE) -C $(PKG_BUILD_DIR) \
		DESTDIR="$(PKG_INSTALL_DIR)" \
		all install
endef

define Build/InstallDev
	mkdir -p $(1)/usr/include/
	$(CP) $(PKG_INSTALL_DIR)/usr/include/* $(1)/usr/include/
	$(CP) $(PKG_BUILD_DIR)/src/atomic_ops $(1)/usr/include/
	mkdir -p $(1)/usr/lib
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/libatomic_ops*.a $(1)/usr/lib/
endef

$(eval $(call BuildPackage,libatomicops))
