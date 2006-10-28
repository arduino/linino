# 
# Copyright (C) 2006 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
# $Id$

include $(TOPDIR)/rules.mk

PKG_NAME:=serdisplib
PKG_VERSION:=1.96
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=@SF/serdisplib
PKG_MD5SUM:=b074e02d8d63f34cba8ec45c23f63f78
PKG_CAT:=zcat

PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)-$(PKG_VERSION)

include $(INCLUDE_DIR)/package.mk

define Package/serdisplib
  SECTION:=libs
  CATEGORY:=Libraries
  TITLE:=A display control library
  DESCRIPTION:=\
	serdisplib is a library to drive serial and parallel displays \\\
	with built-in controllers.
  URL:=http://serdisplib.sourceforge.net/
endef

define Build/Configure
	$(call Build/Configure/Default, \
		--enable-shared \
		--enable-static \
	)
endef

define Build/Compile
	$(MAKE) -C $(PKG_BUILD_DIR) all
endef

define Build/InstallDev
	mkdir -p $(STAGING_DIR)/usr/include
	$(CP) $(PKG_BUILD_DIR)/include/serdisplib $(STAGING_DIR)/usr/include/
	mkdir -p $(STAGING_DIR)/usr/lib
	$(CP) $(PKG_BUILD_DIR)/lib/libserdisp.{a,so*} $(STAGING_DIR)/usr/lib/
endef

define Build/UninstallDev
	rm -rf \
		$(STAGING_DIR)/usr/include/serdisplib \
		$(STAGING_DIR)/usr/lib/libserdisp.{a,so*}
endef

define Package/serdisplib/install
	install -d -m0755 $(1)/usr/lib
	$(CP) $(PKG_BUILD_DIR)/lib/libserdisp.so.* $(1)/usr/lib
endef

$(eval $(call BuildPackage,serdisplib))
