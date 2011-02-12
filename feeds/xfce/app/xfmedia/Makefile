#
# Copyright (C) 2009 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=xfmedia
PKG_VERSION:=0.9.2
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.bz2
PKG_SOURCE_URL:=http://spuriousinterrupt.org/files/xfmedia/
PKG_MD5SUM:=6eb8bd1f67201f829e0f45e733c02bd5

PKG_FIXUP:=libtool
PKG_INSTALL:=1

include $(INCLUDE_DIR)/package.mk
include $(INCLUDE_DIR)/nls.mk

TARGET_LDFLAGS+= \
	-Wl,-rpath-link=$(STAGING_DIR)/usr/lib \
	-Wl,-rpath=/usr/lib

define Package/xfmedia
  SECTION:=xorg-app
  CATEGORY:=Xorg
  SUBMENU:=app
  TITLE:=xfmedia
  DEPENDS:=+libxfcegui4 +xine-lib +dbus +taglibc
endef

define Build/Configure
	$(call Build/Configure/Default, \
	)
endef

define Build/InstallDev
	$(INSTALL_DIR)	$(1)/usr/{lib/pkgconfig,include/xfmedia}
	$(INSTALL_DATA) \
		$(PKG_INSTALL_DIR)/usr/include/xfmedia/* \
		$(1)/usr/include/xfmedia/
	$(INSTALL_DATA) \
		$(PKG_INSTALL_DIR)/usr/lib/pkgconfig/* \
		$(1)/usr/lib/pkgconfig/
endef

define Package/xfmedia/install
	$(INSTALL_DIR) $(1)/usr/bin/
	$(INSTALL_BIN) \
		$(PKG_INSTALL_DIR)/usr/bin/* \
		$(1)/usr/bin/

	$(INSTALL_DIR) $(1)/etc/xdg/xfmedia
	$(INSTALL_BIN) \
		$(PKG_INSTALL_DIR)/etc/xdg/xfmedia/* \
		$(1)/etc/xdg/xfmedia

	$(INSTALL_DIR) $(1)/usr/lib/xfmedia/plugins
	$(CP) \
		$(PKG_INSTALL_DIR)/usr/lib/xfmedia/plugins/*.so* \
		$(1)/usr/lib/xfmedia/plugins/

	$(INSTALL_DIR) $(1)/usr/share/icons/hicolor/
	$(CP) \
		$(PKG_INSTALL_DIR)/usr/share/icons/hicolor/* \
		$(1)/usr/share/icons/hicolor/

	$(INSTALL_DIR) $(1)/usr/share/applications
	$(INSTALL_DATA) \
		$(PKG_INSTALL_DIR)/usr/share/applications/* \
		$(1)/usr/share/applications
endef

$(eval $(call BuildPackage,xfmedia))
