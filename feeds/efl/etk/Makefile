# 
# Copyright (C) 2006-2008 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
# $Id: Makefile 12228 2008-08-06 22:43:15Z nbd $

include $(TOPDIR)/rules.mk

PKG_NAME:=etk
PKG_REV:=40853
PKG_VERSION:=r$(PKG_REV)
PKG_RELEASE:=1

PKG_SOURCE_PROTO:=svn
PKG_SOURCE_VERSION:=$(PKG_REV)
PKG_SOURCE_SUBDIR:=$(PKG_NAME)-$(PKG_VERSION)
PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=http://svn.enlightenment.org/svn/e/trunk/$(PKG_NAME)
PKG_BUILD_DIR=$(BUILD_DIR)/Xorg/$(_CATEGORY)/$(PKG_NAME)-$(PKG_VERSION)/

PKG_FIXUP = libtool

PKG_BUILD_DEPENDS:=edje/host

include $(INCLUDE_DIR)/package.mk

define Package/etk
  SECTION:=xorg-lib
  CATEGORY:=Xorg
  SUBMENU:=libraries
  TITLE:=Etk is a toolkit based on the EFL
  URL:=http://wiki.enlightenment.org/index.php/Etk
  DEPENDS:=+evas +ecore +edje +libintl
endef

define Package/etk/description
  Etk is a toolkit based on the EFL
endef

TARGET_CFLAGS+=-I$(STAGING_DIR)/usr/lib/libintl/include
TARGET_LDFLAGS+=-lintl -L$(STAGING_DIR)/usr/lib/libintl/lib

define Build/Configure
	( cd $(PKG_BUILD_DIR); NOCONFIGURE=YES ./autogen.sh );
	$(call Build/Configure/Default, \
		--disable-nls \
		--disable-rpath \
		--disable-ecore-fb-x11-support \
	)
endef

define Build/Compile
	DESTDIR="$(PKG_INSTALL_DIR)" $(MAKE) -C $(PKG_BUILD_DIR) all install
endef

define Build/InstallDev
	$(INSTALL_DIR) $(1)/usr/include $(1)/usr/lib
	$(CP) $(PKG_INSTALL_DIR)/usr/include/* $(1)/usr/include/
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/* $(1)/usr/lib/
endef

define Package/etk/install
	$(INSTALL_DIR) $(1)/usr/lib $(1)/usr/share $(1)/usr/lib/etk/engines
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/libetk*.so* $(1)/usr/lib/
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/etk/engines/*.so* $(1)/usr/lib/etk/engines/
	$(CP) $(PKG_INSTALL_DIR)/usr/share/etk $(1)/usr/share/
endef

$(eval $(call BuildPackage,etk))
