# 
# Copyright (C) 2006 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=flac
PKG_VERSION:=1.1.2
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=@SF/flac
PKG_MD5SUM:=2bfc127cdda02834d0491ab531a20960

include $(INCLUDE_DIR)/package.mk

define Package/libflac
  SECTION:=libs
  CATEGORY:=Libraries
  TITLE:=Free Lossless Audio Codec library
  URL:=http://flac.sourceforge.net/
endef

define Build/Configure
endef

TARGET_CFLAGS += $(FPIC)

define Build/Compile
	$(MAKE) -C $(PKG_BUILD_DIR) -f Makefile.lite \
		$(TARGET_CONFIGURE_OPTS) \
		RELEASE_CFLAGS="$(TARGET_CFLAGS)" \
		libFLAC
endef

define Build/InstallDev
	$(INSTALL_DIR) $(1)/usr/include
	$(CP) $(PKG_BUILD_DIR)/include/FLAC $(1)/usr/include/
	$(INSTALL_DIR) $(1)/usr/lib
	$(CP) $(PKG_BUILD_DIR)/obj/release/lib/libFLAC.{a,so} $(1)/usr/lib/
endef

define Package/libflac/install
	$(INSTALL_DIR) $(1)/usr/lib
	$(CP) $(PKG_BUILD_DIR)/obj/release/lib/libFLAC.so $(1)/usr/lib/
endef

$(eval $(call BuildPackage,libflac))
