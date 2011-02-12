#
# Copyright (C) 2009 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=thunar
PKG_VERSION:=1.0.1
PKG_RELEASE:=1

PKG_SOURCE:=Thunar-$(PKG_VERSION).tar.bz2
PKG_BUILD_DIR:=$(BUILD_DIR)/Thunar-$(PKG_VERSION)
PKG_SOURCE_URL:=http://www.tx-us.xfce.org/archive/xfce-4.6.1/src/
PKG_MD5SUM:=218373aa45d74b6ba8c69c4d5af3bb19

PKG_FIXUP:=libtool
PKG_INSTALL:=1

include $(INCLUDE_DIR)/package.mk
include $(INCLUDE_DIR)/nls.mk

TARGET_LDFLAGS+= \
	-Wl,-rpath-link=$(STAGING_DIR)/usr/lib \
	-Wl,-rpath=/usr/lib

define Package/libthunar-vfs
  SECTION:=xorg-lib
  CATEGORY:=Xorg
  SUBMENU:=libraries
  TITLE:=thunar virtual filesystem library
  DEPENDS:=+libexo +libpng +libxfce4util +libgamin +libstartup-notification \
           +xfce4-panel +dbus-launch-x +gamin-server
endef

define Package/libthunarx
  SECTION:=xorg-lib
  CATEGORY:=Xorg
  SUBMENU:=libraries
  TITLE:=libthunarx
  DEPENDS:=+gtk2
endef

define Package/thunar
  SECTION:=xorg-app
  CATEGORY:=Xorg
  SUBMENU:=app
  TITLE:=thunar
  DEPENDS:=+libthunarx +libthunar-vfs
endef

define Build/Configure
	$(call Build/Configure/Default, \
		--libexecdir=/usr/lib/thunar/ \
	)
endef


define Build/InstallDev
	$(INSTALL_DIR)	$(1)/usr/{lib/pkgconfig,lib/thunarx-1,include}
	$(CP) \
		$(PKG_INSTALL_DIR)/usr/include/* \
		$(1)/usr/include/

	$(INSTALL_DATA) \
		$(PKG_INSTALL_DIR)/usr/lib/*.{la,a,so*} \
		$(1)/usr/lib/

	$(INSTALL_DATA) \
		$(PKG_INSTALL_DIR)/usr/lib/pkgconfig/* \
		$(1)/usr/lib/pkgconfig/
endef

define Package/libthunar-vfs/install
	$(INSTALL_DIR) $(1)/usr/lib/
	$(CP) \
		$(PKG_INSTALL_DIR)/usr/lib/libthunar-vfs-1.so* \
		$(1)/usr/lib/
endef

define Package/libthunarx/install
	$(INSTALL_DIR) $(1)/usr/lib/thunarx-1
	$(CP) \
		$(PKG_INSTALL_DIR)/usr/lib/libthunarx-1.so* \
		$(1)/usr/lib/
	$(CP) \
		$(PKG_INSTALL_DIR)/usr/lib/thunarx-1/*.so* \
		$(1)/usr/lib/thunarx-1/
endef

define Package/thunar/install
	$(INSTALL_DIR) $(1)/usr/bin/
	$(INSTALL_BIN) \
		$(PKG_INSTALL_DIR)/usr/bin/* \
		$(1)/usr/bin/

	$(INSTALL_DIR) $(1)/usr/lib/thunar/xfce4/panel-plugins
	$(INSTALL_BIN) \
		$(PKG_INSTALL_DIR)/usr/lib/thunar/{T,t}hunar* \
		$(1)/usr/lib/thunar/
	$(INSTALL_BIN) \
		$(PKG_INSTALL_DIR)/usr/lib/thunar/xfce4/panel-plugins/* \
		$(1)/usr/lib/thunar/xfce4/panel-plugins

	$(INSTALL_DIR) $(1)/usr/share/applications
	$(INSTALL_DATA) \
		$(PKG_INSTALL_DIR)/usr/share/applications/* \
		$(1)/usr/share/applications/

	$(INSTALL_DIR) $(1)/usr/share/xfce4/panel-plugins
	$(INSTALL_DATA) \
		$(PKG_INSTALL_DIR)/usr/share/xfce4/panel-plugins/* \
		$(1)/usr/share/xfce4/panel-plugins/

	$(INSTALL_DIR) $(1)/usr/share/dbus-1/services
	$(INSTALL_DATA) \
		$(PKG_INSTALL_DIR)/usr/share/dbus-1/services/* \
		$(1)/usr/share/dbus-1/services/

	$(INSTALL_DIR) $(1)/usr/share/icons
	$(CP) \
		$(PKG_INSTALL_DIR)/usr/share/icons/* \
		$(1)/usr/share/icons/

	$(INSTALL_DIR) $(1)/usr/share/pixmaps/Thunar
	$(INSTALL_DATA) \
		$(PKG_INSTALL_DIR)/usr/share/pixmaps/Thunar/* \
		$(1)/usr/share/pixmaps/Thunar
endef

$(eval $(call BuildPackage,libthunar-vfs))
$(eval $(call BuildPackage,libthunarx))
$(eval $(call BuildPackage,thunar))
