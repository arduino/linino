# 
# Copyright (C) 2007 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
# $Id$

include $(TOPDIR)/rules.mk

PKG_NAME:=libdvbpsi4
PKG_VERSION:=0.1.5
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.bz2
PKG_SOURCE_URL:=http://download.videolan.org/pub/libdvbpsi/$(PKG_VERSION)/
PKG_MD5SUM:=407cd074b7d6eaf31b20b693ed924655

PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)-$(PKG_VERSION)
PKG_INSTALL_DIR:=$(PKG_BUILD_DIR)/ipkg-install

include $(INCLUDE_DIR)/package.mk

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

define Build/Compile
	$(call Build/Compile/Default, \
		DESTDIR="$(PKG_INSTALL_DIR)" \
		install \
	)
endef

define Build/InstallDev
	mkdir -p $(1)/usr/include
	$(CP) $(PKG_INSTALL_DIR)/usr/include/dvbpsi $(1)/usr/include/
	mkdir -p $(1)/usr/lib
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/libdvbpsi.{a,so*,la} $(1)/usr/lib/
endef

define Build/UninstallDev
	rm -rf \
		$(STAGING_DIR)/usr/include/dvbpsi \
		$(STAGING_DIR)/usr/lib/libdvbpsi.{a,so*,la}
endef

define Package/libdvbpsi4/install
	$(INSTALL_DIR) $(1)/usr/lib
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/libdvbpsi.so* $(1)/usr/lib/
endef

$(eval $(call BuildPackage,libdvbpsi4))
