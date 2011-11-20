#
# Copyright (C) 2009-2011 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=xfce4-panel
PKG_VERSION:=4.6.1
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.bz2
PKG_SOURCE_URL:=http://archive.xfce.org/xfce/$(PKG_VERSION)/src/
PKG_MD5SUM:=73a366b9892152266b465d7d9c35bef4

PKG_FIXUP:=libtool
PKG_INSTALL:=1

include $(INCLUDE_DIR)/package.mk
include $(INCLUDE_DIR)/nls.mk

TARGET_LDFLAGS+= \
	-Wl,-rpath-link=$(STAGING_DIR)/usr/lib \
	-Wl,-rpath=/usr/lib

define Package/libxfce4-panel
  SECTION:=xorg-lib
  CATEGORY:=Xorg
  SUBMENU:=libraries
  TITLE:=libxfce4-panel
  DEPENDS:=+libstartup-notification +libxfce4util +gtk2 +pango +libX11
endef

define Package/xfce4-panel
  SECTION:=xorg-app
  CATEGORY:=Xorg
  SUBMENU:=app
  TITLE:=xfce4-panel
  DEPENDS:=+libxfce4util +libxfcegui4 +libexo +cairo +libwnck +libSM +libX11 \
           +gtk2 +libxfce4-panel
endef

define Build/InstallDev
	$(INSTALL_DIR)	$(1)/usr/{lib/pkgconfig,include/xfce4/libxfce4panel}
	$(INSTALL_DATA) \
		$(PKG_INSTALL_DIR)/usr/include/xfce4/libxfce4panel/* \
		$(1)/usr/include/xfce4/libxfce4panel/
	$(CP) \
		$(PKG_INSTALL_DIR)/usr/lib/*.{la,so*,a} \
		$(1)/usr/lib/
	$(INSTALL_DATA) \
		$(PKG_INSTALL_DIR)/usr/lib/pkgconfig/* \
		$(1)/usr/lib/pkgconfig/
endef

define Package/xfce4-panel/install
	$(INSTALL_DIR) $(1)/usr/lib/xfce4/panel-plugins
	$(CP) \
		$(PKG_INSTALL_DIR)/usr/lib/xfce4/panel-plugins/*.so* \
		$(1)/usr/lib/xfce4/panel-plugins

	$(INSTALL_DIR) $(1)/etc/xdg/xfce4/panel/
	$(INSTALL_DATA) \
		$(PKG_INSTALL_DIR)/etc/xdg/xfce4/panel/* \
		$(1)/etc/xdg/xfce4/panel/

	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_BIN) \
		$(PKG_INSTALL_DIR)/usr/bin/* \
		$(1)/usr/bin/

	$(INSTALL_DIR) $(1)/usr/share/xfce4/panel-plugins
	$(INSTALL_DATA) \
		$(PKG_INSTALL_DIR)/usr/share/xfce4/panel-plugins/* \
		$(1)/usr/share/xfce4/panel-plugins/

	$(INSTALL_DIR) $(1)/usr/share/applications
	$(INSTALL_DATA) \
		$(PKG_INSTALL_DIR)/usr/share/applications/* \
		$(1)/usr/share/applications/

	$(INSTALL_DIR) $(1)/usr/share/icons/hicolor
	$(CP) \
		$(PKG_INSTALL_DIR)/usr/share/icons/hicolor/* \
		$(1)/usr/share/icons/hicolor/
endef

define Package/libxfce4-panel/install
	$(INSTALL_DIR) $(1)/usr/lib/
	$(INSTALL_DATA) \
		$(PKG_INSTALL_DIR)/usr/lib/*.so* \
		$(1)/usr/lib/
endef

$(eval $(call BuildPackage,libxfce4-panel))
$(eval $(call BuildPackage,xfce4-panel))
