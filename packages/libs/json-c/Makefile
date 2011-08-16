# 
# Copyright (C) 2011 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=json-c
PKG_VERSION:=0.9
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=http://oss.metaparadigm.com/json-c/$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_MD5SUM:=3a13d264528dcbaf3931b0cede24abae

PKG_INSTALL = 1

include $(INCLUDE_DIR)/package.mk

define Package/json-c
  SECTION:=libs
  CATEGORY:=Libraries
  TITLE:=A JSON implementation in C
  URL:=http://oss.metaparadigm.com/json-c/
endef

define Package/json-c/description
 JSON-C implements a reference counting object model that allows you to \
 easily construct JSON objects in C, output them as JSON formatted strings \
 and parse JSON formatted strings back into the C representation of JSON objects.
endef

define Package/json-c/install
	$(INSTALL_DIR) \
		$(1)/usr/lib
	$(CP) \
		$(PKG_INSTALL_DIR)/usr/lib/libjson.so* \
		$(1)/usr/lib
endef

define Build/InstallDev
	$(INSTALL_DIR) \
		$(1)/usr/lib \
		$(1)/usr/lib/pkgconfig \
		$(1)/usr/include/json
	$(CP) \
		$(PKG_INSTALL_DIR)/usr/lib/pkgconfig/json.pc \
		$(1)/usr/lib/pkgconfig
	$(CP) \
		$(PKG_INSTALL_DIR)/usr/include/json/* \
		$(1)/usr/include/json
	$(CP) \
		$(PKG_INSTALL_DIR)/usr/lib/libjson.{a,so*} \
		$(1)/usr/lib
endef

$(eval $(call BuildPackage,json-c))
