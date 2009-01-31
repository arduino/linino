#
# Copyright (C) 2008 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
# $Id:

include $(TOPDIR)/rules.mk

PKG_NAME:=libwnck
PKG_VERSION:=2.22.3
PKG_RELEASE:=3

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.bz2
PKG_SOURCE_URL:=@GNOME/$(PKG_NAME)/2.22/
PKG_MD5SUM:=12cf787efa0b9d95bc53613bcc7d958e
PKG_FIXUP:=libtool

include $(INCLUDE_DIR)/package.mk

EXTRA_CFLAGS+=-I$(STAGING_DIR)/usr/lib/libintl/include/ \
              -I$(STAGING_DIR)/usr/lib/libiconv/include/
EXTRA_LDFLAGS+=-L$(STAGING_DIR)/usr/lib/libintl/lib/ \
               -Wl,-rpath-link=$(STAGING_DIR)/usr/lib

define Package/libwnck
  SECTION:=libs
  CATEGORY:=Libraries
  TITLE:=Window Navigator Construction Kit
  URL:=http://ftp.gnome.org/
  DEPENDS:=+gtk2 +glib2 +libXext
endef

define Package/libwnck/description
Window Navigator Construction Kit
endef

TARGET_CFLAGS += $(FPIC)

define Build/Compile
	$(MAKE) -C $(PKG_BUILD_DIR)
	$(MAKE) -C $(PKG_BUILD_DIR) DESTDIR="$(PKG_INSTALL_DIR)" install
endef

define Build/InstallDev
	$(INSTALL_DIR) $(1)/usr/include/libwnck-1.0/libwnck/
	$(INSTALL_DATA) $(PKG_INSTALL_DIR)/usr/include/libwnck-1.0/libwnck/* $(1)/usr/include/libwnck-1.0/libwnck/
	$(INSTALL_DIR) $(1)/usr/lib/
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/*{.so*,a,la} $(1)/usr/lib/
	$(INSTALL_DIR) $(1)/usr/lib/pkgconfig/
	$(INSTALL_DATA) $(PKG_INSTALL_DIR)/usr/lib/pkgconfig/* $(1)/usr/lib/pkgconfig/
endef

define Package/libwnck/install
	$(INSTALL_DIR) $(1)/usr/lib/
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/*.so* $(1)/usr/lib/
endef

$(eval $(call BuildPackage,libwnck))
