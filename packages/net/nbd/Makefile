#
# Copyright (C) 2006-2008 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
# $Id: $ 

include $(TOPDIR)/rules.mk

PKG_NAME:=nbd
PKG_VERSION:=2.9.11
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=@SF/nbd
PKG_MD5SUM:=7fdd912edba85b82f599e17449ccea40

include $(INCLUDE_DIR)/package.mk

PKG_BUILD_DEPENDS:=glib2 libintl

define Package/nbd
  SECTION:=net
  CATEGORY:=Network
  DEPENDS:=@LINUX_2_6
  TITLE:=Network Block Device utilities
  URL:=http://nbd.sourceforge.net
endef

define Package/nbd/description
  This package contains the network block device client.
endef

CONFIGURE_ARGS += \
	--disable-glibtest
CONFIGURE_VARS += GLIB_CFLAGS="-I/usr/include/glib-2.0 -I/usr/lib/glib-2.0/include"

define Build/Compile
	$(MAKE) -C $(PKG_BUILD_DIR) \
		CC="$(TARGET_CC)" \
		DESTDIR="$(PKG_INSTALL_DIR)" \
		CPPFLAGS="$(TARGET_CPPFLAGS) -L$(STAGING_DIR)/usr/lib/libintl/lib/ -L$(STAGING_DIR)/usr/lib/" \
		nbd-client
endef

define Package/nbd/install
	$(INSTALL_DIR) $(1)/usr/sbin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/nbd-client $(1)/usr/sbin
endef

$(eval $(call BuildPackage,nbd))
