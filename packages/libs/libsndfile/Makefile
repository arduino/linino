#
# Copyright (C) 2007-2010 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=libsndfile
PKG_VERSION:=1.0.20
PKG_RELEASE:=2

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=http://www.mega-nerd.com/libsndfile/
PKG_MD5SUM:=e0553e12c7a467af44693e95e2eac668

PKG_FIXUP:=libtool
PKG_INSTALL:=1

include $(INCLUDE_DIR)/package.mk

define Package/libsndfile
  SECTION:=libs
  CATEGORY:=Libraries
  TITLE:=Library for reading/writing audio files
  DEPENDS:=@!avr32
  URL:=http://www.mega-nerd.com/libsndfile/
endef

define Package/libsndfile/description
 libsndfile is a library of C routines for reading and writing files 
 containing sampled audio data.
endef

TARGET_CFLAGS += $(FPIC)

define Build/Configure
	$(call Build/Configure/Default, \
		--disable-alsa \
		--disable-external-libs \
		--disable-sqlite \
		--disable-shave \
	)
endef

define Build/InstallDev
	$(INSTALL_DIR) $(1)
	$(CP) $(PKG_INSTALL_DIR)/* $(1)/
endef

define Package/libsndfile/install
	$(INSTALL_DIR) $(1)/usr/lib
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/libsndfile.so.* $(1)/usr/lib/
endef

$(eval $(call BuildPackage,libsndfile))
