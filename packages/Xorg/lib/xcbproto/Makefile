#
# Copyright (C) 2008 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
# $Id: Makefile 12846 2008-10-03 22:38:55Z lars $

include $(TOPDIR)/rules.mk

PKG_NAME:=xcb-proto
PKG_VERSION:=1.3
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.bz2
PKG_SOURCE_URL:=http://xcb.freedesktop.org/dist/
PKG_MD5SUM:=
PKG_FIXUP:=libtool
PKG_INSTALL:=1

include $(INCLUDE_DIR)/package.mk


TARGET_CFLAGS+=\
	-I$(STAGING_DIR)/usr/lib/libintl/include/

EXTRA_LDFLAGS+=\
	-Wl,-rpath-link=$(STAGING_DIR)/usr/lib \

STAMP_CONFIGURED:=$(STAMP_CONFIGURED)_$(call confvar,CONFIG_PACKAGE_xcbproto CONFIG_PACKAGE_gtk-cups2)

define Package/xcbproto
  SECTION:=xorg-libs
  CATEGORY:=Xorg
  SUBMENU:=lib
  TITLE:=xcbproto
  DEPENDS:=
endef

define Build/Configure
	$(call Build/Configure/Default, \
	)
endef

define Build/InstallDev
	$(INSTALL_DIR) $(1)/usr/lib/pkgconfig
	$(INSTALL_DIR) $(1)/host/{lib/python2.5/site-packages/xcbgen,share/xcb}

	$(INSTALL_DATA) \
		$(PKG_INSTALL_DIR)/usr/lib/python2.5/site-packages/xcbgen/*.py \
		$(1)/host/lib/python2.5/site-packages/xcbgen/

	$(INSTALL_DATA) \
		$(PKG_INSTALL_DIR)/usr/share/xcb/* \
		$(1)/host/share/xcb/

	$(INSTALL_DATA) \
		$(PKG_INSTALL_DIR)/usr/lib/pkgconfig/* \
		$(1)/usr/lib/pkgconfig/

	$(SED) 's,datadir=/usr,datadir=$(STAGING_DIR)/host,g' $(1)/usr/lib/pkgconfig/xcb-proto.pc
endef

define Package/xcbproto/install
	true
endef


$(eval $(call BuildPackage,xcbproto))
