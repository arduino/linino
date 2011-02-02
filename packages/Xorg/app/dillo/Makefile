#
# Copyright (C) 2006-2010 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=dillo
PKG_REV:=cc974615ae39
PKG_VERSION:=r$(PKG_REV)
PKG_RELEASE:=1

PKG_SOURCE_PROTO:=hg
PKG_SOURCE_VERSION:=$(PKG_REV)
PKG_SOURCE_SUBDIR:=$(PKG_NAME)-$(PKG_VERSION)
PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=http://hg.dillo.org/dillo
PKG_BUILD_DIR=$(BUILD_DIR)/Xorg/$(_CATEGORY)/$(PKG_NAME)-$(PKG_VERSION)/

include $(INCLUDE_DIR)/package.mk
include $(INCLUDE_DIR)/nls.mk

define Package/dillo
  SECTION:=xorg-app
  CATEGORY:=Xorg
  SUBMENU:=app
  TITLE:=Dillo2
  URL:=http://fltk.org/
  DEPENDS:=+libXft +libstdcpp +libpthread +zlib +fltk2 +libjpeg +libpng $(ICONV_DEPENDS)
endef

define Package/dillo/description
  Dillo is a web browser project completely written in C.
  Dillo aims to be a multi-platform browser alternative that
  is small, stable, developer-friendly, usable, fast, and
  extensible.

  Note: This is the fltk2 based dillo.
endef

EXTRA_CPPFLAGS+=-I$(ICONV_PREFIX)/include
EXTRA_LDFLAGS+=-L$(ICONV_PREFIX)/lib -Wl,-rpath-link=$(STAGING_DIR)/usr/lib

define Build/Configure
	(cd $(PKG_BUILD_DIR); ./autogen.sh );
	$(call Build/Configure/Default)
endef

define Build/Install
	DESTDIR="$(PKG_INSTALL_DIR)" $(MAKE) -C $(PKG_BUILD_DIR) install
endef

define Package/dillo/install
	$(INSTALL_DIR) $(1)/etc $(1)/usr/share/applications $(1)/usr/share/icons
	$(INSTALL_DATA) $(PKG_INSTALL_DIR)/etc/* $(1)/etc/
	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/usr/bin/dillo $(1)/usr/bin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/usr/bin/dpid $(1)/usr/bin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/usr/bin/dpidc $(1)/usr/bin
	$(INSTALL_DIR) $(1)/usr/lib
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/dillo $(1)/usr/lib/
	$(CP) ./files/dillo.png $(1)/usr/share/icons/
	$(INSTALL_DATA) ./files/dillo.desktop $(1)/usr/share/applications/
endef

$(eval $(call BuildPackage,dillo))
