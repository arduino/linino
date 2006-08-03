# Copyright (C) 2006 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
# $Id$

include $(TOPDIR)/rules.mk

PKG_NAME:=libffi-sable
PKG_VERSION:=3325
PKG_RELEASE:=3
PKG_MD5SUM:=0c32eaaea0269c5fbe156fcd0be3e5bd

PKG_SOURCE_URL:=http://sablevm.org/download/snapshot/2005-01-21/
PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_CAT:=zcat

PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)-$(PKG_VERSION)
PKG_INSTALL_DIR:=$(PKG_BUILD_DIR)/ipkg-install

include $(INCLUDE_DIR)/package.mk

define Package/libffi-sable
  SECTION:=libs
  CATEGORY:=Libraries
  TITLE:=Foreign Function Interface library (for sablevm)
  DESCRIPTION:=The libffi library provides a portable, high level programming\\\
interface to various calling conventions. This allows a programmer to\\\
call any function specified by a call interface description at run\\\
time.\\\
  URL:=http://sources.redhat.com/libffi/
endef

define Build/Configure
$(call Build/Configure/Default,--enable-shared \
--enable-static \
--disable-debug)
endef

define Build/Compile	
	rm -rf $(PKG_INSTALL_DIR)
	mkdir -p $(PKG_INSTALL_DIR)
	$(MAKE) -C $(PKG_BUILD_DIR) \
		DESTDIR="$(PKG_INSTALL_DIR)" \
		all install
endef

define Package/libffi-sable/install	
	install -m0755 -d $(1)/usr/lib
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/libffi.so.* $(1)/usr/lib/
endef

define Build/InstallDev	
	mkdir -p $(STAGING_DIR)/usr/include
	$(CP) $(PKG_INSTALL_DIR)/usr/include/ffi{,target}.h $(STAGING_DIR)/usr/include/
	mkdir -p $(STAGING_DIR)/usr/lib
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/libffi.{a,so*} $(STAGING_DIR)/usr/lib/
endef

define Build/UninstallDev	
	rm -rf \
		$(STAGING_DIR)/usr/include/ffi{,target}.h \
		$(STAGING_DIR)/usr/lib/libffi.{a,so*}
endef

$(eval $(call BuildPackage,libffi-sable))
