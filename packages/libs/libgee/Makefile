#
# Copyright (C) 2006-2012 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=libgee
PKG_VERSION:=0.6.4
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.xz
PKG_SOURCE_URL:=@GNOME/libgee/0.6/
PKG_MD5SUM:=a32bf498cf33d5e3417823a7b252ad22

PKG_BUILD_DEPENDS:=vala/host glib2

TARGET_LDFLAGS+=\
	-Wl,-rpath-link=$(STAGING_DIR)/usr/lib

include $(INCLUDE_DIR)/package.mk
include $(INCLUDE_DIR)/nls.mk

define Package/libgee
  SECTION:=libs
  CATEGORY:=Libraries
  TITLE:=GObject based collection library
  URL:=http://live.gnome.org/Libgee
  DEPENDS:=+glib2
endef

define Package/libgee/description
libgee is a collection library providing GObject-based interfaces and classes
for commonly used data structures.
endef

define Build/Compile
	$(MAKE) -C $(PKG_BUILD_DIR) \
		DESTDIR="$(PKG_INSTALL_DIR)" \
		all install
endef

define Build/InstallDev
	$(INSTALL_DIR) $(1)/usr/{lib/pkgconfig,include/gee-1.0}

	$(CP) \
		$(PKG_INSTALL_DIR)/usr/lib/libgee.{so*,la} \
		$(1)/usr/lib/

	$(INSTALL_DATA) \
		$(PKG_INSTALL_DIR)/usr/lib/pkgconfig/*.pc \
		$(1)/usr/lib/pkgconfig/

	$(INSTALL_DATA) \
		$(PKG_INSTALL_DIR)/usr/include/gee-1.0/gee.h \
		$(1)/usr/include/gee-1.0/

	$(INSTALL_DIR) $(1)/usr/share/vala/vapi

	$(INSTALL_DATA) \
		$(PKG_INSTALL_DIR)/usr/share/vala/vapi/gee-1.0.vapi \
		$(1)/usr/share/vala/vapi
endef

define Package/libgee/install
	$(INSTALL_DIR) $(1)/usr/lib
	$(CP) \
		$(PKG_INSTALL_DIR)/usr/lib/libgee.so* \
		$(1)/usr/lib/
endef

$(eval $(call BuildPackage,libgee))
