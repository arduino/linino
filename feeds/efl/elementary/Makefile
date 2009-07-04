#
# Copyright (C) 2006-2008 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
# $Id: Makefile 12228 2008-08-06 22:43:15Z nbd $

include $(TOPDIR)/rules.mk

PKG_NAME:=elementary
PKG_REV:=40853
PKG_VERSION:=r$(PKG_REV)
PKG_RELEASE:=1

PKG_SOURCE_PROTO:=svn
PKG_SOURCE_VERSION:=$(PKG_REV)
PKG_SOURCE_SUBDIR:=$(PKG_NAME)-$(PKG_VERSION)
PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=http://svn.enlightenment.org/svn/e/trunk/TMP/st/$(PKG_NAME)
PKG_BUILD_DIR=$(BUILD_DIR)/Xorg/$(_CATEGORY)/$(PKG_NAME)-$(PKG_VERSION)/

PKG_BUILD_DEPENDS:=edje/host

PKG_FIXUP = libtool

include $(INCLUDE_DIR)/package.mk

define Package/elementary
  SECTION:=xorg-lib
  CATEGORY:=Xorg
  SUBMENU:=libraries
  TITLE:=Elementary
  URL:=http://wiki.enlightenment.org/index.php/Elementary
  DEPENDS:=+eina +eet +evas +ecore +edje +libpthread
endef

define Build/Configure
	( cd $(PKG_BUILD_DIR); NOCONFIGURE=YES ./autogen.sh );
	$(call Build/Configure/Default, \
		--with-edje-cc=$(STAGING_DIR_HOST)/bin/edje_cc \
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

define Package/elementary/install
	$(INSTALL_DIR) $(1)/usr/lib $(1)/usr/share/elementary/themes
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/libelementary*.so* $(1)/usr/lib/
	$(CP) $(PKG_INSTALL_DIR)/usr/share/elementary/themes/*.edj $(1)/usr/share/elementary/themes/
endef

$(eval $(call BuildPackage,elementary))
