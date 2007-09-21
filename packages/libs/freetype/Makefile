# 
# Copyright (C) 2006 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
# $Id$

include $(TOPDIR)/rules.mk

PKG_NAME:=freetype
PKG_VERSION:=2.3.1
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.bz2
PKG_SOURCE_URL:=@SF/freetype
PKG_MD5SUM:=11e1186ca5520c5a284fa0a03f652035

include $(INCLUDE_DIR)/package.mk

define Package/libfreetype
  SECTION:=libs
  CATEGORY:=Libraries
  DEPENDS:=+zlib
  TITLE:=A free, high-quality and portable font engine
  URL:=http://www.freetype.org/
endef

define Package/libfreetype/description
 The FreeType project is a team of volunteers who develop free, 
 portable and high-quality software solutions for digital typography.
 They specifically target embedded systems and focus on bringing small, 
 efficient and ubiquitous products.
endef

CONFIGURE_ARGS += \
	--enable-shared \
	--enable-static \

define Build/Configure
	$(call Build/Configure/Default)
	$(call libtool_disable_rpath)
endef

define Build/Compile
	$(MAKE) -C $(PKG_BUILD_DIR) all
	$(call libtool_fixup_libdir,$(PKG_INSTALL_DIR))
	$(MAKE) -C $(PKG_BUILD_DIR) DESTDIR="$(PKG_INSTALL_DIR)" install
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
	$(SED) 's,-I$$$$includedir/freetype2,-I$(STAGING_DIR)/usr/include/freetype2,g' $(STAGING_DIR)/usr/bin/freetype-config
	$(SED) 's,-I$$$${includedir}/freetype2,-I$(STAGING_DIR)/usr/include/freetype2,g' $(STAGING_DIR)/usr/lib/pkgconfig/freetype2.pc
	$(SED) 's,-I$$$${includedir},,g' $(STAGING_DIR)/usr/lib/pkgconfig/freetype2.pc
	$(SED) 's,-L$$$${libdir},,g' $(STAGING_DIR)/usr/lib/pkgconfig/freetype2.pc
endef

define Build/UninstallDev
	rm -rf	$(STAGING_DIR)/usr/bin/freetype-config \
		$(STAGING_DIR)/usr/include/freetype2 \
		$(STAGING_DIR)/usr/include/ft2build.h \
		$(STAGING_DIR)/usr/lib/libfreetype.{a,so*} \
		$(STAGING_DIR)/usr/lib/pkgconfig/freetype2.pc
endef

define Package/libfreetype/install
	$(INSTALL_DIR) $(1)/usr/lib
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/libfreetype.so.* $(1)/usr/lib/
endef

$(eval $(call BuildPackage,libfreetype))
