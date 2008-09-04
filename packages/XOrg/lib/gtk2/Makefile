# 
# Copyright (C) 2008 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=gtk2
PKG_VERSION:=2.12.11
PKG_RELEASE:=2

PKG_SOURCE:=gtk+-$(PKG_VERSION).tar.bz2
PKG_SOURCE_URL:=@GNOME/gtk+/2.12
PKG_BUILD_DIR=$(BUILD_DIR)/gtk+-$(PKG_VERSION)
PKG_MD5SUM:=f7aab88e856a813386f797aade5867ad
PKG_FIXUP:=libtool

include $(INCLUDE_DIR)/package.mk

EXTRA_CFLAGS+=-I$(STAGING_DIR)/usr/lib/libintl/include/

EXTRA_LDFLAGS+=-Wl,-rpath-link=$(STAGING_DIR)/usr/lib \
               -L$(STAGING_DIR)/usr/lib/libintl/lib/ \
               -L$(STAGING_DIR)/usr/lib/libiconv/lib/ \
               -L$(STAGING_DIR)/usr/lib/

define Package/gtk2
  SECTION:=xorg-framework
  CATEGORY:=Xorg
  SUBMENU:=framework
  TITLE:=GTK+-2.0
  DEPENDS:=+cairo +pango +libjpeg +atk +libtiff +pixman +libX11
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
		--disable-glibtest \
		$(if $(CONFIG_PACKAGE_gtk2-cups),--enable-cups=auto,--disable-cups), \
		gio_can_sniff=no \
	)
endef

define Build/Compile
	$(MAKE) -C $(PKG_BUILD_DIR)
	$(MAKE) -C $(PKG_BUILD_DIR)/ install DESTDIR=$(PKG_INSTALL_DIR)
endef

define Build/InstallDev
	$(INSTALL_DIR)	$(1)/usr/{lib/pkgconfig,include}
	$(CP) $(PKG_INSTALL_DIR)/usr/include/* $(1)/usr/include/
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/gtk-2.0/include/* $(1)/usr/include/
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/*.{la,so.*,so} $(1)/usr/lib/
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/pkgconfig/* $(1)/usr/lib/pkgconfig/
endef

define Package/gtk2/install
	$(INSTALL_DIR) $(1)/etc/gtk-2.0/
	$(INSTALL_DATA) $(PKG_INSTALL_DIR)/etc/gtk-2.0/* $(1)/etc/gtk-2.0/
	$(INSTALL_DIR) $(1)/usr/lib/
	$(INSTALL_DATA) $(PKG_INSTALL_DIR)/usr/lib/*.{so*,a} $(1)/usr/lib/
	$(foreach d,engines immodules loaders, \
		$(INSTALL_DIR) $(1)/usr/lib/gtk-2.0/2.10.0/$(d); \
		$(INSTALL_DATA) $(PKG_INSTALL_DIR)/usr/lib/gtk-2.0/2.10.0/$(d)/*.{so,a} \
			$(1)/usr/lib/gtk-2.0/2.10.0/$(d)/;\
	)
	$(INSTALL_DIR) $(1)/usr/lib/gtk-2.0/2.10.0/printbackends/
	$(INSTALL_DATA) $(PKG_INSTALL_DIR)/usr/lib/gtk-2.0/2.10.0/printbackends/libprintbackend-{file,lpr}.{so,a} $(1)/usr/lib/gtk-2.0/2.10.0/printbackends/

	$(INSTALL_DIR) $(1)/usr/bin/
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/usr/bin/* $(1)/usr/bin/
	$(INSTALL_DIR) $(1)/usr/share/themes/
	$(CP) $(PKG_INSTALL_DIR)/usr/share/themes/* $(1)/usr/share/themes/
	$(INSTALL_DIR) $(1)/etc/init.d/
	$(INSTALL_BIN) ./files/gdk-pixbuf-query-loaders.init $(1)/etc/init.d/gdk-pixbuf-query-loaders
endef

define Package/gtk2-cups/install
	$(INSTALL_DIR) $(1)/usr/lib/gtk-2.0/2.10.0/printbackends/
	$(INSTALL_DATA) $(PKG_INSTALL_DIR)/usr/lib/gtk-2.0/2.10.0/printbackends/libprintbackend-cups.{so,a} $(1)/usr/lib/gtk-2.0/2.10.0/printbackends/
endef

$(eval $(call BuildPackage,gtk2))
$(eval $(call BuildPackage,gtk2-cups))
$(eval $(call RequireCommand,gdk-pixbuf-csource, \
	Please install gtk2.0-dev \
))
