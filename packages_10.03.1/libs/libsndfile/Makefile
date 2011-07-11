#
# Copyright (C) 2007-2010 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=libsndfile
PKG_VERSION:=1.0.21
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=http://www.mega-nerd.com/libsndfile/files/
PKG_MD5SUM:=880a40ec636ab2185b97f8927299b292

PKG_FIXUP:=libtool
PKG_INSTALL:=1

include $(INCLUDE_DIR)/package.mk

define Package/libsndfile
  SECTION:=libs
  CATEGORY:=Libraries
  TITLE:=Library for reading/writing audio files
  URL:=http://www.mega-nerd.com/libsndfile/
  DEPENDS:=@!avr32
endef

define Package/libsndfile/description
 libsndfile is a library of C routines for reading and writing files 
 containing sampled audio data.
endef

CONFIGURE_ARGS+= \
	--disable-alsa \
	--disable-external-libs \
	--disable-sqlite \
	--disable-shave \

TARGET_CFLAGS += $(FPIC)

define Build/InstallDev
	$(INSTALL_DIR) $(1)
	$(CP) $(PKG_INSTALL_DIR)/* $(1)/
endef

define Package/libsndfile/install
	$(INSTALL_DIR) $(1)/usr/lib
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/libsndfile.so.* $(1)/usr/lib/
endef

$(eval $(call BuildPackage,libsndfile))
