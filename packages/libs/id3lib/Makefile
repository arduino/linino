# 
# Copyright (C) 2006 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
# $Id$

include $(TOPDIR)/rules.mk

PKG_NAME:=id3lib
PKG_VERSION:=3.8.3
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=@SF/id3lib
PKG_MD5SUM:=19f27ddd2dda4b2d26a559a4f0f402a7
PKG_CAT:=zcat

PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)-$(PKG_VERSION)
PKG_INSTALL_DIR:=$(PKG_BUILD_DIR)/ipkg-install

include $(INCLUDE_DIR)/package.mk

define Package/id3lib
  SECTION:=libs
  CATEGORY:=Libraries
  DEPENDS:=+zlib +uclibcxx
  TITLE:=An ID3v1/ID3v2 tag manipulation library
  URL:=http://www.id3lib.org/
endef

# commas are interpreted by the $(call ...) macro, so define a intermediate variable holding our settings
PKG_CONFIGURE_LIBS:=-Wl,-Bdynamic,-luClibc++,-Bstatic,-lstdc++,-Bdynamic,-lz,-lm,-lc

define Build/Configure
	$(call Build/Configure/Default, \
		--enable-shared \
		--enable-static \
		, \
		CXXFLAGS="$$$$CXXFLAGS -fno-builtin -fno-rtti"  \
		LIBS="$(PKG_CONFIGURE_LIBS)" \
	)
endef

define Build/Compile
	$(MAKE) -C $(PKG_BUILD_DIR) \
		DESTDIR="$(PKG_INSTALL_DIR)" \
		all install
endef

define Build/InstallDev
	mkdir -p $(STAGING_DIR)/usr/include
	$(CP) $(PKG_INSTALL_DIR)/usr/include/id3 $(STAGING_DIR)/usr/include/
	$(CP) $(PKG_INSTALL_DIR)/usr/include/id3.h $(STAGING_DIR)/usr/include/
	mkdir -p $(STAGING_DIR)/usr/lib
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/libid3.{a,so} $(STAGING_DIR)/usr/lib/
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/libid3-*.so.* $(STAGING_DIR)/usr/lib/
endef

define Build/UninstallDev
	rm -rf \
		$(STAGING_DIR)/usr/include/id3 \
		$(STAGING_DIR)/usr/include/id3.h \
		$(STAGING_DIR)/usr/lib/libid3.{a,so} \
		$(STAGING_DIR)/usr/lib/libid3-*.so.*
endef

define Package/id3lib/install
	$(INSTALL_DIR) $(1)/usr/lib/
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/libid3-*.so.* $(1)/usr/lib/
endef

$(eval $(call BuildPackage,id3lib))
