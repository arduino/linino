#
# Copyright (C) 2010 OpenWrt.org
#
# This Makefile and the code shipped in src/ is free software, licensed
# under the GNU Lesser General Public License, version 2.1 and later.
# See src/COPYING for more information.
#
# Refer to src/COPYRIGHT for copyright statements on the source files.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=libiconv
PKG_RELEASE:=4

include $(INCLUDE_DIR)/package.mk

define Package/libiconv
  SECTION:=libs
  CATEGORY:=Libraries
  TITLE:=Tiny drop-in replacement for the GNU Character set conversion library
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
	$(INSTALL_DIR) $(1)/usr/lib/libiconv-stub/lib
	$(INSTALL_DATA) $(PKG_BUILD_DIR)/libiconv.a $(1)/usr/lib/libiconv-stub/lib/

	$(INSTALL_DIR) $(1)/usr/lib/libiconv-stub/include
	$(INSTALL_DATA) $(PKG_BUILD_DIR)/include/iconv.h $(1)/usr/lib/libiconv-stub/include/

	$(INSTALL_DIR) $(1)/usr/share/aclocal
	$(INSTALL_DATA) $(PKG_BUILD_DIR)/m4/* $(1)/usr/share/aclocal/
endef

define Package/libiconv/install
	$(INSTALL_DIR) $(1)/tmp
	touch $(1)/tmp/.libiconv-placeholder
endef

$(eval $(call BuildPackage,libiconv))
