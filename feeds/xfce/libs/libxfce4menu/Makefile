#
# Copyright (C) 2009 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=libxfce4menu
PKG_VERSION:=4.6.1
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.bz2
PKG_SOURCE_URL:=http://www.tx-us.xfce.org/archive/xfce-$(PKG_VERSION)/src/
PKG_MD5SUM:=5dc9343885c2c6f931318b2a1cdcc9db

PKG_FIXUP:=libtool
PKG_INSTALL:=1

include $(INCLUDE_DIR)/package.mk
include $(INCLUDE_DIR)/nls.mk

define Package/libxfce4menu
  SECTION:=xorg-framework
  CATEGORY:=Xorg
  SUBMENU:=framework
  TITLE:=libxfce4menu
  DEPENDS:=+gtk2 +libxfce4util +glib2
endef

define Build/InstallDev
	$(INSTALL_DIR)	$(1)/usr/{lib/pkgconfig,include/xfce4/libxfce4menu-0.1}
	$(CP) \
		$(PKG_INSTALL_DIR)/usr/include/xfce4/libxfce4menu-0.1/* \
		$(1)/usr/include/xfce4/libxfce4menu-0.1/
	$(CP) \
		$(PKG_INSTALL_DIR)/usr/lib/*.{la,so*,a} \
		$(1)/usr/lib/
	$(INSTALL_DATA) \
		$(PKG_INSTALL_DIR)/usr/lib/pkgconfig/* \
		$(1)/usr/lib/pkgconfig/
endef

define Package/libxfce4menu/install
	$(INSTALL_DIR) $(1)/usr/lib/
	$(CP) \
		$(PKG_INSTALL_DIR)/usr/lib/*.so* \
		$(1)/usr/lib/
endef

$(eval $(call BuildPackage,libxfce4menu))
