#
# Copyright (C) 2006-2012 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=gupnp
PKG_VERSION:=0.19.4
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.xz
PKG_SOURCE_URL:=http://ftp.gnome.org/pub/GNOME/sources/gupnp/0.19/
PKG_MD5SUM:=516549cebc5af416f2fd7177d6512a0f

PKG_BUILD_DEPENDS:=libgnutls

include $(INCLUDE_DIR)/package.mk
include $(INCLUDE_DIR)/nls.mk

TARGET_LDFLAGS+=\
        -Wl,-rpath-link=$(STAGING_DIR)/usr/lib

define Package/libgupnp
  SECTION:=libs
  CATEGORY:=Libraries
  TITLE:=Library for implementing both UPnP clients and services in C
  URL:=http://www.gupnp.org/
  DEPENDS:=+libgssdp +libuuid
endef

define Package/libgupnp/description
GUPnP is a library for implementing both UPnP clients and services in C, using
GObject and LibSoup. It allows for fully asynchronous use without using threads
and so cleanly integrates naturally into main-loop based applications, and
supports all of the UPnP features.
endef

define Build/Compile
	$(MAKE) -C $(PKG_BUILD_DIR) \
		DESTDIR="$(PKG_INSTALL_DIR)" \
		all install
endef

define Build/InstallDev
	$(INSTALL_DIR) $(1)/usr/{lib/pkgconfig,include/gupnp-1.0/libgupnp}

	$(CP) \
		$(PKG_INSTALL_DIR)/usr/lib/libgupnp-1.0.{so*,la,a} \
		$(1)/usr/lib/

	$(INSTALL_DATA) \
		$(PKG_INSTALL_DIR)/usr/lib/pkgconfig/*.pc \
		$(1)/usr/lib/pkgconfig/

	$(INSTALL_DATA) \
		$(PKG_INSTALL_DIR)/usr/include/gupnp-1.0/libgupnp/*.h \
		$(1)/usr/include/gupnp-1.0/libgupnp/
endef

define Package/libgupnp/install
	$(INSTALL_DIR) $(1)/usr/lib
	$(CP) \
		$(PKG_INSTALL_DIR)/usr/lib/libgupnp-1.0.so* \
		$(1)/usr/lib/
endef

$(eval $(call BuildPackage,libgupnp))
