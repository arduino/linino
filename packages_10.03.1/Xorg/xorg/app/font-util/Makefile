#
# Copyright (C) 2006-2010 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=font-util
PKG_VERSION:=1.0.1
PKG_RELEASE:=3

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.bz2
PKG_SOURCE_URL:=http://xorg.freedesktop.org/releases/X11R7.3/src/font
PKG_MD5SUM:=b81535f78fe05732931f02841e5ca37b

include $(INCLUDE_DIR)/package.mk

define Package/font-util
  SECTION:=xorg-font
  CATEGORY:=Xorg
  SUBMENU:=app
  TITLE:=misc tool to generate x fonts
  DEPENDS:=+xserver
  URL:=http://xorg.freedesktop.org/
endef

define Build/Configure
	cd  $(PKG_BUILD_DIR)/; ./configure  
endef

define Build/Compile
	$(MAKE) -C $(PKG_BUILD_DIR)
	$(MAKE) -C $(PKG_BUILD_DIR) install DESTDIR="$(PKG_INSTALL_DIR)"
endef

define Build/InstallDev
	$(INSTALL_DIR) $(1)/usr/lib/pkgconfig $(1)/usr/lib/X11 $(2)/bin
	$(INSTALL_DATA) $(PKG_INSTALL_DIR)/usr/local/lib/pkgconfig/fontutil.pc $(1)/usr/lib/pkgconfig
	$(CP) $(PKG_INSTALL_DIR)/usr/local/lib/X11/* $(1)/usr/lib/X11/
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/usr/local/bin/* $(2)/bin/
endef

$(eval $(call BuildPackage,font-util))
