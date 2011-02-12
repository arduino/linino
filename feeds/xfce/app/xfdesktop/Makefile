#
# Copyright (C) 2009 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=xfdesktop
PKG_VERSION:=4.6.1
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.bz2
PKG_SOURCE_URL:=http://www.tx-us.xfce.org/archive/xfce-$(PKG_VERSION)/src/
PKG_MD5SUM:=ae15cacc3e3834cca7238a8e1035c50d

PKG_FIXUP:=libtool
PKG_INSTALL:=1

include $(INCLUDE_DIR)/package.mk
include $(INCLUDE_DIR)/nls.mk

TARGET_LDFLAGS+= \
	-Wl,-rpath-link=$(STAGING_DIR)/usr/lib \
	-Wl,-rpath=/usr/lib

define Package/xfdesktop
  SECTION:=xorg-app
  CATEGORY:=Xorg
  SUBMENU:=app
  TITLE:=xfdesktop
  DEPENDS:=+libxfce4util +libxfcegui4 +libxfce4menu +libxfconf +libwnck +libglade +thunar
endef

define Package/xfdesktop/install
	$(INSTALL_DIR) $(1)/etc/xdg/menus
	$(INSTALL_DATA) \
		$(PKG_INSTALL_DIR)/etc/xdg/menus/* \
		$(1)/etc/xdg/menus/

	$(INSTALL_DIR) $(1)/usr/lib/xfce4/modules
	$(INSTALL_DATA) \
		$(PKG_INSTALL_DIR)/usr/lib/xfce4/modules/*.so \
		$(1)/usr/lib/xfce4/modules/

	$(INSTALL_DIR) $(1)/usr/lib/xfce4/panel-plugins
	$(INSTALL_BIN) \
		$(PKG_INSTALL_DIR)/usr/lib/xfce4/panel-plugins/* \
		$(1)/usr/lib/xfce4/panel-plugins/

	$(INSTALL_DIR) $(1)/usr/bin/
	$(INSTALL_BIN) \
		$(PKG_INSTALL_DIR)/usr/bin/* \
		$(1)/usr/bin/

	$(INSTALL_DIR) $(1)/usr/share/icons/
	$(CP) \
		$(PKG_INSTALL_DIR)/usr/share/icons/* \
		$(1)/usr/share/icons/

	$(INSTALL_DIR) $(1)/usr/share/pixmaps
	$(CP) \
		$(PKG_INSTALL_DIR)/usr/share/pixmaps/* \
		$(1)/usr/share/pixmaps/

	$(INSTALL_DIR) $(1)/usr/share/xfce4
	$(CP) \
		$(PKG_INSTALL_DIR)/usr/share/xfce4/{backdrops,panel-plugins} \
		$(1)/usr/share/xfce4/

	$(INSTALL_DIR) $(1)/usr/share/desktop-directories
	$(CP) \
		$(PKG_INSTALL_DIR)/usr/share/desktop-directories/* \
		$(1)/usr/share/desktop-directories/

	$(INSTALL_DIR) $(1)/usr/share/applications
	$(INSTALL_DATA) \
		$(PKG_INSTALL_DIR)/usr/share/applications/* \
		$(1)/usr/share/applications/
endef

$(eval $(call BuildPackage,xfdesktop))
