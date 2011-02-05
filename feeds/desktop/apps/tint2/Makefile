#
# Copyright (C) 2011 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=tint2
PKG_REV:=622
PKG_VERSION:=svn$(PKG_REV)
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=http://tint2.googlecode.com/svn/trunk/
PKG_SOURCE_PROTO:=svn
PKG_SOURCE_SUBDIR:=$(PKG_NAME)-$(PKG_VERSION)
PKG_SOURCE_VERSION:=$(PKG_REV)
PKG_INSTALL:=1
PKG_BUILD_PARALLEL:=1

include $(INCLUDE_DIR)/package.mk
include $(INCLUDE_DIR)/nls.mk
include $(INCLUDE_DIR)/cmake.mk

define Package/tint2
  SECTION:=xorg-app
  CATEGORY:=Xorg
  SUBMENU:=app
  TITLE:=Tint2 - simple panel/taskbar
  MAINTAINER:=Michael Buesch <mb@bu3sch.de>
  URL:=http://code.google.com/p/tint2/
  DEPENDS:=+cairo +pango +glib2 +libX11 +libXrandr +libXrender +libXcomposite +libXdamage +imlib2 +python-mini +python-gtk
endef

define Package/tint2/description
  tint2 is a simple panel/taskbar unintrusive and light (memory / cpu / aestetic).
endef

EXTRA_CFLAGS:=\
	-I$(STAGING_DIR)/usr/include/cairo \
	-I$(STAGING_DIR)/usr/include/pango-1.0 \
	-I$(STAGING_DIR)/usr/include/glib-2.0

define Package/tint2/install
	$(INSTALL_DIR) $(1)/usr/bin $(1)/usr/share $(1)/etc/xdg/tint2
	$(CP) ./files/tint2rc $(1)/etc/xdg/tint2/
	$(CP) $(PKG_INSTALL_DIR)/usr/bin/* $(1)/usr/bin/
	$(CP) $(PKG_INSTALL_DIR)/usr/share/* $(1)/usr/share/
endef

$(eval $(call BuildPackage,tint2))
