#
# Copyright (C) 2009-2011 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=xfce4-session
PKG_VERSION:=4.6.1
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.bz2
PKG_SOURCE_URL:=http://archive.xfce.org/xfce/$(PKG_VERSION)/src/
PKG_MD5SUM:=7628be41ed3511a20cff5673d9d39858

PKG_FIXUP:=libtool
PKG_INSTALL:=1

include $(INCLUDE_DIR)/package.mk
include $(INCLUDE_DIR)/nls.mk

TARGET_LDFLAGS+= \
	-Wl,-rpath-link=$(STAGING_DIR)/usr/lib \
	-Wl,-rpath=/usr/lib

define Package/xfce4-session
  SECTION:=xorg-app
  CATEGORY:=Xorg
  SUBMENU:=app
  TITLE:=xfce4-session
  DEPENDS:=+libxfce4util +libxfcegui4 +libwnck +dbus +libdbus +libxfconf \
  +libglade +iceauth +libX11 +libSM +xfconf +thunar +xfce4-panel \
  +xfce4-settings +xfdesktop +xfce-utils +xfwm4
endef

define Build/Configure
	$(call Build/Configure/Default,\
		ac_cv_header_linux_ioprio_h=no \
	)
endef

define Build/InstallDev
	$(INSTALL_DIR)	$(1)/usr/{lib/pkgconfig,include/xfce4/xfce4-session-4.6/libxfsm}
	$(INSTALL_DATA) \
		$(PKG_INSTALL_DIR)/usr/include/xfce4/xfce4-session-4.6/libxfsm/*.h \
		$(1)/usr/include/xfce4/xfce4-session-4.6/libxfsm/

	$(CP) \
		$(PKG_INSTALL_DIR)/usr/lib/*.{so*,a,la} \
		$(1)/usr/lib/

	$(INSTALL_DATA) \
		$(PKG_INSTALL_DIR)/usr/lib/pkgconfig/* \
		$(1)/usr/lib/pkgconfig/
endef

define Package/xfce4-session/install
	$(INSTALL_DIR) $(1)/usr/lib/
	$(CP) \
		$(PKG_INSTALL_DIR)/usr/lib/*.so* \
		$(1)/usr/lib/

	$(INSTALL_DIR) $(1)/usr/lib/
	$(INSTALL_BIN) \
		$(PKG_INSTALL_DIR)/usr/lib/{balou-*,xfsm-shutdown-helper} \
		$(1)/usr/lib/

	$(INSTALL_DIR) $(1)/usr/lib/xfce4/splash/engines
	$(CP) \
		$(PKG_INSTALL_DIR)/usr/lib/xfce4/splash/engines/*.so* \
		$(1)/usr/lib/xfce4/splash/engines/

	$(INSTALL_DIR) $(1)/usr/bin/
	$(INSTALL_BIN) \
		$(PKG_INSTALL_DIR)/usr/bin/* \
		$(1)/usr/bin/

	$(INSTALL_DIR) $(1)/etc/xdg/xfce4/xfconf/xfce-perchannel-xml
	$(INSTALL_DATA) \
		$(PKG_INSTALL_DIR)/etc/xdg/xfce4/xfconf/xfce-perchannel-xml/* \
		$(1)/etc/xdg/xfce4/xfconf/xfce-perchannel-xml/

	$(INSTALL_DIR) $(1)/usr/share/icons/hicolor
	$(CP) \
		$(PKG_INSTALL_DIR)/usr/share/icons/hicolor/* \
		$(1)/usr/share/icons/hicolor/

	$(INSTALL_DIR) $(1)/usr/share/themes
	$(CP) \
		$(PKG_INSTALL_DIR)/usr/share/themes/* \
		$(1)/usr/share/themes/

	$(INSTALL_DIR) $(1)/usr/share/applications
	$(INSTALL_DATA) \
		$(PKG_INSTALL_DIR)/usr/share/applications/* \
		$(1)/usr/share/applications

	$(INSTALL_DIR) $(1)/usr/share/xfce4/tips
	$(INSTALL_DATA) \
		$(PKG_INSTALL_DIR)/usr/share/xfce4/tips/* \
		$(1)/usr/share/xfce4/tips/
endef

$(eval $(call BuildPackage,xfce4-session))
