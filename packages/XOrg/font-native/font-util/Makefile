# 
# Copyright (C) 2006 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
# $Id: Makefile 8299 2007-08-01 12:32:53Z nico $

include $(TOPDIR)/rules.mk

PKG_NAME:=font-util
PKG_VERSION:=X11R7.1-1.0.1
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.bz2
PKG_SOURCE_URL:=http://xorg.freedesktop.org/releases/X11R7.2/src/font

include $(INCLUDE_DIR)/package.mk

define Package/font-util
  SECTION:=xorg-font
  CATEGORY:=Xorg
  SUBMENU:=fonts
  TITLE:=misc tool to generate x fonts
  DEPENDS:=+xorg-server @TARGET_x86
endef

define Build/Configure
	cd  $(PKG_BUILD_DIR)/; ./configure  
endef

define Build/Compile
	$(MAKE) -C $(PKG_BUILD_DIR)
	$(MAKE) -C $(PKG_BUILD_DIR) install DESTDIR="$(PKG_INSTALL_DIR)"
endef

define Build/InstallDev
	$(CP) $(PKG_INSTALL_DIR)/usr/local/lib/pkgconfig/fontutil.pc $(STAGING_DIR)/usr/lib/pkgconfig/
	$(CP) $(PKG_INSTALL_DIR)/usr/local/lib/X11/* $(STAGING_DIR)/usr/lib/X11/
	$(CP) $(PKG_INSTALL_DIR)/usr/local/bin/* $(STAGING_DIR)/usr/bin/
endef

$(eval $(call BuildPackage,font-util))
