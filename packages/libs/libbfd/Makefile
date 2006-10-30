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
PKG_CAT:=bzcat

PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)-$(PKG_VERSION)
PKG_INSTALL_DIR:=$(PKG_BUILD_DIR)/ipkg-install

include $(INCLUDE_DIR)/package.mk

TARGETS:=$(GNU_TARGET_NAME)

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

define Build/Compile
	$(MAKE) -C $(PKG_BUILD_DIR)/bfd \
		DESTDIR="$(PKG_INSTALL_DIR)" \
		all install
endef

define Build/InstallDev
	mkdir -p $(STAGING_DIR)/usr/include
	$(CP)	$(PKG_INSTALL_DIR)/usr/include/ansidecl.h \
		$(PKG_INSTALL_DIR)/usr/include/bfd{,link}.h \
		$(PKG_INSTALL_DIR)/usr/include/symcat.h \
		$(STAGING_DIR)/usr/include/
	mkdir -p $(STAGING_DIR)/usr/lib
	$(CP)	$(PKG_INSTALL_DIR)/usr/lib/libbfd.a \
		$(STAGING_DIR)/usr/lib/
endef

define Build/UninstallDev
	rm -f \
		$(STAGING_DIR)/usr/include/ansidecl.h \
		$(STAGING_DIR)/usr/include/bfd{,link}.h \
		$(STAGING_DIR)/usr/include/symcat.h \
		$(STAGING_DIR)/usr/lib/libbfd.a
endef

$(eval $(call Build/DefaultTargets))
