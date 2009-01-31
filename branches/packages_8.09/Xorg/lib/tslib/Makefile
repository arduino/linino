# 
# Copyright (C) 2006 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
# $Id: Makefile 12228 2008-08-06 22:43:15Z nbd $

include $(TOPDIR)/rules.mk

PKG_NAME:=tslib
PKG_VERSION:=1.0
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.bz2
PKG_SOURCE_URL:=http://download.berlios.de/tslib/

PKG_FIXUP = libtool

include $(INCLUDE_DIR)/package.mk

define Package/tslib
  SECTION:=xorg-lib
  CATEGORY:=Xorg
  SUBMENU:=libraries
  TITLE:=Tslib is an abstraction layer for touchscreen panel events.
  DEPENDS:=@!LINUX_2_4
  URL:=http://tslib.berlios.de/
endef

define Package/tslib/description
	Tslib is an abstraction layer for touchscreen panel events,
	as well as a filter stack for the manipulation of those events.
	It was created by Russell King, of arm.linux.org.uk.
	Examples of implemented filters include jitter smoothing and the calibration transform. 
endef

ifeq ($(CONFIG_TARGET_om_gta02),y)
  TS_CALIBRATION:=pointercal_om_gta02
endif

define Build/Configure
	(cd $(PKG_BUILD_DIR); ./autogen.sh );
	$(call Build/Configure/Default, --enable-malloc0returnsnull)
endef

define Build/Compile
	$(MAKE) -C $(PKG_BUILD_DIR) DESTDIR="$(PKG_INSTALL_DIR)" all install
endef

define Build/InstallDev
	$(INSTALL_DIR) $(1)/usr/include $(1)/usr/lib/pkgconfig
	$(CP) $(PKG_INSTALL_DIR)/usr/include/* $(1)/usr/include/
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/* $(1)/usr/lib/
endef

define Package/tslib/install
	$(INSTALL_DIR) $(1)/usr/lib/ts $(1)/usr/bin $(1)/etc
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/*.so* $(1)/usr/lib/
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/ts/*.so* $(1)/usr/lib/ts/
	$(INSTALL_DATA) ./files/ts.conf $(1)/etc/
	$(if $(TS_CALIBRATION),$(CP) ./files/$(TS_CALIBRATION) $(1)/etc/pointercal )
endef

$(eval $(call BuildPackage,tslib))
