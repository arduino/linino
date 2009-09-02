#
# Copyright (C) 2008 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=libwnck
PKG_VERSION:=2.26.1
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.bz2
PKG_SOURCE_URL:=@GNOME/$(PKG_NAME)/2.26/
PKG_MD5SUM:=015b5d2e65d15448fa143513fce03541
PKG_FIXUP:=libtool
PKG_INSTALL:=1

include $(INCLUDE_DIR)/package.mk

TARGET_CFLAGS+= \
	-I$(STAGING_DIR)/usr/lib/libintl/include/ \
	-I$(STAGING_DIR)/usr/lib/libiconv/include/ \
	$(FPIC)

TARGET_LDFLAGS+= \
	-L$(STAGING_DIR)/usr/lib/libintl/lib/ \
	-L$(STAGING_DIR)/usr/lib/libiconv/lib/ \
	-Wl,-rpath-link=$(STAGING_DIR)/usr/lib \
	-Wl,-rpath=/usr/lib

define Package/libwnck
  SECTION:=xorg-libs
  CATEGORY:=Xorg
  SUBMENU:=libraries
  TITLE:=Window Navigator Construction Kit
  URL:=http://ftp.gnome.org/
  DEPENDS:=+gtk2 +glib2 +libXext +libintl
endef

define Package/libwnck/description
Window Navigator Construction Kit
endef

define Build/InstallDev
	$(INSTALL_DIR) $(1)/usr/include/libwnck-1.0/libwnck/
	$(INSTALL_DATA) $(PKG_INSTALL_DIR)/usr/include/libwnck-1.0/libwnck/* $(1)/usr/include/libwnck-1.0/libwnck/
	$(INSTALL_DIR) $(1)/usr/lib/
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/*.{so*,a,la} $(1)/usr/lib/
	$(INSTALL_DIR) $(1)/usr/lib/pkgconfig/
	$(INSTALL_DATA) $(PKG_INSTALL_DIR)/usr/lib/pkgconfig/* $(1)/usr/lib/pkgconfig/
endef

define Package/libwnck/install
	$(INSTALL_DIR) $(1)/usr/lib/
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/*.so* $(1)/usr/lib/
endef

$(eval $(call BuildPackage,libwnck))
