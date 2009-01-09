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
PKG_MD5SUM:=d9275a714e83ab9c1f9b260c6eff1609
PKG_INSTALL:=1

include $(INCLUDE_DIR)/package.mk

define Package/xcbproto
  SECTION:=xorg-libs
  CATEGORY:=Xorg
  SUBMENU:=libraries
  TITLE:=xcbproto
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
