# 
# Copyright (C) 2006 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
# $Id$

include $(TOPDIR)/rules.mk

PKG_NAME:=libcli
PKG_VERSION:=1.8.5
PKG_RELEASE:=1

PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)-$(PKG_VERSION)
PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=@SF/libcli
PKG_MD5SUM:=0fdd30df5a8c1388a4549751ba61247a
PKG_CAT:=zcat

PKG_INSTALL_DIR:=$(PKG_BUILD_DIR)/ipkg-install

include $(INCLUDE_DIR)/package.mk

define Package/libcli
  SECTION:=libs
  CATEGORY:=Libraries
  TITLE:=A Cisco-like CLI library
  DESCRIPTION:=A Cisco-like Command Line Interface (CLI) library.\\\
    Provides a shared library for including a Cisco-like \\\
    command-line interface into other software. It's a telnet \\\
    interface which supports command-line editing, history, \\\
    authentication and callbacks for a user-definable function tree
  URL:=http://libcli.sourceforge.net/
endef

define Build/Configure
endef

define Build/Compile
	rm -rf $(PKG_INSTALL_DIR)
	mkdir -p $(PKG_INSTALL_DIR)
	$(MAKE) -C $(PKG_BUILD_DIR) \
		CC="$(TARGET_CC)" \
		LD="$(TARGET_CC)" \
		DESTDIR="$(PKG_INSTALL_DIR)" \
		all install
endef

define Package/libcli/install
	install -d -m0755 $(1)/usr/lib
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/libcli.so.* $(1)/usr/lib
endef

define Build/InstallDev
	mkdir -p $(STAGING_DIR)/usr/include
	$(CP) $(PKG_INSTALL_DIR)/usr/include/libcli.h $(STAGING_DIR)/usr/include/
	mkdir -p $(STAGING_DIR)/usr/lib
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/libcli.so* $(STAGING_DIR)/usr/lib/
endef

define Build/UninstallDev
	rm -rf \
		$(STAGING_DIR)/usr/include/libcli.h \
		$(STAGING_DIR)/usr/lib/libcli.so*
endef

$(eval $(call BuildPackage,libcli))
