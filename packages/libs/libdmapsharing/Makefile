#
# Copyright (C) 2009 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
# This Makefile is a skeleton
#

include $(TOPDIR)/rules.mk

PKG_NAME:=libdmapsharing
PKG_VERSION:=1.9.0.15
PKG_RELEASE:=1

PKG_SOURCE:=libdmapsharing-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=http://www.flyn.org/projects/libdmapsharing/
PKG_MD5SUM:=11839bcf9aac8f1de5e101d13e9e8422

PKG_BUILD_DIR:=$(BUILD_DIR)/libdmapsharing-$(PKG_VERSION)

PKG_INSTALL:=1

include $(INCLUDE_DIR)/package.mk

TARGET_CFLAGS+= \
	-I$(STAGING_DIR)/usr/lib/libintl/include

TARGET_LDFLAGS+= \
	-Wl,-rpath-link=$(STAGING_DIR)/usr/lib \
	-L$(STAGING_DIR)/usr/lib/libintl/lib

define Package/libdmapsharing
  SECTION:=libs
  CATAGORY:=Libraries
  DEPENDS:=+libsoup +mdnsresponder
  TITLE:=libdmapsharing
  URL:=http://www.flyn.org/projects/libdmapsharing/
endef

define Package/libdmapsharing/decription
  Libdmapsharing is a DMAP library implementation in C
endef

define Build/InstallDev
	$(INSTALL_DIR) $(1)/usr/include/
	$(CP) \
		$(PKG_INSTALL_DIR)/usr/include/libdmapsharing-1.9/ \
		$(1)/usr/include/
	$(INSTALL_DIR) $(1)/usr/lib/
	$(CP) \
		$(PKG_INSTALL_DIR)/usr/lib/*.so* \
		$(1)/usr/lib/
	$(INSTALL_DIR) $(1)/usr/lib/pkgconfig/
	$(INSTALL_DATA) \
		$(PKG_INSTALL_DIR)/usr/lib/pkgconfig/*.pc \
		$(1)/usr/lib/pkgconfig/
endef

define Package/libdmapsharing/install
	$(INSTALL_DIR) $(1)/usr/lib/
	$(CP) \
		$(PKG_INSTALL_DIR)/usr/lib/*.so* \
		$(1)/usr/lib/
endef

$(eval $(call BuildPackage,libdmapsharing))
