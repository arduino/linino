# 
# Copyright (C) 2006 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
# $Id$

include $(TOPDIR)/rules.mk

PKG_NAME:=flac
PKG_VERSION:=1.1.2
PKG_RELEASE:=1

PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)-$(PKG_VERSION)
PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=@SF/flac
PKG_MD5SUM:=2bfc127cdda02834d0491ab531a20960
PKG_CAT:=zcat

PKG_INSTALL_DIR:=$(PKG_BUILD_DIR)/ipkg-install

include $(INCLUDE_DIR)/package.mk

define Package/libflac
  SECTION:=libs
  CATEGORY:=Libraries
  TITLE:=Free Lossless Audio Codec library
  DESCRIPTION:=Free Lossless Audio Codec (FLAC) library.
  URL:=ttp://flac.sourceforge.net/
endef

define Build/Configure
endef

define Build/Compile
	rm -rf $(PKG_INSTALL_DIR)
	mkdir -p $(PKG_INSTALL_DIR)
	$(MAKE) -C $(PKG_BUILD_DIR) -f Makefile.lite \
		$(TARGET_CONFIGURE_OPTS) \
		RELEASE_CFLAGS="$(TARGET_CFLAGS)" \
		libFLAC
endef

define Package/libflac/install
	install -m0755 -d $(1)/usr/lib
	$(CP) $(PKG_BUILD_DIR)/obj/release/lib/libFLAC.so $(1)/usr/lib/
endef

define Build/InstallDev
	mkdir -p $(STAGING_DIR)/usr/include
	$(CP) $(PKG_BUILD_DIR)/include/FLAC $(STAGING_DIR)/usr/include/
	mkdir -p $(STAGING_DIR)/usr/lib
	$(CP) $(PKG_BUILD_DIR)/obj/release/lib/libFLAC.{a,so} $(STAGING_DIR)/usr/lib/
endef

define Build/UninstallDev
	rm -rf \
		$(STAGING_DIR)/usr/include/FLAC \
		$(STAGING_DIR)/usr/lib/libFLAC.{a,so}
endef

$(eval $(call BuildPackage,libflac))
