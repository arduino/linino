#
# Copyright (C) 2006-2010 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=libffi-sable
PKG_VERSION:=3325
PKG_RELEASE:=4

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=http://sablevm.org/download/snapshot/2005-01-21/
PKG_MD5SUM:=0c32eaaea0269c5fbe156fcd0be3e5bd

PKG_INSTALL:=1

include $(INCLUDE_DIR)/package.mk

define Package/libffi-sable
  SECTION:=libs
  CATEGORY:=Libraries
  TITLE:=Foreign Function Interface library (for sablevm)
  DEPENDS:=@!TARGET_avr32
  URL:=http://sources.redhat.com/libffi/
endef

define Package/libffi-sable/description
	The libffi library provides a portable, high level programming 
	interface to various calling conventions. This allows a programmer to 
	call any function specified by a call interface description at run 
	time.
endef

TARGET_CFLAGS += $(FPIC)

define Build/Configure
	$(call Build/Configure/Default, \
		--enable-shared \
		--enable-static \
		--disable-debug \
	)
endef

define Build/InstallDev
	$(INSTALL_DIR) $(1)/usr/include
	$(CP) $(PKG_INSTALL_DIR)/usr/include/ffi{,target}.h $(1)/usr/include/
	$(INSTALL_DIR) $(1)/usr/lib
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/libffi.{a,so*} $(1)/usr/lib/
endef

define Package/libffi-sable/install
	$(INSTALL_DIR) $(1)/usr/lib
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/libffi.so.* $(1)/usr/lib/
endef

$(eval $(call BuildPackage,libffi-sable))
