# 
# Copyright (C) 2006 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
# blogic@openwrt.org

include $(TOPDIR)/rules.mk

PKG_NAME:=libdrm
PKG_VERSION:=2.3.0
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.bz2
PKG_SOURCE_URL:=http://dri.freedesktop.org/libdrm/

include $(INCLUDE_DIR)/package.mk

define Package/libdrm
  SECTION:=xorg-misc
  CATEGORY:=Xorg
  SUBMENU:=misc
  TITLE:=library for direct rendering
  DEPENDS:=@TARGET_x86
endef

define Build/Configure
	cd  $(PKG_BUILD_DIR)/; \
		$(TARGET_CONFIGURE_OPTS) \
		./configure  \
			--host=$(GNU_TARGET_NAME) 
endef

define Build/Compile
	$(MAKE) -C $(PKG_BUILD_DIR) 
endef

define Build/InstallDev
	$(CP) $(PKG_BUILD_DIR)/libdrm/*.h $(1)/include 
	$(CP) $(PKG_BUILD_DIR)/shared-core/*.h $(1)/include 
	$(CP) $(PKG_BUILD_DIR)/libdrm/.libs/libdrm.so* $(1)/usr/lib/
	$(CP) $(PKG_BUILD_DIR)/libdrm.pc $(1)/usr/lib/pkgconfig/
endef

define Package/libdrm/install
	$(INSTALL_DIR) $(1)/usr/lib
	$(CP) $(PKG_BUILD_DIR)/libdrm/.libs/libdrm.so* $(1)/usr/lib/
endef

$(eval $(call BuildPackage,libdrm))
