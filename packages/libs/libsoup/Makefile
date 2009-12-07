#
# Copyright (C) 2009 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
# This Makefile is a skeleton
#

include $(TOPDIR)/rules.mk

PKG_NAME:=libsoup
PKG_VERSION:=2.26.3
PKG_RELEASE:=1
PKG_INSTALL:=1
PKG_SOURCE:=libsoup-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=@GNOME/libsoup/2.26
PKG_MD5SUM:=c893b5499c77b995244d968dbf4eeb51
PKG_CAT:=zcat

PKG_BUILD_DIR:=$(BUILD_DIR)/libsoup-$(PKG_VERSION)

include $(INCLUDE_DIR)/package.mk

define Package/libsoup
  SECTION:=libs
  CATEGORY:=Libraries
  DEPENDS:=+glib2 +libxml2
  TITLE:=libsoup
  URL:=http://live.gnome.org/LibSoup/
endef

define Package/libsoup/decription
  Libsoup is an HTTP library implementation in C
endef

define Build/Configure
	$(call Build/Configure/Default, \
	 	--without-gnome \
	 )
endef

define Build/InstallDev
	$(INSTALL_DIR) $(1)/usr/include/
	$(CP) \
		$(PKG_INSTALL_DIR)/usr/include/libsoup-2.4/ \
		$(1)/usr/include/
	$(INSTALL_DIR) $(1)/usr/lib/
	$(CP) \
		$(PKG_INSTALL_DIR)/usr/lib/*.{so*,a,la} \
		$(1)/usr/lib/
	$(INSTALL_DIR) $(1)/usr/lib/pkgconfig/
	$(INSTALL_DATA) \
		$(PKG_INSTALL_DIR)/usr/lib/pkgconfig/*.pc \
		$(1)/usr/lib/pkgconfig/
endef

define Package/libsoup/install
	$(INSTALL_DIR) $(1)/usr/lib/
	$(CP) \
		$(PKG_INSTALL_DIR)/usr/lib/*.so* \
		$(1)/usr/lib/
endef

$(eval $(call BuildPackage,libsoup))
