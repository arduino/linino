#
# Copyright (C) 2008-2010 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
# blogic@openwrt.org

include $(TOPDIR)/rules.mk

PKG_NAME:=pango
PKG_VERSION:=1.26.0
PKG_RELEASE:=4

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.bz2
PKG_SOURCE_URL:=@GNOME/$(PKG_NAME)/1.26/
PKG_MD5SUM:=74ce18cfcc3ad0008a6ad56cfc535061

PKG_FIXUP:=libtool

include $(INCLUDE_DIR)/package.mk

PKG_INSTALL=1

TARGET_LDFLAGS+= \
	-Wl,-rpath-link=$(STAGING_DIR)/usr/lib \
	-L$(STAGING_DIR)/usr/lib/libiconv/lib \
	-L$(STAGING_DIR)/usr/lib/libintl/lib

define Package/pango
  SECTION:=xorg-libs
  CATEGORY:=Xorg
  SUBMENU:=libraries
  TITLE:=Text layout and rendering library
  DEPENDS:=+cairo +glib2 +fontconfig +libfreetype \
  +FEATURE_drawing-backend_libX11:libX11 \
  +FEATURE_drawing-backend_libX11:libXft
endef

define Package/pango/description
Pango is a library for layout and rendering of text, with an emphasis
on internationalization. Pango can be used anywhere that text layout
is needed; however, most of the work on Pango so far has been done using
the GTK+ widget toolkit as a test platform. Pango forms the core of text
and font handling for GTK+-2.x.
endef

CONFIGURE_ARGS += \
	$(if $(CONFIG_PACKAGE_libX11), --with-x, --without-x)

CONFIGURE_VARS += \
	CXX=$(TARGET_CC)

define Build/InstallDev
	$(INSTALL_DIR) \
		$(1)/usr/lib/pkgconfig \
		$(1)/usr/lib/pango/1.6.0/modules \
		$(1)/usr/include

	$(CP) \
		$(PKG_INSTALL_DIR)/usr/lib/*.{so*,a,la} \
		$(1)/usr/lib

	$(CP) \
		$(PKG_INSTALL_DIR)/usr/lib/pango/1.6.0/modules/*.{so*,a,la} \
		$(1)/usr/lib/pango/1.6.0/modules/

	$(INSTALL_DATA) \
		$(PKG_INSTALL_DIR)/usr/lib/pkgconfig/*.pc \
		$(1)/usr/lib/pkgconfig

	$(CP) \
		$(PKG_INSTALL_DIR)/usr/include/* \
		$(1)/usr/include/
endef

define Package/pango/install
	$(INSTALL_DIR) \
		$(1)/usr/lib/pango/1.6.0/modules \
		$(1)/usr/bin \
		$(1)/etc/init.d

	$(CP) \
		$(PKG_INSTALL_DIR)/usr/lib/*.so* \
		$(1)/usr/lib/

	$(CP) \
		$(PKG_INSTALL_DIR)/usr/lib/pango/1.6.0/modules/*.so* \
		$(1)/usr/lib/pango/1.6.0/modules/

	$(INSTALL_BIN) \
		$(PKG_INSTALL_DIR)/usr/bin/pango-querymodules \
		$(1)/usr/bin/

	$(INSTALL_BIN) \
		./files/pango-querymodules.init \
		$(1)/etc/init.d/pango-querymodules
endef

$(eval $(call BuildPackage,pango))
