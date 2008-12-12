# 
# Copyright (C) 2008 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
# $Id: Makefile 12228 2008-08-06 22:43:15Z nbd $

include $(TOPDIR)/rules.mk

PKG_NAME:=libinklevel
PKG_VERSION:=0.7.3
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=@SF/libinklevel
PKG_MD5SUM:=c7ccefec29d1d218d1aae240f6044fe1

include $(INCLUDE_DIR)/package.mk

define Package/libinklevel
  SECTION:=libs
  CATEGORY:=Libraries
  DEPENDS:=$(if $(WITH_PARPORT), +libieee1284)
  TITLE:=Printers Ink Level Library
  URL:=http://libinklevel.sourceforge.net/
endef

define Package/libinklevel/description
        Libinklevel is a library for checking the ink level of your printer on a system which runs Linux.
endef

TARGET_CFLAGS += $(FPIC)
TARGET_LIBS += $(if $(WITH_PARPORT), -lieee1284)

define Build/Compile
	$(MAKE) -C $(PKG_BUILD_DIR) \
		CC="$(TARGET_CC)" \
		CFLAGS="$(TARGET_CFLAGS)" \
		CPPFLAGS="$(TARGET_CPPFLAGS)" \
		LDFLAGS="$(TARGET_LDFLAGS)" \
		LIBS="$(TARGET_LIBS)" \
		DESTDIR="$(PKG_INSTALL_DIR)" \
		all install
endef

define Build/InstallDev
	$(INSTALL_DIR) $(1)/usr/include
	$(INSTALL_DATA) \
		$(PKG_INSTALL_DIR)/usr/include/inklevel.h \
		$(1)/usr/include/

	$(INSTALL_DIR) $(1)/usr/lib
	$(CP) \
		$(PKG_INSTALL_DIR)/usr/lib/libinklevel.so* \
		$(1)/usr/lib/
endef

define Package/libinklevel/install
	$(INSTALL_DIR) $(1)/usr/lib
	$(CP) \
		$(PKG_INSTALL_DIR)/usr/lib/libinklevel.so* \
		$(1)/usr/lib/
endef

$(eval $(call BuildPackage,libinklevel))
