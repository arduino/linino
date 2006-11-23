# 
# Copyright (C) 2006 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
# $Id: Makefile 5329 2006-10-28 22:43:08Z nico $

include $(TOPDIR)/rules.mk

PKG_NAME:=librsync
PKG_VERSION:=0.9.7
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=@SF/librsync
PKG_MD5SUM:=24cdb6b78f45e0e83766903fd4f6bc84
PKG_CAT:=zcat

PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)-$(PKG_VERSION)
PKG_INSTALL_DIR:=$(PKG_BUILD_DIR)/ipkg-install

include $(INCLUDE_DIR)/package.mk

define Package/librsync
  SECTION:=libs
  CATEGORY:=Libraries
  TITLE:=librsync implements the rolling-checksum algorithm of remote file synchronization
  DESCRIPTION:=\
  	librsync implements the rolling-checksum algorithm of remote file\\\
  	synchronization that was popularized by the rsync utility and is\\\
  	used in rproxy. This algorithm transfers the differences between 2\\\
  	files without needing both files on the same system.
endef

define Build/Configure
	$(call Build/Configure/Default, \
		--enable-shared \
		--enable-static \
	);
endef

define Build/Compile
	$(MAKE) -C $(PKG_BUILD_DIR) \
		DESTDIR="$(PKG_INSTALL_DIR)" \
		all install
endef

define Build/InstallDev
	mkdir -p $(STAGING_DIR)/usr/include
	$(CP) $(PKG_INSTALL_DIR)/usr/include/librsync{,-config}.h $(STAGING_DIR)/usr/include/
	mkdir -p $(STAGING_DIR)/usr/lib
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/librsync.{a,so*} $(STAGING_DIR)/usr/lib/
endef

define Build/UninstallDev
	rm -rf \
		$(STAGING_DIR)/usr/include/librsync{,-config}.h \
		$(STAGING_DIR)/usr/lib/librsync.{a,so*}
endef

define Package/librsync/install
	$(INSTALL_DIR) $(1)/usr/lib
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/librsync.so.* $(1)/usr/lib/
endef

$(eval $(call BuildPackage,librsync))
