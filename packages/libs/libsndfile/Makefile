# 
# Copyright (C) 2007 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
# $Id$

include $(TOPDIR)/rules.mk

PKG_NAME:=libsndfile
PKG_VERSION:=1.0.17
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=http://www.mega-nerd.com/libsndfile/
PKG_MD5SUM:=2d126c35448503f6dbe33934d9581f6b

PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)-$(PKG_VERSION)
PKG_INSTALL_DIR:=$(PKG_BUILD_DIR)/ipkg-install

include $(INCLUDE_DIR)/package.mk

define Package/libsndfile
  SECTION:=libs
  CATEGORY:=Libraries
  TITLE:=Library for reading/writing audio files
  URL:=http://www.mega-nerd.com/libsndfile/
endef

define Package/libsndfile/description
	libsndfile is a library of C routines for reading and writing files 
	containing sampled audio data.
endef

CONFIGURE_ARGS += \
	--disable-flac

MAKE_FLAGS += \
	DESTDIR="$(PKG_INSTALL_DIR)" \
	all install

define Build/InstallDev
	$(INSTALL_DIR) $(1)/usr/include/
	$(CP) $(PKG_INSTALL_DIR)/usr/include/* $(1)/usr/include/
	$(INSTALL_DIR) $(1)/usr/lib/
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/libsndfile.* $(1)/usr/lib/
	$(INSTALL_DIR) $(1)/usr/lib/pkgconfig/
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/pkgconfig/sndfile.pc $(1)/usr/lib/pkgconfig/
endef

define Build/UninstallDev
	rm -rf \
		$(STAGING_DIR)/usr/include/sndfile* \
		$(STAGING_DIR)/usr/lib/libsndfile.{a,so*,la} \
		$(STAGING_DIR)/usr/lib/pkgconfig/sndfile.pc
endef

define Package/libsndfile/install
	$(INSTALL_DIR) $(1)/usr/lib/
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/libsndfile.so* $(1)/usr/lib/
endef

$(eval $(call BuildPackage,libsndfile))
