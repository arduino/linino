#
# Copyright (C) 2006 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
# $Id$

include $(TOPDIR)/rules.mk

PKG_NAME:=clinkc
PKG_VERSION:=101
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=@SF/clinkc/
PKG_MD5SUM:=4c8ac54a15da47203a86daf77fbc2664
PKG_CAT:=zcat

PKG_BUILD_DIR:=$(BUILD_DIR)/CyberLinkC
PKG_INSTALL_DIR:=$(PKG_BUILD_DIR)/ipkg-install

PKG_BUILD_DEPENDS:=libexpat

include $(INCLUDE_DIR)/package.mk

define Package/libclinkc
  SECTION:=libs
  CATEGORY:=Libraries
  DEPENDS:=+libexpat
  TITLE:=Embedded UPnP library
  DESCRIPTION:=CyberLink for C is a UPnP library using C for small and embedded platforms.
  URL:=http://sourceforge.net/projects/clinkc
endef

# uses GNU configure

define Build/Compile
	chmod +x $(PKG_BUILD_DIR)/config/install-sh
	$(MAKE) -C $(PKG_BUILD_DIR) \
		DESTDIR="$(PKG_INSTALL_DIR)" \
		all install
endef

define Build/InstallDev
	mkdir -p $(STAGING_DIR)/usr/include
	$(CP) $(PKG_INSTALL_DIR)/usr/include/cybergarage $(STAGING_DIR)/usr/include/
	mkdir -p $(STAGING_DIR)/usr/lib
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/libclinkc.a $(STAGING_DIR)/usr/lib/
endef

define Build/UninstallDev
	rm -rf	$(STAGING_DIR)/usr/include/cybergarage \
		$(STAGING_DIR)/usr/lib/libclinkc.a
endef

$(eval $(call Build/DefaultTargets))
