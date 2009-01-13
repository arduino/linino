#
# Copyright (C) 2006 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
# $Id$

include $(TOPDIR)/rules.mk

PKG_NAME:=binutils
PKG_VERSION:=2.16.1
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.bz2
PKG_SOURCE_URL:=ftp://ftp.gnu.org/gnu/binutils
PKG_MD5SUM:=6a9d529efb285071dad10e1f3d2b2967

include $(INCLUDE_DIR)/package.mk

TARGETS:=$(GNU_TARGET_NAME)

define Package/libbfd
  SECTION:=libs
  CATEGORY:=Libraries
  TITLE:=The Binutils BFD library
  URL:=ftp://ftp.gnu.org/gnu/binutils
endef

define Build/Configure
	$(call Build/Configure/Default, \
		--enable-install-libbfd \
		--enable-commonbfdlib \
		--disable-nls \
		--enable-targets="$(TARGETS)" \
		, \
		, \
		bfd \
	)
endef

TARGET_CFLAGS += $(FPIC)

define Build/Compile
	$(MAKE) -C $(PKG_BUILD_DIR)/bfd \
		DESTDIR="$(PKG_INSTALL_DIR)" \
		all install
endef

define Build/InstallDev
	mkdir -p $(1)/usr/include
	$(CP)	$(PKG_INSTALL_DIR)/usr/include/ansidecl.h \
		$(PKG_INSTALL_DIR)/usr/include/bfd{,link}.h \
		$(PKG_INSTALL_DIR)/usr/include/symcat.h \
		$(1)/usr/include/
	mkdir -p $(1)/usr/lib
	$(CP)	$(PKG_INSTALL_DIR)/usr/lib/libbfd.a \
		$(1)/usr/lib/
endef

$(eval $(call BuildPackage,libbfd))
