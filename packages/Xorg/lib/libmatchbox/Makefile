# 
# Copyright (C) 2007 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
# blogic@openwrt.org 
include $(TOPDIR)/rules.mk

PKG_NAME:=libmatchbox
PKG_RELEASE:=1
PKG_VERSION:=1.9
PKG_SOURCE_URL:=http://matchbox-project.org/sources/libmatchbox/$(PKG_VERSION)
PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.bz2
PKG_MD5SUM:=9f73e7515cc4679171a5db180dc1343b
PKG_BUILD_DIR=$(BUILD_DIR)/${PKG_NAME}-$(PKG_VERSION)
PKG_FIXUP:=libtool

EXTRA_LDFLAGS+=-Wl,-rpath-link=$(STAGING_DIR)/usr/lib/

include $(INCLUDE_DIR)/package.mk

define Package/libmatchbox
  SECTION:=xorg-libraries
  CATEGORY:=Xorg
  SUBMENU:=libraries
  DEPENDS:=+libX11 +libXft +libpng +libjpeg +libXau +libXdmcp
  TITLE:=libmatchbox
  URL:=http://matchbox-project.org
endef

define Build/InstallDev
	DESTDIR=$(1) $(MAKE) -C $(PKG_BUILD_DIR)/ $(MAKE_FLAGS) install
endef

define Package/libmatchbox/install
	$(INSTALL_DIR) $(1)/usr/lib
	$(CP) $(PKG_BUILD_DIR)/libmb/.libs/libmb.so* $(1)/usr/lib/
endef

$(eval $(call BuildPackage,libmatchbox))
