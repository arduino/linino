# 
# Copyright (C) 2007 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
# $Id$

include $(TOPDIR)/rules.mk

PKG_NAME:=libmpcdec
PKG_VERSION:=1.2.4
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.bz2
PKG_SOURCE_URL:=http://files.musepack.net/source/
PKG_MD5SUM:=9ce052b671df5a76e0e7f2b2eb037798

PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)-$(PKG_VERSION)
PKG_INSTALL_DIR:=$(PKG_BUILD_DIR)/ipkg-install

include $(INCLUDE_DIR)/package.mk

define Package/libmpcdec
  SECTION:=libs
  CATEGORY:=Libraries
  TITLE:=Musepack decoder library
  URL:=http://www.musepack.net
endef

define Package/libmpcdec/description
	Musepack decoder library
endef

define Build/Configure
	$(call Build/Configure/Default)
endef

define Build/Compile
	$(call Build/Compile/Default,\
		DESTDIR="$(PKG_INSTALL_DIR)" \
		all install \
	)
endef

define Build/InstallDev
	mkdir -p $(1)/usr/include/mpcdec/
	$(CP) $(PKG_INSTALL_DIR)/usr/include/mpcdec/* $(1)/usr/include/mpcdec/
	mkdir -p $(1)/usr/lib
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/* $(1)/usr/lib/
endef

define Build/UninstallDev
	rm -rf \
		$(STAGING_DIR)/usr/include/mpcdec/ \
		$(STAGING_DIR)/usr/lib/libmpcdec.*
endef

define Package/libmpcdec/install
	$(INSTALL_DIR) $(1)/usr/lib/
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/libmpcdec.* $(1)/usr/lib/
endef

$(eval $(call BuildPackage,libmpcdec))
