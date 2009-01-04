#
# Copyright (C) 2007-2008 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
# $Id$

include $(TOPDIR)/rules.mk

PKG_NAME:=libdvbpsi4
PKG_VERSION:=0.1.5
PKG_RELEASE:=2

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.bz2
PKG_SOURCE_URL:=http://download.videolan.org/pub/libdvbpsi/$(PKG_VERSION)/
PKG_MD5SUM:=407cd074b7d6eaf31b20b693ed924655
PKG_FIXUP:=libtool

include $(INCLUDE_DIR)/package.mk

PKG_INSTALL=1

define Package/libdvbpsi4
  SECTION:=libs
  CATEGORY:=Libraries
  TITLE:=MPEG TS and DVB PSI tables decoding and generating
  URL:=http://www.videolan.org/developers/libdvbpsi.html
endef

define Package/libdvbpsi4/description
	libdvbpsi is a simple library designed for MPEG TS and DVB PSI tables
	decoding and generating.
endef

TARGET_CFLAGS += $(FPIC)

define Build/InstallDev
	$(INSTALL_DIR) $(1)/usr/include/dvbpsi
	$(INSTALL_DATA) \
		$(PKG_INSTALL_DIR)/usr/include/dvbpsi/*.h \
		$(1)/usr/include/dvbpsi/
	$(INSTALL_DIR) $(1)/usr/lib
	$(CP) \
		$(PKG_INSTALL_DIR)/usr/lib/libdvbpsi.{so*,a,la} \
		$(1)/usr/lib/
endef

define Package/libdvbpsi4/install
	$(INSTALL_DIR) $(1)/usr/lib
	$(CP) \
		$(PKG_INSTALL_DIR)/usr/lib/libdvbpsi.so* \
		$(1)/usr/lib/
endef

$(eval $(call BuildPackage,libdvbpsi4))
