# 
# Copyright (C) 2006 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
# $Id: $

include $(TOPDIR)/rules.mk

PKG_NAME:=libsigc++
PKG_VERSION:=2.0.17
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.bz2
PKG_SOURCE_URL:=http://ftp.gnome.org/pub/GNOME/sources/libsigc++/2.0/
PKG_MD5SUM:=fde0ee69e3125e982746d9fe005763e1
PKG_CAT:=bzcat

PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)-$(PKG_VERSION)
PKG_INSTALL_DIR:=$(PKG_BUILD_DIR)/ipkg-install

include $(INCLUDE_DIR)/package.mk

define Package/libsigcxx
  NAME:=libsigc++
  SECTION:=libs
  CATEGORY:=Libraries
  TITLE:=typesafe callback system for standard C++
  DESCRIPTION:=\
	It allows you to define signals and to connect those signals to any \\\
	callback function, either global or a member function, regardless of \\\
	whether it is static or virtual.
  URL:=http://libsigc++.sourceforge.net
endef

define Build/Configure
	$(call Build/Configure/Default)
endef

define Build/Compile
	$(MAKE) -C $(PKG_BUILD_DIR) \
		DESTDIR="$(PKG_INSTALL_DIR)" \
		all install
endef

define Build/InstallDev
	mkdir -p $(STAGING_DIR)/usr/include
	$(CP) $(PKG_INSTALL_DIR)/usr/include/* $(STAGING_DIR)/usr/include/
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/* $(STAGING_DIR)/usr/lib/
endef

define Build/UninstallDev
	rm -rf \
		$(STAGING_DIR)/usr/include/sigc++-2.0 \
		$(STAGING_DIR)/usr/lib/libsigc-2.0.* \
		$(STAGING_DIR)/usr/lib/sigc++-2.0
		
endef

define Package/libsigcxx/install
	$(INSTALL_DIR) $(1)/usr/lib
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/libsigc-2.0.* $(1)/usr/lib/
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/sigc++-2.0 $(1)/usr/lib/
endef

$(eval $(call BuildPackage,libsigcxx))
