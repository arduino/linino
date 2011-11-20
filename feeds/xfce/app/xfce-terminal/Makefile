#
# Copyright (C) 2009-2011 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=xfce-terminal
PKG_VERSION:=0.2.12
PKG_RELEASE:=1

PKG_SOURCE:=Terminal-$(PKG_VERSION).tar.bz2
PKG_BUILD_DIR:=$(BUILD_DIR)/Terminal-$(PKG_VERSION)
PKG_SOURCE_URL:=http://archive.xfce.org/xfce/4.6.1/src/
PKG_MD5SUM:=adb419d279c9fc16d02291c052190717

PKG_INSTALL:=1

include $(INCLUDE_DIR)/package.mk
include $(INCLUDE_DIR)/nls.mk

TARGET_LDFLAGS+= \
	-Wl,-rpath-link=$(STAGING_DIR)/usr/lib \
	-Wl,-rpath=/usr/lib

define Package/xfce-terminal
  SECTION:=xorg-app
  CATEGORY:=Xorg
  SUBMENU:=app
  TITLE:=xfce-terminal
  DEPENDS:=+libxfcegui4 +vte +libexo
endef

define Build/Configure
	$(call Build/Configure/Default, \
		--libexecdir=/usr/lib/xfce-terminal \
		--enable-debug=no \
		--disable-startup-notification \
		--disable-dbus \
	)
endef

define Package/xfce-terminal/install
	$(INSTALL_DIR) $(1)/usr/bin/
	$(INSTALL_BIN) \
		$(PKG_INSTALL_DIR)/usr/bin/Terminal \
		$(1)/usr/bin/
	(cd $(1)/usr/bin; ln -sf Terminal terminal)

	$(INSTALL_DIR) $(1)/usr/share/icons
	$(CP) \
		$(PKG_INSTALL_DIR)/usr/share/icons/* \
		$(1)/usr/share/icons/

	$(INSTALL_DIR) $(1)/usr/share/pixmaps
	$(INSTALL_DATA) \
		$(PKG_INSTALL_DIR)/usr/share/pixmaps/* \
		$(1)/usr/share/pixmaps/

	$(INSTALL_DIR) $(1)/usr/share/applications
	$(INSTALL_DATA) \
		$(PKG_INSTALL_DIR)/usr/share/applications/* \
		$(1)/usr/share/applications/

	$(INSTALL_DIR) $(1)/usr/share/Terminal
	$(INSTALL_DATA) \
		$(PKG_INSTALL_DIR)/usr/share/Terminal/*.ui \
		$(1)/usr/share/Terminal/
endef

$(eval $(call BuildPackage,xfce-terminal))
