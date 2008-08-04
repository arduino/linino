# 
# Copyright (C) 2008 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=gtk2
PKG_VERSION:=2.10.14
PKG_RELEASE:=1

PKG_SOURCE:=gtk+-$(PKG_VERSION).tar.bz2
PKG_SOURCE_URL:= http://ftp.gnome.org/pub/gnome/sources/gtk+/2.10/
PKG_BUILD_DIR=$(BUILD_DIR)/gtk+-2.10.14
PKG_MD5SUM:=018d7dd0fa7de01cfdb77c7c55e7ba26

include $(INCLUDE_DIR)/package.mk

EXTRA_CFLAGS+=-I$(STAGING_DIR)/usr/lib/libintl/include/

EXTRA_LDFLAGS+=-Wl,-rpath-link=$(STAGING_DIR)/usr/lib -L$(STAGING_DIR)/usr/lib/libintl/lib/ -L$(STAGING_DIR)/usr/lib/libiconv/lib/ -L$(STAGING_DIR)/usr/lib/

define Package/gtk2
  SECTION:=xorg-framework
  CATEGORY:=Xorg
  SUBMENU:=framework
  TITLE:=GTK+ 2.10.14 package
  DEPENDS:=+cairo +pango +libjpeg +atk +libtiff +pixman +libX11
endef

define Build/Compile
	$(MAKE) -C $(PKG_BUILD_DIR)
	$(MAKE) -C $(PKG_BUILD_DIR)/ install DESTDIR=$(PKG_INSTALL_DIR)
endef

define Build/InstallDev
	$(INSTALL_DIR)	$(1)/usr/{lib/pkgconfig,include}
	$(CP) -r $(PKG_INSTALL_DIR)/usr/include/* $(1)/usr/include/
	$(CP) -r $(PKG_INSTALL_DIR)/usr/lib/gtk-2.0/include/* $(1)/usr/include/
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/*.{la,so.*,so} $(1)/usr/lib/
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/pkgconfig/* $(1)/usr/lib/pkgconfig/
endef

define Package/gtk2/install
	$(CP) $(PKG_INSTALL_DIR)/* $(1)/
endef

$(eval $(call BuildPackage,gtk2))
$(eval $(call RequireCommand,gdk-pixbuf-csource, \
	Please install gtk2.0-dev \
))
