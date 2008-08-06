# 
# Copyright (C) 2006,2007 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
# $Id: Makefile 9947 2007-12-27 02:12:04Z nbd $

include $(TOPDIR)/rules.mk

PKG_NAME:=libosip2
PKG_VERSION:=3.0.3
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=@GNU/osip
PKG_MD5SUM:=f90ae77075fbd8693af7c78998fcf151

PKG_FIXUP = libtool

include $(INCLUDE_DIR)/package.mk

define Package/libosip2
  SECTION:=libs
  CATEGORY:=Libraries
  TITLE:=GNU oSIP library
  URL:=http://www.gnu.org/software/osip/
  DEPENDS:=+libpthread
endef

define Package/libosip2description
 GNU oSIP library, a Session Initiation Protocol (SIP) implementation.
endef

TARGET_CFLAGS += $(FPIC)

CONFIGURE_ARGS+= \
	--enable-shared \
	--enable-static \
	--disable-debug \
	--disable-trace \
	--enable-pthread \
	--enable-semaphore \
	--enable-ntimer \

define Build/Compile
	$(MAKE) -C $(PKG_BUILD_DIR) DESTDIR="$(PKG_INSTALL_DIR)" all install
endef

define Build/InstallDev
	mkdir -p $(1)/usr/include
	$(CP) $(PKG_INSTALL_DIR)/usr/include/osip{,parser}2 $(1)/usr/include/
	mkdir -p $(1)/usr/lib
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/libosip{,parser}2.{a,so*} $(1)/usr/lib/
	mkdir -p $(1)/usr/lib/pkgconfig
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/pkgconfig/libosip2.pc $(1)/usr/lib/pkgconfig/
endef

define Package/libosip2/install
	$(INSTALL_DIR) $(1)/usr/lib
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/libosip{,parser}2.so $(PKG_INSTALL_DIR)/usr/lib/libosip{,parser}2.so.* $(1)/usr/lib/
endef

$(eval $(call BuildPackage,libosip2))
