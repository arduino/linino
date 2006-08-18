#
# Copyright (C) 2006 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
# $Id: $

include $(TOPDIR)/rules.mk

PKG_NAME:=bzip2
PKG_VERSION:=1.0.3
PKG_RELEASE:=1
PKG_MD5SUM:=8a716bebecb6e647d2e8a29ea5d8447f

PKG_SOURCE_URL:=http://www.bzip.org/$(PKG_VERSION)/
PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_CAT:=zcat

PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)-$(PKG_VERSION)
PKG_INSTALL_DIR:=$(PKG_BUILD_DIR)/ipkg-install

include $(INCLUDE_DIR)/package.mk

define Package/libbzip2
SECTION:=libs
CATEGORY:=Libraries
TITLE:=bzip2 is a freely available, patent free, high-quality data compressor.
DESCRIPTION:=bzip2 is a freely available, patent free, high-quality data compressor.
URL:=http://www.bzip.org
endef

define Build/Compile
	rm -rf $(PKG_INSTALL_DIR)
	mkdir -p $(PKG_INSTALL_DIR)
	$(MAKE) -C $(PKG_BUILD_DIR) \
		$(TARGET_CONFIGURE_OPTS) \
		DESTDIR="$(PKG_INSTALL_DIR)" \
		libbz2.a
endef

define Build/InstallDev
	mkdir -p $(STAGING_DIR)/usr/include
	$(CP) $(PKG_BUILD_DIR)/bzlib.h $(STAGING_DIR)/usr/include/
	mkdir -p $(STAGING_DIR)/usr/lib
	$(CP) $(PKG_BUILD_DIR)/libbz2.a $(STAGING_DIR)/usr/lib/
endef
	
define Build/UninstallDev
	rm -rf \
	  $(STAGING_DIR)/usr/include/bzlib.h \
	  $(STAGING_DIR)/usr/lib/libbz2.a
endef

$(eval $(call BuildPackage,libbzip2))
