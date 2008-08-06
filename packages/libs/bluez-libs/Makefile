# 
# Copyright (C) 2006 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
# $Id$

include $(TOPDIR)/rules.mk

PKG_NAME:=bluez-libs
PKG_VERSION:=3.36
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=http://bluez.sourceforge.net/download
PKG_MD5SUM:=8c2ca546c0e7bb73dbd0e906fce7f6b1

include $(INCLUDE_DIR)/package.mk

define Package/bluez-libs
  SECTION:=libs
  CATEGORY:=Libraries
  TITLE:=Bluetooth library
  URL:=http://www.bluez.org/
endef

CONFIGURE_ARGS += \
		--enable-shared \
		--enable-static \

TARGET_CFLAGS += $(FPIC)

define Build/Compile
	$(MAKE) -C $(PKG_BUILD_DIR) \
		DESTDIR="$(PKG_INSTALL_DIR)" \
		all install
endef

define Build/InstallDev
	mkdir -p $(1)/usr/include/bluetooth
	$(CP) $(PKG_INSTALL_DIR)/usr/include/bluetooth/*.h $(1)/usr/include/bluetooth
	mkdir -p $(1)/usr/lib
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/libbluetooth.{a,so*} $(1)/usr/lib/
	mkdir -p $(1)/usr/lib/pkgconfig
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/pkgconfig/bluez.pc $(1)/usr/lib/pkgconfig/
endef

define Package/bluez-libs/install
	$(INSTALL_DIR) $(1)/usr/lib
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/libbluetooth.so.* $(1)/usr/lib/
endef

$(eval $(call BuildPackage,bluez-libs))
