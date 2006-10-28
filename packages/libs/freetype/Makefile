# 
# Copyright (C) 2006 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
# $Id$

include $(TOPDIR)/rules.mk

PKG_NAME:=libfreetype
PKG_VERSION:=2.1.9
PKG_RELEASE:=1

PKG_SOURCE:=freetype-$(PKG_VERSION).tar.bz2
PKG_SOURCE_URL:=@SF/freetype
PKG_MD5SUM:=ec1b903e4be5f073caa72458ea58c29c
PKG_CAT:=bzcat

PKG_BUILD_DIR:=$(BUILD_DIR)/freetype-$(PKG_VERSION)
PKG_INSTALL_DIR:=$(PKG_BUILD_DIR)/ipkg-install

include $(INCLUDE_DIR)/package.mk

define Package/libfreetype
  SECTION:=libs
  CATEGORY:=Libraries
  DEPENDS:=+zlib
  TITLE:=A free, high-quality and portable font engine
  DESCRIPTION:=\
	The FreeType project is a team of volunteers who develop free, \\\
	portable and high-quality software solutions for digital typography.\\\
	They specifically target embedded systems and focus on bringing small, \\\
	efficient and ubiquitous products.
  URL:=http://www.freetype.org/
endef

define Build/Configure
	$(call Build/Configure/Default, \
		--enable-shared \
		--enable-static \
	)
	$(SED) 's|^sys_lib_dlsearch_path_spec=.*|sys_lib_dlsearch_path_spec="$(STAGING_DIR)/usr/lib $(STAGING_DIR)/lib"|g' \
		$(PKG_BUILD_DIR)/builds/unix/libtool
endef

define Build/Compile
	$(MAKE) -C $(PKG_BUILD_DIR) \
		DESTDIR="$(PKG_INSTALL_DIR)" \
		all install
endef

define Build/InstallDev
	mkdir -p $(STAGING_DIR)/usr/bin
	$(CP) $(PKG_INSTALL_DIR)/usr/bin/freetype-config $(STAGING_DIR)/usr/bin/
	mkdir -p $(STAGING_DIR)/usr/include
	$(CP) $(PKG_INSTALL_DIR)/usr/include/freetype2 $(STAGING_DIR)/usr/include/
	$(CP) $(PKG_INSTALL_DIR)/usr/include/ft2build.h $(STAGING_DIR)/usr/include/
	mkdir -p $(STAGING_DIR)/usr/lib
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/libfreetype.{a,so*} $(STAGING_DIR)/usr/lib/
	mkdir -p $(STAGING_DIR)/usr/lib/pkgconfig
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/pkgconfig/freetype2.pc $(STAGING_DIR)/usr/lib/pkgconfig/
	$(SED) 's,-I$$$${includedir}/freetype2,,g' $(STAGING_DIR)/usr/lib/pkgconfig/freetype2.pc
	$(SED) 's,-L$$$${libdir},,g' $(STAGING_DIR)/usr/lib/pkgconfig/freetype2.pc
endef

define Build/UninstallDev
	rm -rf \
		$(STAGING_DIR)/usr/bin/freetype-config \
		$(STAGING_DIR)/usr/include/freetype2 \
		$(STAGING_DIR)/usr/include/ft2build.h \
		$(STAGING_DIR)/usr/lib/libfreetype.{a,so*} \
		$(STAGING_DIR)/usr/lib/pkgconfig/freetype2.pc
endef

define Package/libfreetype/install
	install -d -m0755 $(1)/usr/lib
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/libfreetype.so.* $(1)/usr/lib/
endef

$(eval $(call BuildPackage,libfreetype))
