# Copyright (C) 2006 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
# $Id$

include $(TOPDIR)/rules.mk

PKG_NAME:=libiconv
PKG_VERSION:=1.9.1
PKG_RELEASE:=1
PKG_MD5SUM:=0c99a05e0c3c153bac1c960f78711155

PKG_SOURCE_URL:=@GNU/libiconv
PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_CAT:=zcat

PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)-$(PKG_VERSION)
PKG_INSTALL_DIR:=$(PKG_BUILD_DIR)/ipkg-install

include $(INCLUDE_DIR)/package.mk

define Package/libiconv
  SECTION:=libs
  CATEGORY:=Libraries
  TITLE:=character set conversion library
  DESCRIPTION:=character set conversion library
  URL:=http://www.gnu.org/software/libiconv/
endef

define Build/Compile
	$(MAKE) -C $(PKG_BUILD_DIR) \
		CC="$(TARGET_CC)"
	rm -rf $(PKG_INSTALL_DIR)
	mkdir -p $(PKG_INSTALL_DIR)
	$(MAKE) -C $(PKG_BUILD_DIR) \
		libdir="$(PKG_INSTALL_DIR)/usr/lib" \
		includedir="$(PKG_INSTALL_DIR)/usr/include" \
		install-lib
endef

define Package/libiconv/install
	install -d -m0755 $(1)/usr/lib
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/libiconv.so* $(1)/usr/lib/
	chmod 0644 $(1)/usr/lib/*
endef

define Build/InstallDev
	mkdir -p $(STAGING_DIR)/usr/include/
	$(CP) $(PKG_INSTALL_DIR)/usr/include/iconv.h $(STAGING_DIR)/usr/include/
	mkdir -p $(STAGING_DIR)/usr/lib/
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/libiconv.* $(STAGING_DIR)/usr/lib/
endef

define Build/UninstallDev	
	rm -rf \
		$(STAGING_DIR)/usr/include/iconv.h \
		$(STAGING_DIR)/usr/lib/libiconv.*
endef

$(eval $(call BuildPackage,libiconv))
