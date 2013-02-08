#
# Copyright (C) 2006-2012 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=gssdp
PKG_VERSION:=0.13.2
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.xz
PKG_SOURCE_URL:=http://ftp.gnome.org/pub/GNOME/sources/gssdp/0.13/
PKG_MD5SUM:=758ed423cdd258a9a22d59c321b535ed

PKG_BUILD_DEPENDS:=libsoup glib2 $(ICONV_DEPENDS)

include $(INCLUDE_DIR)/package.mk
include $(INCLUDE_DIR)/nls.mk

TARGET_LDFLAGS+=\
	-Wl,-rpath-link=$(STAGING_DIR)/usr/lib

define Package/libgssdp
  SECTION:=libs
  CATEGORY:=Libraries
  TITLE:=Library for resource discovery and announcement over SSDP
  URL:=http://www.gupnp.org/
  DEPENDS:=+libsoup +glib2
endef

define Package/libgssdp/description
A GObject-based API for doing SSDP (Simple Service Discovery Protocol) transparently.
endef

define Build/Compile
	$(MAKE) -C $(PKG_BUILD_DIR) \
		DESTDIR="$(PKG_INSTALL_DIR)" \
		all install
endef

define Build/InstallDev
	$(INSTALL_DIR) $(1)/usr/{lib/pkgconfig,include/gssdp-1.0/libgssdp}

	$(CP) \
		$(PKG_INSTALL_DIR)/usr/lib/libgssdp-1.0.{so*,la,a} \
		$(1)/usr/lib/

	$(INSTALL_DATA) \
		$(PKG_INSTALL_DIR)/usr/lib/pkgconfig/*.pc \
		$(1)/usr/lib/pkgconfig/

	$(INSTALL_DATA) \
		$(PKG_INSTALL_DIR)/usr/include/gssdp-1.0/libgssdp/*.h \
		$(1)/usr/include/gssdp-1.0/libgssdp/
endef

define Package/libgssdp/install
	$(INSTALL_DIR) $(1)/usr/lib
	$(CP) \
		$(PKG_INSTALL_DIR)/usr/lib/libgssdp-1.0.so* \
		$(1)/usr/lib/
endef

$(eval $(call BuildPackage,libgssdp))
