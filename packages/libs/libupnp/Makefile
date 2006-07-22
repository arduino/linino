# 
# Copyright (C) 2006 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
# $Id$

include $(TOPDIR)/rules.mk

PKG_NAME:=libupnp
PKG_VERSION:=1.2.1a
PKG_RELEASE:=1

PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)-$(PKG_VERSION)
PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=@SF/upnp
PKG_MD5SUM:=e72b3550bf064eedf080f16f09688891
PKG_CAT:=zcat

PKG_INSTALL_DIR:=$(PKG_BUILD_DIR)/ipkg-install

include $(INCLUDE_DIR)/package.mk

define Package/libupnp
  SECTION:=libs
  CATEGORY:=Libraries
  DEPENDS:=+libpthread
  TITLE:=UPnP SDK library
  DESCRIPTION:=UPnP (Universal Plug and Play) SDK library.\\\
    The Universal Plug and Play (UPnP) SDK for Linux provides support \\\
    for building UPnP-compliant control points, devices, and bridges \\\
    on Linux.
  URL:=http://upnp.sourceforge.net/
endef

define Build/Configure
endef

define Build/Compile
	$(MAKE) -C $(PKG_BUILD_DIR)/upnp \
		$(TARGET_CONFIGURE_OPTS) \
		OPT_FLAGS="$(TARGET_CFLAGS)" \
		STRIP=/bin/true
endef

define Package/libupnp/install
	install -m0755 -d $(1)/usr/lib
	$(CP) $(PKG_BUILD_DIR)/upnp/bin/lib{ixml,threadutil,upnp}.so $(1)/usr/lib/
endef

define Build/InstallDev
	mkdir -p $(STAGING_DIR)/usr/include/upnp
	$(CP) $(PKG_BUILD_DIR)/upnp/inc/*.h $(STAGING_DIR)/usr/include/upnp/
	mkdir -p $(STAGING_DIR)/usr/lib
	$(CP) $(PKG_BUILD_DIR)/upnp/bin/lib{ixml,threadutil,upnp}.so $(STAGING_DIR)/usr/lib/
endef

define Build/UninstallDev
	rm -rf \
		$(STAGING_DIR)/usr/include/upnp \
		$(STAGING_DIR)/usr/lib/lib{ixml,threadutil,upnp}.so
endef

$(eval $(call BuildPackage,libupnp))
