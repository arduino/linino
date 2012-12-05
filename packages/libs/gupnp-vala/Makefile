#
# Copyright (C) 2006-2012 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=gupnp-vala
PKG_VERSION:=0.10.3
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.xz
PKG_SOURCE_URL:=http://ftp.gnome.org/pub/GNOME/sources/gupnp-vala/0.10/
PKG_MD5SUM:=

PKG_BUILD_DEPENDS:=vala/host libgssdp libgupnp libgupnp-av libgupnp-dlna

PKG_FIXUP:=autoreconf

include $(INCLUDE_DIR)/package.mk
include $(INCLUDE_DIR)/nls.mk

define Package/libgupnp-vala
  SECTION:=lang
  CATEGORY:=Languages
  TITLE:=GUPnP Vala bindings
  URL:=http://live.gnome.org/GUPnP
endef

define Package/libgupnp-vala/description
Vala bindings for GUPnP
endef

define Build/Compile
	$(MAKE) -C $(PKG_BUILD_DIR) \
		DESTDIR="$(PKG_INSTALL_DIR)" \
		all install
endef

define Build/InstallDev
	$(INSTALL_DIR) $(1)/usr/lib/pkgconfig

	$(INSTALL_DATA) \
		$(PKG_INSTALL_DIR)/usr/lib/pkgconfig/*.pc \
		$(1)/usr/lib/pkgconfig/

	$(INSTALL_DIR) $(1)/usr/share/vala/vapi

	$(INSTALL_DATA) \
		$(PKG_INSTALL_DIR)/usr/share/vala/vapi/*.{vapi,deps} \
		$(1)/usr/share/vala/vapi
endef

$(eval $(call BuildPackage,libgupnp-vala))
