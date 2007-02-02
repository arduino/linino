# 
# Copyright (C) 2006 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
# $Id$

include $(TOPDIR)/rules.mk

PKG_NAME:=libmad
PKG_VERSION:=0.15.1b
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=@SF/mad \
	ftp://ftp.mars.org/pub/mpeg/
PKG_MD5SUM:=1be543bc30c56fb6bea1d7bf6a64e66c
PKG_CAT:=zcat

PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)-$(PKG_VERSION)
PKG_INSTALL_DIR:=$(PKG_BUILD_DIR)/ipkg-install

include $(INCLUDE_DIR)/package.mk

FPM:=default
ifeq ($(ARCH),armeb)
  FPM:=arm
endif
ifeq ($(ARCH),i386)
  FPM:=intel
endif
ifeq ($(ARCH),mipsel)
  FPM:=mips
endif

define Package/libmad
  SECTION:=libs
  CATEGORY:=Libraries
  TITLE:=An high-quality MPEG audio decoding library
  DESCRIPTION:=\
	MAD is a high-quality MPEG audio decoder. It currently supports \\\
	MPEG-1 and the MPEG-2 extension to lower sampling frequencies, \\\
	as well as the de facto MPEG 2.5 format. All three audio layers - \\\
	Layer I, Layer II, and Layer III (i.e. MP3) - are fully implemented.
  URL:=http://www.underbit.com/products/mad/
endef

define Build/Configure
	$(call Build/Configure/Default, \
		--enable-shared \
		--enable-static \
		--enable-fpm="$(FPM)" \
		--disable-debugging \
		--enable-speed \
	)
endef

define Build/Compile
	$(MAKE) -C $(PKG_BUILD_DIR) \
		DESTDIR="$(PKG_INSTALL_DIR)" \
		all install
endef

define Build/InstallDev
	mkdir -p $(STAGING_DIR)/usr/include
	$(CP) $(PKG_INSTALL_DIR)/usr/include/mad.h $(STAGING_DIR)/usr/include/
	mkdir -p $(STAGING_DIR)/usr/lib
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/libmad.{a,so*} $(STAGING_DIR)/usr/lib/
endef

define Build/UninstallDev
	rm -rf \
		$(STAGING_DIR)/usr/include/mad.h \
		$(STAGING_DIR)/usr/lib/libmad.{a,so*}
endef

define Package/libmad/install
	$(INSTALL_DIR) $(1)/usr/lib
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/libmad.so.* $(1)/usr/lib/
endef

$(eval $(call BuildPackage,libmad))
