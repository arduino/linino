#
# Copyright (C) 2010 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=imagemagick
PKG_VERSION:=6.6.7
PKG_REVISION:=3
PKG_RELEASE:=1

PKG_BUILD_DIR:=$(BUILD_DIR)/ImageMagick-$(PKG_VERSION)-$(PKG_REVISION)
PKG_SOURCE:=ImageMagick-$(PKG_VERSION)-$(PKG_REVISION).tar.bz2
PKG_SOURCE_URL:=ftp://ftp.fifi.org/pub/ImageMagick/
PKG_MD5SUM:=

PKG_FIXUP:=libtool
PKG_REMOVE_FILES:=aclocal.m4 m4/libtool.m4

include $(INCLUDE_DIR)/package.mk

PKG_INSTALL=1

define Package/imagemagick/Default
  SECTION:=multimedia
  CATEGORY:=Multimedia
  TITLE:=imagemagick
  URL:=http://image_magick.veidrodis.com/
endef

define Package/imagemagick
  $(call Package/imagemagick/Default)
endef

define Package/imagemagick/description
  An image manipulation library.
endef

define Package/imagemagick-jpeg
  $(call Package/imagemagick/Default)
  TITLE+= (jpeg)
  DEPENDS:=+imagemagick +libjpeg +zlib
endef

define Package/imagemagick-jpeg/description
  imagemagick JPEG module
endef

define Package/imagemagick-png
  $(call Package/imagemagick/Default)
  TITLE+= (png)
  DEPENDS:=+imagemagick +libpng +zlib
endef

define Package/imagemagick-png/description
  imagemagick PNG module
endef


CONFIGURE_ARGS += \
	  --with-modules \
	  --enable-shared \
	  --enable-static \
	  --without-xml \
	  --without-x

define Build/Compile
	$(MAKE) -C $(PKG_BUILD_DIR) \
		CC="$(TARGET_CC)" \
		CFLAGS="$(TARGET_CFLAGS) -Wall -I$(PKG_BUILD_DIR)/include/linux -I$(PKG_BUILD_DIR)/include"
endef

define Build/InstallDev
	$(INSTALL_DIR) $(1)/usr/include/magick
	$(INSTALL_DIR) $(1)/usr/include/Magick++
	$(INSTALL_DIR) $(1)/usr/include/wand
	$(CP) \
		$(PKG_INSTALL_DIR)/usr/include/* \
		$(1)/usr/include/

	$(INSTALL_DIR) $(1)/usr/lib/
	$(CP) \
		$(PKG_INSTALL_DIR)/usr/lib/*.so* \
		$(1)/usr/lib/

	$(INSTALL_DIR) $(1)/usr/lib/pkgconfig/
	$(INSTALL_DATA) \
		$(PKG_INSTALL_DIR)/usr/lib/pkgconfig/* \
		$(1)/usr/lib/pkgconfig/
endef

define Package/imagemagick/install
	$(INSTALL_DIR) $(1)/usr/lib/
	$(CP) \
		$(PKG_INSTALL_DIR)/usr/lib/*.so* \
		$(1)/usr/lib/
endef

define BuildPlugin
  define Package/imagemagick-$(1)/install
	$(INSTALL_DIR) $$(1)/usr/lib/ImageMagick-$(PKG_VERSION)/modules-Q16/coders
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/ImageMagick-$(PKG_VERSION)/modules-Q16/coders/$(1).so \
		$$(1)/usr/lib/ImageMagick-$(PKG_VERSION)/modules-Q16/coders
  endef

  $$(eval $$(call BuildPackage,imagemagick-$(1)))
endef

$(eval $(call BuildPackage,imagemagick))
$(eval $(call BuildPlugin,jpeg))
$(eval $(call BuildPlugin,png))

