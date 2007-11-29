# 
# Copyright (C) 2006 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
# $Id$

include $(TOPDIR)/rules.mk

PKG_NAME:=gzip
PKG_VERSION:=1.3.3
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=http://www.gzip.org/
PKG_MD5SUM:=52eaf713673507d21f7abefee98ba662

PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)-$(PKG_VERSION)

include $(INCLUDE_DIR)/package.mk

define Package/gzip
  SECTION:=utils
  CATEGORY:=Utilities
  DEPENDS:=
  TITLE:=gzip (GNU zip) is a compression utility.
  URL:=http://www.gzip.org/
endef

define Package/gzip/description
	gzip (GNU zip) is a compression utility designed to be a \
	replacement for compress.
endef

define Build/Configure
	$(call Build/Configure/Default, \
		--prefix=/usr \
	);
endef

define Build/Compile
	$(call Build/Compile/Default, \
		CFLAGS="$(TARGET_CFLAGS)" \
		LDFLAGS="$(TARGET_LDLAGS)" \
	)
endef

define Package/gzip/install
	mkdir -p $(1)/usr/bin/
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/gzip $(1)/usr/bin/
endef

$(eval $(call BuildPackage,gzip))

