#
# Copyright (C) 2008-2010 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
# blogic@openwrt.org

include $(TOPDIR)/rules.mk

PKG_NAME:=pango
PKG_VERSION:=1.28.4
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.bz2
PKG_SOURCE_URL:=@GNOME/$(PKG_NAME)/1.28/
PKG_MD5SUM:=3f3989700f04e9117d30544a9078b3a0

PKG_FIXUP:=autoreconf
PKG_INSTALL:=1
PKG_BUILD_PARALLEL:=0

include $(INCLUDE_DIR)/package.mk
include $(INCLUDE_DIR)/nls.mk

TARGET_LDFLAGS+= \
	-Wl,-rpath-link=$(STAGING_DIR)/usr/lib

define Package/pango
  SECTION:=xorg-libraries
  CATEGORY:=Xorg
  SUBMENU:=libraries
  TITLE:=Text layout and rendering library
  DEPENDS:=+cairo +glib2 +fontconfig +libfreetype \
  +FEATURE_drawing-backend_libX11:libX11 \
  +FEATURE_drawing-backend_libX11:libXft
  URL:=http://www.pango.org/
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
	CXX="$(TARGET_CC)"

define Build/InstallDev
	$(INSTALL_DIR) \
		$(1)/usr/lib/pkgconfig \
		$(1)/usr/lib/pango/1.6.0/modules \
		$(1)/usr/include

	$(CP) \
		$(PKG_INSTALL_DIR)/usr/lib/*.so* \
		$(1)/usr/lib

	$(CP) \
		$(PKG_INSTALL_DIR)/usr/lib/pango/1.6.0/modules/*.so* \
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
