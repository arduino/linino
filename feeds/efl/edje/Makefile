# 
# Copyright (C) 2006-2008 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
# $Id: Makefile 12228 2008-08-06 22:43:15Z nbd $

include $(TOPDIR)/rules.mk

PKG_NAME:=edje
PKG_REV:=40853
PKG_VERSION:=r$(PKG_REV)
PKG_RELEASE:=1

PKG_SOURCE_PROTO:=svn
PKG_SOURCE_VERSION:=$(PKG_REV)
PKG_SOURCE_SUBDIR:=$(PKG_NAME)-$(PKG_VERSION)
PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=http://svn.enlightenment.org/svn/e/trunk/$(PKG_NAME)
PKG_BUILD_DIR=$(BUILD_DIR)/Xorg/$(_CATEGORY)/$(PKG_NAME)-$(PKG_VERSION)/

HOST_BUILD_DEPENDS:=evas/host ecore/host eet/host embryo/host

PKG_FIXUP = libtool

include $(INCLUDE_DIR)/host-build.mk
include $(INCLUDE_DIR)/package.mk

define Package/edje
  SECTION:=xorg-lib
  CATEGORY:=Xorg
  SUBMENU:=libraries
  TITLE:=Edje is a graphical design and layout library
  URL:=http://wiki.enlightenment.org/index.php/Edje
  DEPENDS:=+evas +ecore +eet +embryo
endef

define Package/edje/description
  Edje is a graphical design and layout library based on Evas that provides an abstraction layer between the application code and the interface, while allowing extremely flexible dynamic layouts and animations.
endef

define Build/Configure
	( cd $(PKG_BUILD_DIR); NOCONFIGURE=YES ./autogen.sh );
	$(call Build/Configure/Default, \
		--disable-edje-cc \
		--disable-doc \
	)
endef

define Host/Configure
	( cd $(HOST_BUILD_DIR); NOCONFIGURE=YES ./autogen.sh );
	$(call Host/Configure/Default, \
		--enable-edje-cc \
		--disable-doc \
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

define Package/edje/install
	$(INSTALL_DIR) $(1)/usr/lib
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/libedje*.so* $(1)/usr/lib/
endef

$(eval $(call HostBuild))
$(eval $(call BuildPackage,edje))
