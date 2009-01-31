#
# Copyright (C) 2008 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
# $Id$


include $(TOPDIR)/rules.mk

PKG_NAME:=libIDL2
PKG_VERSION:=0.8.11
PKG_RELEASE:=2

PKG_SOURCE:=libIDL-$(PKG_VERSION).tar.bz2
PKG_BUILD_DIR:=$(BUILD_DIR)/libIDL-$(PKG_VERSION)
PKG_SOURCE_URL:=@GNOME/libIDL/0.8
PKG_MD5SUM:=9d0d4895fc23f7de9514fb13f0fdc9ba
PKG_FIXUP:=libtool

include $(INCLUDE_DIR)/package.mk

PKG_INSTALL=1

TARGET_CFLAGS += \
	-I$(STAGING_DIR)/usr/lib/libintl/include \
	-I$(STAGING_DIR)/usr/libiconv/include

TARGET_LDFLAGS += \
	-Wl,-rpath-link=$(STAGING_DIR)/usr/lib \
	-L$(STAGING_DIR)/usr/lib/libintl/lib/ \
	-L$(STAGING_DIR)/usr/lib/libiconv/lib/

define Package/libIDL2
  SECTION:=libs
  CATEGORY:=Libraries
  TITLE:=IDL Compiling Library
  URL:=http://andrewtv.org/libIDL/
  DEPENDS:=+glib2
endef

define Package/libIDL2/description
  libIDL is a library licensed under the GNU LGPL for creating trees of
  CORBA Interface Definition Language (IDL) files, which is a
  specification for defining portable interfaces.
endef

define Build/Configure
	$(call Build/Configure/Default,libIDL_cv_long_long_format=ll)
endef

define Build/InstallDev
	$(INSTALL_DIR) $(2)/bin
	$(INSTALL_BIN) \
		$(PKG_INSTALL_DIR)/usr/bin/libIDL-config-2 \
		$(2)/bin

	$(INSTALL_DIR) $(1)/usr/include/libIDL-2.0/libIDL/
	$(INSTALL_DATA) \
		$(PKG_INSTALL_DIR)/usr/include/libIDL-2.0/libIDL/*.h \
		$(1)/usr/include/libIDL-2.0/libIDL/

	$(INSTALL_DIR) $(1)/usr/lib
	$(CP) \
		$(PKG_INSTALL_DIR)/usr/lib/*.{so*,a,la} \
		$(1)/usr/lib/

	$(INSTALL_DIR) $(1)/usr/lib/pkgconfig
	$(INSTALL_DATA) \
		$(PKG_INSTALL_DIR)/usr/lib/pkgconfig/* \
		$(1)/usr/lib/pkgconfig/
endef

define Package/libIDL2/install
	$(INSTALL_DIR) $(1)/usr/lib
	$(CP) \
		$(PKG_INSTALL_DIR)/usr/lib/*.so* \
		$(1)/usr/lib/
endef

$(eval $(call BuildPackage,libIDL2))
