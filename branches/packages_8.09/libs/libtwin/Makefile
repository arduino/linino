#
# Copyright (C) 2006 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
# $Id:$

include $(TOPDIR)/rules.mk

PKG_NAME:=libtwin
PKG_VERSION:=0.0.3
PKG_RELEASE:=2

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=http://ozlabs.org/~jk/projects/petitboot/downloads/
PKG_MD5SUM:=ebd7c5cca3c9e108208a7bf17b256a6c
PKG_FIXUP:=libtool

include $(INCLUDE_DIR)/package.mk

define Package/libtwin
  SECTION:=libs
  CATEGORY:=Libraries
  DEPENDS:=+zlib +libpng +libjpeg @TARGET_ps3
  TITLE:=The tiny windowing system libraries
  URL:=
endef

TARGET_CFLAGS += -flax-vector-conversions

define Build/Configure
	$(call Build/Configure/Default, \
		--enable-shared \
		--enable-static \
		--disable-x11 \
	)
endef

define Build/Compile
	$(MAKE) -C $(PKG_BUILD_DIR) \
		DESTDIR="$(PKG_INSTALL_DIR)" \
		all install
endef

define Build/InstallDev
	mkdir -p $(1)/usr/include
	$(CP) $(PKG_INSTALL_DIR)/usr/include/libtwin $(1)/usr/include/
	mkdir -p $(1)/usr/lib
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/libtwin.{la,a,so*} $(1)/usr/lib/
	mkdir -p $(1)/usr/lib/pkgconfig
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/pkgconfig/libtwin.pc $(1)/usr/lib/pkgconfig/
endef

define Build/UninstallDev
	rm -rf \
		$(STAGING_DIR)/usr/include/libtwin \
		$(STAGING_DIR)/usr/lib/libtwin.{la,a,so*} \
		$(STAGING_DIR)/usr/lib/pkgconfig/libtwin.pc
endef

define Package/libtwin/install
	$(INSTALL_DIR) $(1)/usr/lib
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/libtwin.so* $(1)/usr/lib/
endef

$(eval $(call BuildPackage,libtwin))
