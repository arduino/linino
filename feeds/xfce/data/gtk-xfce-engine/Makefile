#
# Copyright (C) 2009-2011 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=gtk-xfce-engine
PKG_VERSION:=2.6.0
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.bz2
PKG_SOURCE_URL:=http://archive.xfce.org/xfce/4.6.1/src/
PKG_MD5SUM:=e836705d2933d0a77c6628285e10d982

PKG_FIXUP:=libtool
PKG_INSTALL:=1

include $(INCLUDE_DIR)/package.mk
include $(INCLUDE_DIR)/nls.mk

TARGET_LDFLAGS+= \
	-Wl,-rpath-link=$(STAGING_DIR)/usr/lib \
	-Wl,-rpath=/usr/lib

define Package/gtk-xfce-engine
  SECTION:=xorg-app
  CATEGORY:=Xorg
  SUBMENU:=app
  TITLE:=gtk-xfce-engine
  DEPENDS:=+gtk2
endef

define Package/gtk-xfce-engine/install
	$(INSTALL_DIR) $(1)/usr/lib/gtk-2.0/2.10.0/engines
	$(INSTALL_BIN) \
		$(PKG_INSTALL_DIR)/usr/lib/gtk-2.0/2.10.0/engines/*.{so*,a} \
		$(1)/usr/lib/gtk-2.0/2.10.0/engines/

	$(INSTALL_DIR) $(1)/usr/share/themes
	$(CP) \
		$(PKG_INSTALL_DIR)/usr/share/themes/* \
		$(1)/usr/share/themes
endef

$(eval $(call BuildPackage,gtk-xfce-engine))
