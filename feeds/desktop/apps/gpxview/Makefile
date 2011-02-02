#
# Copyright (C) 2010 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=gpxview
PKG_VERSION_BASE:=0.9.1
PKG_VERSION_SUFFIX:=-1
PKG_VERSION:=$(PKG_VERSION_BASE)$(PKG_VERSION_SUFFIX)
PKG_RELEASE:=2

PKG_SOURCE:=gpxview_$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=http://repository.maemo.org/extras/pool/chinook/free/source/g/gpxview/
PKG_MD5SUM:=7c29b4cbfb1a54c1abe559c63e0a79db
PKG_INSTALL:=1
PKG_BUILD_PARALLEL:=1
PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)-$(PKG_VERSION_BASE)

include $(INCLUDE_DIR)/package.mk
include $(INCLUDE_DIR)/nls.mk

define Package/gpxview
  SECTION:=xorg-app
  CATEGORY:=Xorg
  SUBMENU:=app
  TITLE:=GPXView Geocaching app
  MAINTAINER:=Michael Buesch <mb@bu3sch.de>
  URL:=http://www.harbaum.org/till/maemo/index.shtml#gpxview
  DEPENDS:=+gpsd +libxml2 +libcurl +libsoup +gtkhtml +gtk2 +glib2 +libsqlite3 $(ICONV_DEPENDS) $(INTL_DEPENDS)
endef

define Package/gpxview/description
  GPXView is a viewer for Geocaching.com GPX files and a simple GPS navigation software.
endef

EXTRA_CFLAGS:= \
	-I$(ICONV_PREFIX)/include \
	-I$(INTL_PREFIX)/include

EXTRA_LDFLAGS:= \
	-L$(ICONV_PREFIX)/lib \
	-L$(INTL_PREFIX)/lib \
	-Wl,-rpath-link=$(STAGING_DIR)/usr/lib \
	-Wl,-rpath=/usr/lib/

MAKE_INSTALL_FLAGS+= \
	bindir="/bin"

define Package/gpxview/install
	$(INSTALL_DIR) $(1)/usr/bin $(1)/usr/share/gpxview
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/usr/bin/gpxview $(1)/usr/bin/
	$(CP) $(PKG_INSTALL_DIR)/usr/share/gpxview $(1)/usr/share/
endef

$(eval $(call BuildPackage,gpxview))
