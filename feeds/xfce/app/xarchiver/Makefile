#
# Copyright (C) 2009 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=xarchiver
PKG_VERSION:=0.5.2
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.bz2
PKG_SOURCE_URL:=@SF/$(PKG_NAME)
PKG_MD5SUM:=2bc7f06403cc6582dd4a8029ec9d038d

PKG_FIXUP:=libtool
PKG_INSTALL:=1

include $(INCLUDE_DIR)/package.mk
include $(INCLUDE_DIR)/nls.mk


TARGET_LDFLAGS+= \
	-Wl,-rpath-link=$(STAGING_DIR)/usr/lib \
	-Wl,-rpath=/usr/lib

define Package/xarchiver
  SECTION:=xorg-app
  CATEGORY:=Xorg
  SUBMENU:=app
  TITLE:=xarchiver
  DEPENDS:=+gtk2
endef

define Package/xarchiver/install
	$(INSTALL_DIR) $(1)/usr/lib/thunar-archive-plugin
	$(INSTALL_BIN) \
		$(PKG_INSTALL_DIR)/usr/lib/thunar-archive-plugin/*.tap \
		$(1)/usr/lib/thunar-archive-plugin/

	$(INSTALL_DIR) $(1)/usr/bin/
	$(INSTALL_BIN) \
		$(PKG_INSTALL_DIR)/usr/bin/* \
		$(1)/usr/bin/

	$(INSTALL_DIR) $(1)/usr/share/pixmaps/xarchiver
	$(INSTALL_DATA) \
		$(PKG_INSTALL_DIR)/usr/share/pixmaps/xarchiver/* \
		$(1)/usr/share/pixmaps/xarchiver/

	$(INSTALL_DIR) $(1)/usr/share/icons
	$(CP) \
		$(PKG_INSTALL_DIR)/usr/share/icons/* \
		$(1)/usr/share/icons/

	$(INSTALL_DIR) $(1)/usr/share/applications
	$(INSTALL_DATA) \
		$(PKG_INSTALL_DIR)/usr/share/applications/* \
		$(1)/usr/share/applications
endef

$(eval $(call BuildPackage,xarchiver))
