# 
# Copyright (C) 2006 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
# $Id$

include $(TOPDIR)/rules.mk

PKG_NAME:=libart
PKG_VERSION:=2.3.17
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)_lgpl-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=http://ftp.gnome.org/pub/gnome/sources/libart_lgpl/2.3
PKG_MD5SUM:=f1f6b3e5490f382535dccb288f5d8b14
PKG_CAT:=zcat

PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)_lgpl-$(PKG_VERSION)
PKG_INSTALL_DIR:=$(PKG_BUILD_DIR)/ipkg-install

include $(INCLUDE_DIR)/package.mk

define Package/libart
  SECTION:=libs
  CATEGORY:=Libraries
  TITLE:=An high-performance 2D graphics library
  DESCRIPTION:=\
	A library of functions for 2D graphics supporting a superset of the \\\
	PostScript imaging model, designed to be integrated with graphics, artwork, \\\
	and illustration programs. It is written in optimized C, and is fully \\\
	compatible with C++. With a small footprint of 10,000 lines of code, it is \\\
	especially suitable for embedded applications.
  URL:=http://www.levien.com/libart/
endef

define Build/Configure
	$(call Build/Configure/Default, \
		--enable-shared \
		--enable-static \
	)
endef

define Build/Compile
	$(MAKE) -C $(PKG_BUILD_DIR) \
		HOSTCC="$(HOSTCC)" \
		DESTDIR="$(PKG_INSTALL_DIR)" \
		all install
endef

define Build/InstallDev
	mkdir -p $(STAGING_DIR)/usr/bin
	$(CP) $(PKG_INSTALL_DIR)/usr/bin/libart2-config $(STAGING_DIR)/usr/bin/
	mkdir -p $(STAGING_DIR)/usr/include
	$(CP) $(PKG_INSTALL_DIR)/usr/include/libart-2.0 $(STAGING_DIR)/usr/include/
	mkdir -p $(STAGING_DIR)/usr/lib
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/libart_lgpl_2.{a,so*} $(STAGING_DIR)/usr/lib/
	mkdir -p $(STAGING_DIR)/usr/lib/pkgconfig
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/pkgconfig/libart-2.0.pc $(STAGING_DIR)/usr/lib/pkgconfig/
	$(SED) 's,-I$$$${includedir}/libart-2.0,,g' $(STAGING_DIR)/usr/lib/pkgconfig/libart-2.0.pc
	$(SED) 's,-L$$$${libdir},,g' $(STAGING_DIR)/usr/lib/pkgconfig/libart-2.0.pc
endef

define Build/UninstallDev
	rm -rf \
		$(STAGING_DIR)/usr/bin/libart2-config \
		$(STAGING_DIR)/usr/include/libart-2.0 \
		$(STAGING_DIR)/usr/lib/libart_lgpl_2.{a,so*} \
		$(STAGING_DIR)/usr/lib/pkgconfig/libart-2.0.pc
endef

define Package/libart/install
	$(INSTALL_DIR) $(1)/usr/lib
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/libart_lgpl_2.so.* $(1)/usr/lib/
endef

$(eval $(call BuildPackage,libart))
