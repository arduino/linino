#
# Copyright (C) 2008-2009 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=gtk2
PKG_VERSION:=2.14.4
PKG_RELEASE:=6

PKG_SOURCE:=gtk+-$(PKG_VERSION).tar.bz2
PKG_SOURCE_URL:=@GNOME/gtk+/2.14
PKG_BUILD_DIR=$(BUILD_DIR)/gtk+-$(PKG_VERSION)
PKG_MD5SUM:=72bf65a54d2d29a6644dc0d28313ee67
PKG_FIXUP:=libtool

include $(INCLUDE_DIR)/package.mk

PKG_INSTALL:=1

TARGET_CFLAGS+=\
	-I$(STAGING_DIR)/usr/lib/libintl/include/

EXTRA_LDFLAGS+=\
	-Wl,-rpath-link=$(STAGING_DIR)/usr/lib \
	-L$(STAGING_DIR)/usr/lib/libintl/lib/ \
	-L$(STAGING_DIR)/usr/lib/libiconv/lib/ \
	$(TARGET_LDFLAGS)

STAMP_CONFIGURED:=$(STAMP_CONFIGURED)_$(call confvar,CONFIG_PACKAGE_gtk2 CONFIG_PACKAGE_gtk2-cups)

define Package/gtk2
  SECTION:=xorg-framework
  CATEGORY:=Xorg
  SUBMENU:=framework
  TITLE:=GTK+-2.0
  DEPENDS:=+cairo +pango +libpng +libjpeg +atk +libtiff +libX11 +libXext \
  +libXrender +libXfixes +libXrandr +libXcursor +libXdamage +libXcomposite \
  +libXi
endef

define Package/gtk2-cups
  SECTION:=xorg-framework
  CATEGORY:=Xorg
  SUBMENU:=framework
  TITLE:=CUPS print backend for GTK+-2.0
  DEPENDS:=gtk2 +cups
endef

define Build/Configure
	$(call Build/Configure/Default, \
		--enable-shm \
		--disable-xkb \
		--disable-glibtest \
		--disable-gdiplus \
		--disable-xinerama \
		--without-libjasper \
		--with-xinput \
		$(if $(CONFIG_PACKAGE_gtk2-cups),--enable-cups=auto,--disable-cups), \
		gio_can_sniff=no \
	)
endef

define Build/InstallDev
	$(INSTALL_DIR) $(1)/usr/{lib/pkgconfig,include}
	$(CP) $(PKG_INSTALL_DIR)/usr/include/* $(1)/usr/include/
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/gtk-2.0/include/* $(1)/usr/include/

	$(CP) \
		$(PKG_INSTALL_DIR)/usr/lib/*.{so*,a,la} \
		$(1)/usr/lib/

	$(INSTALL_DATA) \
		$(PKG_INSTALL_DIR)/usr/lib/pkgconfig/* \
		$(1)/usr/lib/pkgconfig/
endef

define Package/gtk2/install
	$(INSTALL_DIR) $(1)/etc/gtk-2.0
	$(INSTALL_DATA) \
		$(PKG_INSTALL_DIR)/etc/gtk-2.0/* \
		$(1)/etc/gtk-2.0/

	$(INSTALL_DIR) $(1)/usr/lib
	$(CP) \
		$(PKG_INSTALL_DIR)/usr/lib/*.so* \
		$(1)/usr/lib/

	$(foreach d,engines immodules loaders, \
		$(INSTALL_DIR) $(1)/usr/lib/gtk-2.0/2.10.0/$(d); \
		$(INSTALL_DATA) \
			$(PKG_INSTALL_DIR)/usr/lib/gtk-2.0/2.10.0/$(d)/*.so \
			$(1)/usr/lib/gtk-2.0/2.10.0/$(d)/;\
	)
	$(INSTALL_DIR) $(1)/usr/lib/gtk-2.0/2.10.0/printbackends/
	$(INSTALL_DATA) \
		$(PKG_INSTALL_DIR)/usr/lib/gtk-2.0/2.10.0/printbackends/libprintbackend-{file,lpr}.so \
		$(1)/usr/lib/gtk-2.0/2.10.0/printbackends/

	$(INSTALL_DIR) $(1)/usr/bin/
	$(INSTALL_BIN) \
		$(PKG_INSTALL_DIR)/usr/bin/{gdk-pixbuf-query-loaders,gtk-query-immodules-2.0,gtk-update-icon-cache} \
		$(1)/usr/bin/

	$(INSTALL_DIR) $(1)/usr/share/themes/
	$(CP) \
		$(PKG_INSTALL_DIR)/usr/share/themes/* \
		$(1)/usr/share/themes/

	$(INSTALL_DIR) $(1)/etc/init.d/
	$(INSTALL_BIN) ./files/gdk-pixbuf-query-loaders.init $(1)/etc/init.d/gdk-pixbuf-query-loaders
endef

define Package/gtk2-cups/install
	$(INSTALL_DIR) $(1)/usr/lib/gtk-2.0/2.10.0/printbackends/
	$(INSTALL_DATA) \
		$(PKG_INSTALL_DIR)/usr/lib/gtk-2.0/2.10.0/printbackends/libprintbackend-cups.so \
		$(1)/usr/lib/gtk-2.0/2.10.0/printbackends/
endef

$(eval $(call BuildPackage,gtk2))
$(eval $(call BuildPackage,gtk2-cups))

