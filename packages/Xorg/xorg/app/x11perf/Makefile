#
# Copyright (C) 2008-2009 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=x11perf
PKG_RELEASE:=1
PKG_VERSION:=1.5.1
PKG_SOURCE_URL:=http://xorg.freedesktop.org/releases/X11R7.5/src/app
PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.bz2
PKG_BUILD_DIR:=$(BUILD_DIR)/Xorg/$(PKG_NAME)-$(PKG_VERSION)/

PKG_MD5SUM:=66e4aa4645f83809071eb69553ed0222
PKG_INSTALL:=1

include $(INCLUDE_DIR)/package.mk

define Package/x11perf
  SECTION:=xorg-app
  CATEGORY:=Xorg
  SUBMENU:=app
  DEPENDS:=+libX11 +libXmuu +libXrender +libXft +libXext
  TITLE:=x11perf
  URL:=http://xorg.freedesktop.org/
endef

CONFIGURE_ARGS+=LIBS="-Wl,-rpath-link=$(STAGING_DIR)/usr/lib" 

define Package/x11perf/install
	$(INSTALL_DIR) $(1)/usr/bin $(1)/usr/lib/X11/x11perfcomp
	$(INSTALL_BIN) \
		$(PKG_INSTALL_DIR)/usr/bin/* \
		$(1)/usr/bin
	$(INSTALL_BIN) \
		$(PKG_INSTALL_DIR)/usr/lib/X11/x11perfcomp/* \
		$(1)/usr/lib/X11/x11perfcomp/
endef

$(eval $(call BuildPackage,x11perf))
