# 
# Copyright (C) 2008 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
# $Id:

include $(TOPDIR)/rules.mk

PKG_NAME:=ezxml
PKG_VERSION:=0.8.6
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=@SF/ezxml
PKG_MD5SUM:=e22ae17a0bd82dfa2a66f9876f1a8fd7

TAR_OPTIONS:=--transform='s,$(PKG_NAME),$(PKG_NAME)-$(PKG_VERSION),' -xvf -

include $(INCLUDE_DIR)/package.mk

define Package/ezxml/Default
  TITLE:=ezXML
  URL:=http://ezxml.sourceforge.net/
endef

define Package/libezxml
  $(call Package/ezxml/Default)
  SECTION:=libs
  CATEGORY:=Libraries
  TITLE+= (library)
endef

define Package/libezxml/description
	ezXML is a fast and lightweight C library for parsing XML documents.
endef

TARGET_CFLAGS += -D_GNU_SOURCE

define Build/InstallDev
	$(INSTALL_DIR) $(1)/usr/include
	$(INSTALL_DATA) $(PKG_BUILD_DIR)/ezxml.h $(1)/usr/include/

	$(INSTALL_DIR) $(1)/usr/lib
	$(CP) $(PKG_BUILD_DIR)/libezxml.a $(1)/usr/lib/

	$(INSTALL_DIR) $(1)/usr/lib
	$(CP) $(PKG_BUILD_DIR)/libezxml.so $(1)/usr/lib/
endef

define Package/libezxml/install
	$(INSTALL_DIR) $(1)/usr/lib
	$(CP) $(PKG_BUILD_DIR)/libezxml.so $(1)/usr/lib/
endef

$(eval $(call BuildPackage,libezxml))
