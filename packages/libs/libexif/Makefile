# 
# Copyright (C) 2006 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
#  Makefile for libexif
# $Id: $

include $(TOPDIR)/rules.mk

PKG_NAME:=libexif
PKG_VERSION:=0.6.13
PKG_RELEASE:=1

PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)-$(PKG_VERSION)
PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.bz2
PKG_SOURCE_URL:=@SF/libexif
PKG_MD5SUM:=1b1e2b495c5aa20c08725f30545a110b
PKG_CAT:=bzcat

PKG_INSTALL_DIR:=$(PKG_BUILD_DIR)/ipkg-install

include $(INCLUDE_DIR)/package.mk

define Package/libexif
  SECTION:=libs
  CATEGORY:=Libraries
  TITLE:=library for jpeg files with exif tags
  DESCRIPTION:=library for jpeg files with exif tags\\\
  URL:=http://libexif.sourceforge.net/
endef

BIG_ENDIAN:=no
ifeq ($(CONFIG_BIG_ENDIAN),y)
BIG_ENDIAN:=yes
endif

define Build/Configure
$(call Build/Configure/Default,--enable-shared \
	--enable-static \
	--without-libiconv-prefix,ac_cv_c_bigendian=$(BIG_ENDIAN))
endef

define Build/Compile
$(call Build/Compile/Default, \
	DESTDIR="$(PKG_INSTALL_DIR)" \
	all install \
)
endef

define Package/libexif/install
	install -m0755 -d $(1)/usr/lib
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/libexif*.so.* $(1)/usr/lib/
endef

define Build/InstallDev
	mkdir -p $(STAGING_DIR)/usr/bin
	mkdir -p $(STAGING_DIR)/usr/include
	$(CP) $(PKG_INSTALL_DIR)/usr/include/libexif $(STAGING_DIR)/usr/include/
	mkdir -p $(STAGING_DIR)/usr/lib
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/libexif*.{a,so*} $(STAGING_DIR)/usr/lib/
endef

define Build/UninstallDev
	rm -rf \
		$(STAGING_DIR)/usr/include/libexif \
		$(STAGING_DIR)/usr/lib/libexif*.{a,so*}
endef

$(eval $(call BuildPackage,libexif))
