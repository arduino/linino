#
# Copyright (C) 2008-2010 OpenWrt.org
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

PKG_BUILD_DEPENDS:=intltool/host

include $(INCLUDE_DIR)/package.mk
include $(INCLUDE_DIR)/nls.mk

TARGET_CFLAGS+=$(FPIC)
TARGET_LDFLAGS+= \
	-Wl,-rpath-link=$(STAGING_DIR)/usr/lib \
	-Wl,-rpath=/usr/lib

define Package/libwnck
  SECTION:=xorg-libraries
  CATEGORY:=Xorg
  SUBMENU:=libraries
  TITLE:=Window Navigator Construction Kit
  URL:=http://ftp.gnome.org/
  DEPENDS:=+libX11 +gtk2 +glib2 +libXext $(INTL_DEPENDS)
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
