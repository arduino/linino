#
# Copyright (C) 2009 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
# $Id$

include $(TOPDIR)/rules.mk

PKG_NAME:=lxpanel
PKG_VERSION:=0.5.6
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=@SF/lxde
PKG_MD5SUM:=3c6b5498b5f4109c3913b10a66809fe6
PKG_FIXUP:=libtool
PKG_INSTALL:=1

include $(INCLUDE_DIR)/package.mk
include $(INCLUDE_DIR)/nls.mk

TARGET_LDFLAGS+= \
	-Wl,-rpath-link=$(STAGING_DIR)/usr/lib

define Package/lxpanel
  SECTION:=xorg-app
  CATEGORY:=Xorg
  SUBMENU:=app
  TITLE:=lxpanel
  DEPENDS:=+gtk2 +libmenu-cache +libiw +lxde-common
endef

define Build/Configure
	$(call Build/Configure/Default, \
		--with-plugis=all \
	)
endef

define Package/lxpanel/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_BIN) \
		$(PKG_INSTALL_DIR)/usr/bin/lxpanel* \
		$(1)/usr/bin

	$(INSTALL_DIR) $(1)/usr/lib/lxpanel/plugins
	$(INSTALL_DATA) \
		$(PKG_INSTALL_DIR)/usr/lib/lxpanel/plugins/*.so \
		$(1)/usr/lib/lxpanel/plugins/

	$(INSTALL_DIR) $(1)/usr/share/lxpanel
	$(CP) \
		$(PKG_INSTALL_DIR)/usr/share/lxpanel/* \
		$(1)/usr/share/lxpanel/
	$(INSTALL_DIR) $(1)/usr/share/lxpanel/profile/default
	$(CP) \
		./files/default_config/* \
		$(1)/usr/share/lxpanel/profile/default/
endef

$(eval $(call BuildPackage,lxpanel))
