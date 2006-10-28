# 
# Copyright (C) 2006 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
# $Id$

include $(TOPDIR)/rules.mk

PKG_NAME:=libao
PKG_VERSION:=0.8.6
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=http://downloads.xiph.org/releases/ao/
PKG_MD5SUM:=12e136a4c0995068ff134997c84421ed
PKG_CAT:=zcat

PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)-$(PKG_VERSION)
PKG_INSTALL_DIR:=$(PKG_BUILD_DIR)/ipkg-install

include $(INCLUDE_DIR)/package.mk

define Package/libao
  SECTION:=libs
  DEPENDS:=+alsa-lib
  CATEGORY:=Libraries
  TITLE:=A cross platform audio library
  DESCRIPTION:=\
	Libao is a cross-platform audio library that allows programs to \\\
	output audio using a simple API on a wide variety of platforms.
  URL:=http://www.xiph.org/ao/
endef

define Build/Configure
	$(call Build/Configure/Default, \
		--enable-shared \
		--enable-static \
		--disable-esd \
		--disable-arts \
		--disable-nas \
		--disable-polyp \
	)
endef

define Build/Compile
	$(MAKE) -C $(PKG_BUILD_DIR) \
		DESTDIR="$(PKG_INSTALL_DIR)" \
		all install
endef

define Build/InstallDev
	mkdir -p $(STAGING_DIR)/usr/include
	$(CP) $(PKG_INSTALL_DIR)/usr/include/ao $(STAGING_DIR)/usr/include/
	mkdir -p $(STAGING_DIR)/usr/lib
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/libao.{a,so*} $(STAGING_DIR)/usr/lib/
	mkdir -p $(STAGING_DIR)/usr/lib/pkgconfig
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/pkgconfig/ao.pc $(STAGING_DIR)/usr/lib/pkgconfig/
	$(SED) 's,-I$$$${includedir},,g' $(STAGING_DIR)/usr/lib/pkgconfig/ao.pc
	$(SED) 's,-L$$$${libdir},,g' $(STAGING_DIR)/usr/lib/pkgconfig/ao.pc
endef

define Build/UninstallDev
	rm -rf \
		$(STAGING_DIR)/usr/include/ao \
		$(STAGING_DIR)/usr/lib/libao.{a,so*} \
		$(STAGING_DIR)/usr/lib/pkgconfig/ao.pc
endef

define Package/libao/install
	install -d -m0755 $(1)/usr/lib
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/libao.so.* $(1)/usr/lib/
endef

$(eval $(call BuildPackage,libao))
