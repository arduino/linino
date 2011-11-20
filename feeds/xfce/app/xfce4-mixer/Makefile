#
# Copyright (C) 2009-2011 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=xfce4-mixer
PKG_VERSION:=4.6.1
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.bz2
PKG_SOURCE_URL:=http://archive.xfce.org/xfce/$(PKG_VERSION)/src/
PKG_MD5SUM:=a99e2455445480ef5081fe69454a46fc

PKG_FIXUP:=libtool
PKG_INSTALL:=1

include $(INCLUDE_DIR)/package.mk
include $(INCLUDE_DIR)/nls.mk

TARGET_LDFLAGS+= \
	-Wl,-rpath-link=$(STAGING_DIR)/usr/lib \
	-Wl,-rpath=/usr/lib

define Package/xfce4-mixer
  SECTION:=xorg-app
  CATEGORY:=Xorg
  SUBMENU:=app
  TITLE:=xfce4-mixer
  DEPENDS:=+libxfce4util +libxfcegui4 +xfce4-panel +gst-plugins-base \
  +xfce4-panel
endef

define Package/xfce4-mixer/install
	$(INSTALL_DIR) $(1)/usr/bin/
	$(INSTALL_BIN) \
		$(PKG_INSTALL_DIR)/usr/bin/* \
		$(1)/usr/bin/

	$(INSTALL_DIR) $(1)/usr/lib/xfce4/panel-plugins
	$(INSTALL_BIN) \
		$(PKG_INSTALL_DIR)/usr/lib/xfce4/panel-plugins/* \
		$(1)/usr/lib/xfce4/panel-plugins/

	$(INSTALL_DIR) $(1)/usr/share/xfce4-mixer/icons
	$(CP) \
		$(PKG_INSTALL_DIR)/usr/share/xfce4-mixer/icons/* \
		$(1)/usr/share/xfce4-mixer/icons/

	$(INSTALL_DIR) $(1)/usr/share/pixmaps
	$(CP) \
		$(PKG_INSTALL_DIR)/usr/share/pixmaps/* \
		$(1)/usr/share/pixmaps/

	$(INSTALL_DIR) $(1)/usr/share/xfce4
	$(CP) \
		$(PKG_INSTALL_DIR)/usr/share/xfce4/* \
		$(1)/usr/share/xfce4/

	$(INSTALL_DIR) $(1)/usr/share/applications
	$(INSTALL_DATA) \
		$(PKG_INSTALL_DIR)/usr/share/applications/* \
		$(1)/usr/share/applications
endef

$(eval $(call BuildPackage,xfce4-mixer))
