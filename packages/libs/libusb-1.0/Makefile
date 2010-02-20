#
# Copyright (C) 2010 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=libusb-1.0
PKG_VERSION:=1.0.6
PKG_RELEASE:=1

PKG_SOURCE:=libusb-$(PKG_VERSION).tar.bz2
PKG_SOURCE_URL:=http://downloads.sourceforge.net/project/libusb/libusb-1.0/libusb-$(PKG_VERSION)
PKG_MD5SUM:=818c7c02112a53e0c182666ee83f2057
PKG_BUILD_DIR:=$(BUILD_DIR)/libusb-$(PKG_VERSION)

include $(INCLUDE_DIR)/package.mk

define Package/libusb-1.0
  SECTION:=libs
  CATEGORY:=Libraries
  TITLE:=libusb-1.0
  URL:=http://libusb.wiki.sourceforge.net/
endef

define Package/libusb-1.0/description
libusb-1.0
endef

TARGET_CFLAGS += $(FPIC)

define Build/InstallDev
	$(MAKE) install
	$(INSTALL_DIR) $(1)/usr/include
	$(INSTALL_DIR) $(1)/usr/include/libusb-1.0
	$(CP) $(PKG_BUILD_DIR)/libusb/libusb.h $(1)/usr/include/libusb-1.0/
	$(INSTALL_DIR) $(1)/usr/lib
	$(CP) $(PKG_BUILD_DIR)/libusb/.libs/libusb*.{a,so*} $(1)/usr/lib/
	$(CP) $(PKG_BUILD_DIR)/libusb/libusb*.la $(1)/usr/lib/
	$(INSTALL_DIR) $(1)/usr/lib/pkgconfig
	$(CP) $(PKG_BUILD_DIR)/libusb*.pc $(1)/usr/lib/pkgconfig/
endef

define Package/libusb-1.0/install
	$(INSTALL_DIR) $(1)/usr/lib
	$(CP) $(PKG_BUILD_DIR)/libusb/.libs/libusb*.so* $(1)/usr/lib/
endef

$(eval $(call BuildPackage,libusb-1.0))
