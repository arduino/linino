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
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=http://www.infodrom.org/projects/cgilib/download
PKG_MD5SUM:=5187ba11b2ec165b6c5b6629087733b0
PKG_CAT:=zcat

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

define Build/Compile
	$(MAKE) -C $(PKG_BUILD_DIR) \
		$(TARGET_CONFIGURE_OPTS) \
                OFLAGS="$(TARGET_CFLAGS)" \
                all
endef

define Build/InstallDev
	mkdir -p $(STAGING_DIR)/usr/include
	$(CP) $(PKG_BUILD_DIR)/cgi.h $(STAGING_DIR)/usr/include/
	mkdir -p $(STAGING_DIR)/usr/lib
	$(CP) $(PKG_BUILD_DIR)/libcgi.{a,so*} $(STAGING_DIR)/usr/lib/
	touch $(STAGING_DIR)/usr/lib/libcgi.so
endef
	
define Build/UninstallDev
	rm -rf \
		$(STAGING_DIR)/usr/include/cgi.h \
		$(STAGING_DIR)/usr/lib/libcgi.{a,so*}
endef

define Package/cgilib/install
	install -d -m0755 $(1)/usr/lib
	$(CP) $(PKG_BUILD_DIR)/libcgi.so.* $(1)/usr/lib/
endef

$(eval $(call BuildPackage,cgilib))
