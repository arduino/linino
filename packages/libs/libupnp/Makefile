# 
# Copyright (C) 2006 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
# $Id$

include $(TOPDIR)/rules.mk

PKG_NAME:=libupnp
PKG_VERSION:=1.6.3
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.bz2
PKG_SOURCE_URL:=@SF/pupnp
PKG_MD5SUM:=553f3491fe4da88aba1763497730e2c0

PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)-$(PKG_VERSION)
PKG_INSTALL_DIR:=$(PKG_BUILD_DIR)/ipkg-install

include $(INCLUDE_DIR)/package.mk

define Package/libupnp
  SECTION:=libs
  CATEGORY:=Libraries
  DEPENDS:=+libpthread
  TITLE:=A Portable Open Source UPnP Development Kit
  URL:=http://pupnp.sourceforge.net/
endef

define Package/libupnp/description
        The portable SDK for UPnP Devices (libupnp) provides developers with an
	API and open source code for building control points, devices, and
	bridges that are compliant with Version 1.0 of the  Universal Plug and
	Play Device Architecture Specification and support several operating
	systems like Linux, *BSD, Solaris and others.
endef

define Build/Configure
	$(call Build/Configure/Default, \
		--enable-shared \
		--enable-static \
	);
endef

define Build/Compile
	$(MAKE) -C $(PKG_BUILD_DIR) \
		CCOPT="$(TARGET_CFLAGS)" \
		DESTDIR="$(PKG_INSTALL_DIR)" \
		all install
endef

define Build/InstallDev
	mkdir -p $(1)/usr/include
	$(CP) $(PKG_INSTALL_DIR)/usr/include/upnp $(1)/usr/include/
	mkdir -p $(1)/usr/lib
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/lib{ixml,threadutil,upnp}.{a,so*} $(1)/usr/lib/
	mkdir -p $(1)/usr/lib/pkgconfig
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/pkgconfig/libupnp.pc $(1)/usr/lib/pkgconfig/
endef

define Package/libupnp/install
	$(INSTALL_DIR) $(1)/usr/lib
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/lib{ixml,threadutil,upnp}.so.* $(1)/usr/lib/
endef

$(eval $(call BuildPackage,libupnp))
