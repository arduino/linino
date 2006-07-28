# 
# Copyright (C) 2006 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
# $Id$

include $(TOPDIR)/rules.mk

PKG_NAME:=libamsel
PKG_VERSION:=20040621-cvs
PKG_RELEASE:=1

PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)-$(PKG_VERSION)
PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.bz2
PKG_SOURCE_URL:=ftp://ftp.amselinux.net/source/
PKG_MD5SUM:=2077e620047404881a65d39c53c9917e
PKG_CAT:=bzcat

PKG_INSTALL_DIR:=$(PKG_BUILD_DIR)/ipkg-install

include $(INCLUDE_DIR)/package.mk

define Package/libamsel
  SECTION:=libs
  CATEGORY:=Libraries
  TITLE:=The amwall library
  DESCRIPTION:=The amwall library.\\\
    A library for amwall configuration files.
  URL:=http://amselinux.de/
endef

define Build/Configure
endef

define Build/Compile
	rm -rf $(PKG_INSTALL_DIR)
	mkdir -p $(PKG_INSTALL_DIR)
	$(MAKE) -C $(PKG_BUILD_DIR) \
		$(TARGET_CONFIGURE_OPTS) \
		LDIR=$(PKG_BUILD_DIR) \
		PREFIX="$(PKG_INSTALL_DIR)/usr" \
		all install
endef

define Package/libamsel/install
	install -d -m0755 $(1)/usr/lib
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/* $(1)/usr/lib
endef

define Build/InstallDev
	mkdir -p $(STAGING_DIR)/usr/include
	$(CP) $(PKG_INSTALL_DIR)/usr/include/amsel/compat.h $(STAGING_DIR)/usr/include/
	mkdir -p $(STAGING_DIR)/usr/include/compat
	$(CP) $(PKG_INSTALL_DIR)/usr/include/amsel/compat/queue.h $(STAGING_DIR)/usr/include/compat
	mkdir -p $(STAGING_DIR)/usr/lib/
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/libamsel.so $(STAGING_DIR)/usr/lib/
endef
	
define Build/UninstallDev
	rm -rf \
		$(STAGING_DIR)/usr/include/compat.h \
		$(STAGING_DIR)/usr/include/compat \
		$(STAGING_DIR)/usr/lib/libamsel.so
endef

$(eval $(call BuildPackage,libamsel))
