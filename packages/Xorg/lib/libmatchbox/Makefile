#
# Copyright (C) 2007-2008 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
# blogic@openwrt.org

include $(TOPDIR)/rules.mk

PKG_NAME:=libmatchbox
PKG_RELEASE:=2
PKG_VERSION:=1.9
PKG_SOURCE_URL:=http://matchbox-project.org/sources/libmatchbox/$(PKG_VERSION)
PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.bz2
PKG_MD5SUM:=9f73e7515cc4679171a5db180dc1343b
PKG_BUILD_DIR=$(BUILD_DIR)/$(PKG_NAME)-$(PKG_VERSION)
PKG_FIXUP:=libtool

EXTRA_LDFLAGS+=-Wl,-rpath-link=$(STAGING_DIR)/usr/lib/

include $(INCLUDE_DIR)/package.mk

PKG_INSTALL:=1

define Package/libmatchbox
  SECTION:=xorg-libraries
  CATEGORY:=Xorg
  SUBMENU:=libraries
  DEPENDS:=+libX11 +libXft +libpng +libjpeg +libXext +pango
  TITLE:=libmatchbox
  URL:=http://matchbox-project.org
endef

define Build/Configure
	$(call Build/Configure/Default, \
		--enable-pango \
		--enable-jpeg \
		--enable-png \
		--enable-Xft \
	)
endef

define Build/InstallDev
	$(INSTALL_DIR) $(1)/usr/include/libmb
	$(INSTALL_DATA) \
		$(PKG_INSTALL_DIR)/usr/include/libmb/*.h \
		$(1)/usr/include/libmb/
	$(INSTALL_DIR) $(1)/usr/lib/pkgconfig
	$(CP) \
		$(PKG_INSTALL_DIR)/usr/lib/libmb.{so*,a,la} \
		$(1)/usr/lib/
	$(INSTALL_DATA) \
		$(PKG_INSTALL_DIR)/usr/lib/pkgconfig/* \
		$(1)/usr/lib/pkgconfig/
endef

define Package/libmatchbox/install
	$(INSTALL_DIR) $(1)/usr/lib
	$(CP) \
		$(PKG_INSTALL_DIR)/usr/lib/libmb.so* \
		$(1)/usr/lib/
endef

$(eval $(call BuildPackage,libmatchbox))
