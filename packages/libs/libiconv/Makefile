#
# Copyright (C) 2010 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=libiconv
PKG_RELEASE:=2

include $(INCLUDE_DIR)/package.mk

define Package/libiconv
  SECTION:=libs
  CATEGORY:=Libraries
  TITLE:=Stub header for the GNU Character set conversion library
endef

define Build/Prepare
	$(INSTALL_DIR) $(PKG_BUILD_DIR)
	$(CP) ./src/* $(PKG_BUILD_DIR)/
endef      

define Build/Configure
endef

define Build/Compile
	$(TARGET_CC) -c $(PKG_BUILD_DIR)/iconv.c -o $(PKG_BUILD_DIR)/iconv.o -I$(PKG_BUILD_DIR)/include $(FPIC)
	$(TARGET_CROSS)ar rcs $(PKG_BUILD_DIR)/libiconv.a $(PKG_BUILD_DIR)/iconv.o
endef

define Build/InstallDev
	$(INSTALL_DIR) $(1)/usr/lib
	$(INSTALL_DATA) $(PKG_BUILD_DIR)/libiconv.a $(1)/usr/lib/

	$(INSTALL_DIR) $(1)/usr/include
	$(INSTALL_DATA) $(PKG_BUILD_DIR)/include/iconv.h $(1)/usr/include/

	$(INSTALL_DIR) $(1)/usr/share/aclocal
	$(INSTALL_DATA) $(PKG_BUILD_DIR)/m4/* $(1)/usr/share/aclocal/
endef

define Package/libiconv/install
	$(INSTALL_DIR) $(1)/tmp
	touch $(1)/tmp/.libiconv-placeholder
endef

$(eval $(call BuildPackage,libiconv))
