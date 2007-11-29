#
# Copyright (C) 2007 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
# $Id$

include $(TOPDIR)/rules.mk

PKG_NAME:=libaio
PKG_VERSION:=0.3.106
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)_$(PKG_VERSION).orig.tar.gz
PKG_SOURCE_URL:=http://ftp.debian.org/debian/pool/main/liba/libaio/
PKG_MD5SUM:=9480e31cce6506091080d59211089bd4

PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)-$(PKG_VERSION)

include $(INCLUDE_DIR)/package.mk

define Package/libaio
  SECTION:=libs
  CATEGORY:=Libraries
  DEPENDS:=@LINUX_2_6
  TITLE:=Linux kernel AIO interface access library
endef

define Build/Configure
endef

LIBAIO_CFLAGS:=-nostdlib -nostartfiles -I. $(TARGET_CFLAGS) $(TARGET_CPPFLAGS)
LIBAIO_SOVER:=1.0.1

define Build/Compile
	$(MAKE) -C $(PKG_BUILD_DIR) \
		$(TARGET_CONFIGURE_OPTS) \
		ARCH="$(ARCH)" \
		CC="$(TARGET_CROSS)gcc" \
		LD="$(TARGET_CROSS)ld" \
		CFLAGS="$(LIBAIO_CFLAGS)" \
		all
endef

define Build/InstallDev
	mkdir -p $(1)/usr/include
	$(CP) $(PKG_BUILD_DIR)/src/libaio.h $(1)/usr/include/
	mkdir -p $(1)/usr/lib
	$(CP) $(PKG_BUILD_DIR)/src/libaio.{a,so*} $(1)/usr/lib/
	ln -sf libaio.so.$(LIBAIO_SOVER) $(1)/usr/lib/libaio.so
	ln -sf libaio.so.$(LIBAIO_SOVER) $(1)/usr/lib/libaio.so.1
endef

define Build/UninstallDev
	rm -rf \
		$(STAGING_DIR)/usr/include/libaio.h \
		$(STAGING_DIR)/usr/lib/libaio.{a,so*}
endef

define Package/libaio/install
	$(INSTALL_DIR) $(1)/usr/lib
	$(INSTALL_DATA) $(PKG_BUILD_DIR)/src/libaio.so.* $(1)/usr/lib/
	ln -sf libaio.so.$(LIBAIO_SOVER) $(1)/usr/lib/libaio.so
	ln -sf libaio.so.$(LIBAIO_SOVER) $(1)/usr/lib/libaio.so.1
endef

$(eval $(call BuildPackage,libaio))
