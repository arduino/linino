#
# Copyright (C) 2010 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=libmms
PKG_VERSION:=0.5
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=http://code.launchpad.net/libmms/trunk/$(PKG_VERSION)/+download/
PKG_MD5SUM:=cf83053ec891f14e73a04c84d9de08ee

PKG_FIXUP:=libtool
PKG_INSTALL:=1

include $(INCLUDE_DIR)/package.mk

define Package/libmms
  SECTION:=libs
  CATEGORY:=Libraries
  DEPENDS:=+glib2
  TITLE:=MMS stream protocol library
  URL:=https://launchpad.net/libmms
endef

define Package/libmms/description
	LibMMS is a common library for parsing mms:// and mmsh:// type network streams.
	These are commonly used to stream Windows Media Video content over the web.
	LibMMS itself is only for receiving MMS stream,
	it doesn't handle sending at all.
endef

TARGET_CFLAGS += $(FPIC)

define Build/Configure
	(cd $(PKG_BUILD_DIR); ./autogen.sh );
	$(call Build/Configure/Default)
endef

define Build/InstallDev
	$(INSTALL_DIR) $(1)/usr/include
	$(CP) $(PKG_INSTALL_DIR)/usr/include/libmms $(1)/usr/include/
	$(INSTALL_DIR) $(1)/usr/lib
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/libmms.{a,so*} $(1)/usr/lib/
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/pkgconfig $(1)/usr/lib/
endef

define Package/libmms/install
	$(INSTALL_DIR) $(1)/usr/lib
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/libmms.so.* $(1)/usr/lib/
endef

$(eval $(call BuildPackage,libmms))
