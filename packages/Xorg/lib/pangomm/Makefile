#
# Copyright (C) 2008 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
# blogic@openwrt.org

include $(TOPDIR)/rules.mk

PKG_NAME:=pangomm
PKG_VERSION:=2.26.0
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.bz2
PKG_SOURCE_URL:=@GNOME/$(PKG_NAME)/2.26/
PKG_FIXUP:=libtool

include $(INCLUDE_DIR)/package.mk

PKG_INSTALL=1

TARGET_CFLAGS+=\
	-I$(STAGING_DIR)/usr/lib/libintl/include/ \
	-I$(STAGING_DIR)/usr/lib/libiconv/include/

TARGET_LDFLAGS+=\
	-Wl,-rpath-link=$(STAGING_DIR)/usr/lib \
	-L$(STAGING_DIR)/usr/lib/libintl/lib/ \
	-L$(STAGING_DIR)/usr/lib/libiconv/lib/

define Package/pangomm
  SECTION:=xorg-libs
  CATEGORY:=Xorg
  SUBMENU:=libraries
  TITLE:=Text layout and rendering library
  DEPENDS:=+glibmm +cairomm +pango
endef

CONFIGURE_ARGS+= --disable-documentation

define Package/pangomm/description
c++-bindings for pango
endef

define Build/InstallDev
	$(INSTALL_DIR) \
		$(1)/usr/lib/pkgconfig \
		$(1)/usr/lib/pangomm/1.6.0/modules \
		$(1)/usr/include

	$(CP) \
		$(PKG_INSTALL_DIR)/usr/lib/* \
		$(1)/usr/lib/

	$(INSTALL_DATA) \
		$(PKG_INSTALL_DIR)/usr/lib/pkgconfig/* \
		$(1)/usr/lib/pkgconfig/

	$(CP) \
		$(PKG_INSTALL_DIR)/usr/include/* \
		$(1)/usr/include/
endef

define Package/pangomm/install
	$(INSTALL_DIR) \
		$(1)/usr/lib

	$(CP) \
		$(PKG_INSTALL_DIR)/usr/lib/*.so* \
		$(1)/usr/lib/
endef

$(eval $(call BuildPackage,pangomm))
