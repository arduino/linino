#
# Copyright (C) 2006 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
# $Id$

include $(TOPDIR)/rules.mk

PKG_NAME:=cgilib
PKG_VERSION:=0.5
PKG_RELEASE:=2

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=http://www.infodrom.org/projects/cgilib/download
PKG_MD5SUM:=5187ba11b2ec165b6c5b6629087733b0

PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)-$(PKG_VERSION)

include $(INCLUDE_DIR)/package.mk

define Package/cgilib
  SECTION:=libs
  CATEGORY:=Libraries
  TITLE:=Simple CGI Library
  URL:=http://www.infodrom.org/projects/cgilib/
endef

define Build/Configure
endef

TARGET_CFLAGS += $(FPIC)

define Build/Compile
	$(MAKE) -C $(PKG_BUILD_DIR) \
		$(TARGET_CONFIGURE_OPTS) \
                OFLAGS="$(TARGET_CFLAGS)" \
                all
endef

define Build/InstallDev
	mkdir -p $(1)/usr/include
	$(CP) $(PKG_BUILD_DIR)/cgi.h $(1)/usr/include/
	mkdir -p $(1)/usr/lib
	$(CP) $(PKG_BUILD_DIR)/libcgi.{a,so*} $(1)/usr/lib/
endef

define Package/cgilib/install
	$(INSTALL_DIR) $(1)/usr/lib
	$(CP) $(PKG_BUILD_DIR)/libcgi.so.* $(1)/usr/lib/
endef

$(eval $(call BuildPackage,cgilib))
