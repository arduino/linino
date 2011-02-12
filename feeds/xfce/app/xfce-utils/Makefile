#
# Copyright (C) 2009 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=xfce-utils
PKG_VERSION:=4.6.1
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.bz2
PKG_SOURCE_URL:=http://www.tx-us.xfce.org/archive/xfce-$(PKG_VERSION)/src/
PKG_MD5SUM:=1aa2362b11e79e56d52ce0d265faf1b6

PKG_FIXUP:=libtool
PKG_INSTALL:=1

include $(INCLUDE_DIR)/package.mk
include $(INCLUDE_DIR)/nls.mk

TARGET_LDFLAGS+= \
	-Wl,-rpath-link=$(STAGING_DIR)/usr/lib \
	-Wl,-rpath=/usr/lib

define Package/xfce-utils
  SECTION:=xorg-app
  CATEGORY:=Xorg
  SUBMENU:=app
  TITLE:=xfce-utils
  DEPENDS:=+libxfce4util +libxfcegui4 +dbus-launch-x
endef

define Build/Configure
	$(call Build/Configure/Default, \
		--enable-dbus \
	    --disable-xfconf-migration \
	)
endef

define Package/xfce-utils/install
	$(INSTALL_DIR) $(1)/usr/bin/
	$(INSTALL_BIN) \
		$(PKG_INSTALL_DIR)/usr/bin/* \
		$(1)/usr/bin/

	$(INSTALL_DIR) $(1)/usr/share/icons
	$(CP) \
		$(PKG_INSTALL_DIR)/usr/share/icons/* \
		$(1)/usr/share/icons/

	$(INSTALL_DIR) $(1)/usr/share/dbus-1/services
	$(INSTALL_DATA) \
		$(PKG_INSTALL_DIR)/usr/share/dbus-1/services/* \
		$(1)/usr/share/dbus-1/services

	$(INSTALL_DIR) $(1)/usr/share/xfce4
	$(CP) \
		$(PKG_INSTALL_DIR)/usr/share/xfce4/* \
		$(1)/usr/share/xfce4/

	$(INSTALL_DIR) $(1)/root
	$(INSTALL_DATA) \
		$(PKG_INSTALL_DIR)/etc/xdg/xfce4/xinitrc \
		$(1)/root/.xinitrc
endef

$(eval $(call BuildPackage,xfce-utils))
