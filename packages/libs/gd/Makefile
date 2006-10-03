# 
# Copyright (C) 2006 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
# $Id$

include $(TOPDIR)/rules.mk

PKG_NAME:=gd
PKG_VERSION:=2.0.33
PKG_RELEASE:=2

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=http://www.boutell.com/gd/http
PKG_MD5SUM:=be0a6d326cd8567e736fbc75df0a5c45
PKG_CAT:=zcat

PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)-$(PKG_VERSION)
PKG_INSTALL_DIR:=$(PKG_BUILD_DIR)/ipkg-install

include $(INCLUDE_DIR)/package.mk

define Package/libgd
  SECTION:=libs
  CATEGORY:=Libraries
  DEPENDS:=+libjpeg +libpng
  TITLE:=The GD graphics library
  URL:=http://www.boutell.com/gd/
endef

define Build/Configure
	$(call Build/Configure/Default, \
		--enable-shared \
		--enable-static \
		--disable-rpath \
		--with-gnu-ld \
		--without-x \
		--without-freetype \
		--with-jpeg=$(STAGING_DIR)/usr \
		--with-png=$(STAGING_DIR)/usr \
		--without-xpm \
		, \
		LIBPNG12_CONFIG="$(STAGING_DIR)/usr/bin/libpng12-config" \
	)
endef

define Build/Compile
	$(MAKE) -C $(PKG_BUILD_DIR) \
		DESTDIR="$(PKG_INSTALL_DIR)" \
		all install
endef

define Build/InstallDev
	mkdir -p $(STAGING_DIR)/usr/bin
	$(CP) $(PKG_INSTALL_DIR)/usr/bin/gdlib-config $(STAGING_DIR)/usr/bin/
	mkdir -p $(STAGING_DIR)/usr/include
	$(CP) $(PKG_INSTALL_DIR)/usr/include/entities.h $(STAGING_DIR)/usr/include/
	$(CP) $(PKG_INSTALL_DIR)/usr/include/gd{,_io,cache,fontg,fontl,fontmb,fonts,fontt,fx}.h \
		$(STAGING_DIR)/usr/include/
	mkdir -p $(STAGING_DIR)/usr/lib
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/libgd.{a,so*} $(STAGING_DIR)/usr/lib/
	$(SED) 's,-I$$$${prefix}/include,,g' $(STAGING_DIR)/usr/bin/gdlib-config
endef

define Build/UninstallDev
	rm -rf	$(STAGING_DIR)/usr/bin/gdlib-config \
		$(STAGING_DIR)/usr/include/entities.h \
		$(STAGING_DIR)/usr/include/gd{,_io,cache,fontg,fontl,fontmb,fonts,fontt,fx}.h \
		$(STAGING_DIR)/usr/lib/libgd.{a,so*}
endef

define Package/libgd/install
	install -d -m0755 $(1)/usr/lib
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/libgd.so.* $(1)/usr/lib/
endef

$(eval $(call BuildPackage,libgd))
