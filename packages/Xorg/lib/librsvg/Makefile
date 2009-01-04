#
# Copyright (C) 2008 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
# $Id: Makefile 12603 2008-09-13 17:54:20Z lars $

include $(TOPDIR)/rules.mk

PKG_NAME:=librsvg
PKG_VERSION:=2.22.3
PKG_RELEASE:=3

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.bz2
PKG_SOURCE_URL:=@GNOME/$(PKG_NAME)/2.22
PKG_MD5SUM:=c4ec4fdb2b1842e221ca39127e85682d
PKG_FIXUP:=libtool

include $(INCLUDE_DIR)/package.mk

PKG_INSTALL=1

EXTRA_LDFLAGS+=-Wl,-rpath-link=$(STAGING_DIR)/usr/lib \
               -L$(STAGING_DIR)/usr/lib/libintl/lib/ \
               -L$(STAGING_DIR)/usr/lib/libiconv/lib/

STAMP_CONFIGURED:=$(STAMP_CONFIGURED)_$(call confvar,CONFIG_PACKAGE_librsvg CONFIG_PACKAGE_librsvg-pixbuf-loader)

define Package/librsvg
  SECTION:=xorg-libs
  CATEGORY:=Xorg
  SUBMENU:=libraries
  TITLE:=SVG rendering library
  URL:=http://librsvg.sourceforge.net/
  DEPENDS:=+cairo +libxml2 +glib2 +libcroco +pango +gtk2
endef

define Package/librsvg-pixbuf-loader
  SECTION:=xorg-libs
  CATEGORY:=Xorg
  SUBMENU:=libraries
  TITLE:=SVG rendering library
  URL:=http://librsvg.sourceforge.net/
  DEPENDS:=librsvg
endef

define Package/librsvg/description
librsvg is a high performance SVG rendering library associated with the Gnome Project.
endef

define Build/Configure
	$(call Build/Configure/Default, \
		--disable-gtk-theme \
		--disable-mozilla-plugin \
		--with-croco \
		$(if $(CONFIG_PACKAGE_librsvg-pixbuf-loader), \
			--enable-pixbuf-loader,\
			--disable-pixbuf-loader \
		) \
	)
endef

define Build/InstallDev
	$(INSTALL_DIR) $(1)/usr/lib/
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/*.{so*,a,la} $(1)/usr/lib/
	$(INSTALL_DIR) $(1)/usr/lib/pkgconfig/
	$(INSTALL_DATA) $(PKG_INSTALL_DIR)/usr/lib/pkgconfig/* $(1)/usr/lib/pkgconfig/
	$(INSTALL_DIR) $(1)/usr/include/
	$(CP) $(PKG_INSTALL_DIR)/usr/include/* $(1)/usr/include/
endef

define Package/librsvg/install
	$(INSTALL_DIR) $(1)/usr/lib/
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/*.so* $(1)/usr/lib/
endef

define Package/librsvg-pixbuf-loader/install
	$(INSTALL_DIR) $(1)/usr/lib/gtk-2.0/2.10.0/loaders
	$(CP) \
		$(PKG_INSTALL_DIR)/usr/lib/gtk-2.0/2.10.0/loaders/*.so* \
		$(1)/usr/lib/gtk-2.0/2.10.0/loaders
endef

$(eval $(call BuildPackage,librsvg))
$(eval $(call BuildPackage,librsvg-pixbuf-loader))
