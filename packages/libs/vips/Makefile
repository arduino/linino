#
# Copyright (C) 2010 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=vips
PKG_VERSION:=7.24.5
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=http://www.vips.ecs.soton.ac.uk/supported/7.24/
PKG_MD5SUM:=00534ff42de0fcf662e0a4222e973a8c
PKG_FIXUP = libtool

include $(INCLUDE_DIR)/package.mk
include $(INCLUDE_DIR)/nls.mk

PKG_INSTALL=1

define Package/vips/Default
  TITLE:=vips
  URL:=http://www.vips.ecs.soton.ac.uk/
endef

define Package/vips
  $(call Package/vips/Default)
  SECTION:=multimedia
  CATEGORY:=Multimedia
  DEPENDS:=+libjpeg +glib2 +libxml2 +imagemagick +libfreetype $(INTL_DEPENDS)
endef

define Package/vips/description
  An image manipulation library.
endef

TARGET_LDFLAGS+= \
	-Wl,-rpath-link=$(STAGING_DIR)/usr/lib

CONFIGURE_ARGS += \
	--disable-cxx \
	--disable-threads \
	--without-liboil \
	--without-magick

define Build/InstallDev
	$(INSTALL_DIR) $(1)/usr/include/vips
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

define Package/vips/install
	$(INSTALL_DIR) $(1)/usr/lib/
	$(CP) \
		$(PKG_INSTALL_DIR)/usr/lib/*.so* \
		$(1)/usr/lib/
endef

$(eval $(call BuildPackage,vips))
