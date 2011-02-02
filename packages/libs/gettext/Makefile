#
# Copyright (C) 2010 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=gettext
PKG_RELEASE:=2

include $(INCLUDE_DIR)/package.mk

define Package/libintl
  SECTION:=libs
  CATEGORY:=Libraries
  TITLE:=Stub header for the GNU Internationalization library
endef

define Build/Prepare
	$(INSTALL_DIR) $(PKG_BUILD_DIR)
	$(CP) ./src/* $(PKG_BUILD_DIR)/
endef      

define Build/Configure
endef

define Build/Compile
endef

define Build/InstallDev
	$(INSTALL_DIR) $(1)/usr/lib/libintl-stub/include
	$(INSTALL_DATA) $(PKG_BUILD_DIR)/include/libintl.h $(1)/usr/lib/libintl-stub/include/

	$(INSTALL_DIR) $(1)/usr/share/aclocal
	$(INSTALL_DATA) $(PKG_BUILD_DIR)/m4/* $(1)/usr/share/aclocal/
endef

define Package/libintl/install
	$(INSTALL_DIR) $(1)/tmp
	touch $(1)/tmp/.libintl-placeholder
endef

$(eval $(call BuildPackage,libintl))
