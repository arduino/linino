#
# Copyright (C) 2009-2010 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=gtkhtml
PKG_VERSION:=3.29.1
PKG_RELEASE:=2

PKG_SOURCE_URL:=@GNOME/$(PKG_NAME)/3.29
PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_MD5SUM:=899228059480ee3020ad49207d03b620

PKG_FIXUP:=libtool
PKG_INSTALL:=1

include $(INCLUDE_DIR)/package.mk
include $(INCLUDE_DIR)/nls.mk

define Package/gtkhtml
  SECTION:=xorg-app
  CATEGORY:=Xorg
  SUBMENU:=app
  DEPENDS:=+gtk2 +libgconf2 +gnome-icon-theme
  TITLE:=gtkhtml
  URL:=http://www.gnome.org/projects/gtkhtml/
endef

TARGET_LDFLAGS+=\
	-Wl,-rpath-link=$(STAGING_DIR)/usr/lib

define Build/Configure
	$(call Build/Configure/Default, \
		--enable-shared \
		--enable-static \
		--disable-shlib-factory \
	);
endef

define Build/InstallDev
	$(INSTALL_DIR) \
		$(1)/usr/lib/pkgconfig \
		$(1)/usr/include \
		$(1)/usr/lib

	$(CP) \
		$(PKG_INSTALL_DIR)/usr/lib/*.{la,a,so*} \
		$(1)/usr/lib/

	$(CP) \
		$(PKG_INSTALL_DIR)/usr/include/* \
		$(1)/usr/include/

	$(CP) \
		$(PKG_INSTALL_DIR)/usr/lib/pkgconfig/* \
		$(1)/usr/lib/pkgconfig/
endef

define Package/gtkhtml/install
	$(INSTALL_DIR) \
		$(1)/usr/share \
		$(1)/usr/lib

	$(CP) \
		$(PKG_INSTALL_DIR)/usr/lib/*.so* \
		$(1)/usr/lib/

	$(CP) \
		$(PKG_INSTALL_DIR)/usr/share/gtkhtml* \
		$(1)/usr/share/
endef

$(eval $(call BuildPackage,gtkhtml))
