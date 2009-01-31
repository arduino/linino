# 
# Copyright (C) 2006 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
# $Id$

include $(TOPDIR)/rules.mk

PKG_NAME:=libnotimpl
PKG_VERSION:=1

PKG_BUILD_DIR:=$(BUILD_DIR)/libnotimpl

include $(INCLUDE_DIR)/package.mk

define Package/libnotimpl
  SECTION:=libs
  CATEGORY:=Libraries
  TITLE:=Implements functions missing from uClibc
endef

ifeq ($(ARCH),x86_64)
  FPIC:=-fPIC
endif

define cc
	$(TARGET_CC) $(TARGET_CFLAGS) $(FPIC) -Wall -c src/$(1).c -o $(PKG_BUILD_DIR)/$(1).o
endef

define Build/Prepare
	rm -rf $(PKG_BUILD_DIR)
	mkdir -p $(PKG_BUILD_DIR)
endef

TARGET_CFLAGS += $(FPIC)

define Build/Compile
	$(call cc,math)
	$(TARGET_CROSS)ar rc $(PKG_BUILD_DIR)/libnotimpl.a $(PKG_BUILD_DIR)/*.o
endef

define Build/InstallDev
	mkdir -p $(STAGING_DIR)/usr/lib
	$(CP) $(PKG_BUILD_DIR)/libnotimpl.a $(STAGING_DIR)/usr/lib/
endef

$(eval $(call BuildPackage,libnotimpl))
