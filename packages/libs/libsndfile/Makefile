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
	DESTDIR="$(PKG_INSTALL_DIR)"

define Build/Configure
	$(call Build/Configure/Default)
	$(call libtool_disable_rpath)
endef

define Build/Compile
	$(call Build/Compile/Default,all)
	$(call libtool_fixup_libdir,$(PKG_INSTALL_DIR))
	$(call Build/Compile/Default,install)
endef

define Build/InstallDev
	$(INSTALL_DIR) $(1)
	$(CP) $(PKG_INSTALL_DIR)/* $(1)/
endef

define Package/libsndfile/install
	$(INSTALL_DIR) $(1)/usr/lib/
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/libsndfile.so* $(1)/usr/lib/
endef

$(eval $(call BuildPackage,libsndfile))
