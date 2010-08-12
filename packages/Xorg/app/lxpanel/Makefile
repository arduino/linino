# 
# Copyright (C) 2010 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=lxpanel
PKG_VERSION:=0.5.6
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=@SF/project/lxde/LXPanel%20%28desktop%20panel%29/LXPanel%20$(PKG_VERSION)
PKG_MD5SUM:=3c6b5498b5f4109c3913b10a66809fe6
PKG_INSTALL:=1

include $(INCLUDE_DIR)/package.mk

define Package/lxpanel
  SECTION:=xorg-app
  CATEGORY:=Xorg
  SUBMENU:=app
  TITLE:=LXDE Panel
  DEPENDS:=+gtk2 +libintl +alsa-lib +menu-cache
  URL:=http://sourceforge.net/projects/lxde/
endef

define Package/lxpanel/description
  LXDE Panel
endef

TARGET_CFLAGS+= \
	-I$(STAGING_DIR)/usr/include/menu-cache \
	-I$(STAGING_DIR)/usr/lib/libintl/include

TARGET_LDFLAGS+= \
	-L$(STAGING_DIR)/usr/lib \
	-L$(STAGING_DIR)/usr/lib/libintl/lib

CONFIGURE_ARGS += \
	MENU_CACHE_CFLAGS="-I$(STAGING_DIR)/usr/include/menu-cache" \
	MENU_CACHE_LIBS="-L$(STAGING_DIR)/usr/lib -lmenu-cache" \
	--disable-nls

define Package/lxpanel/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_DIR) $(1)/usr/lib/lxpanel/plugins
	$(INSTALL_DIR) $(1)/usr/share/lxpanel/ui
	$(INSTALL_DIR) $(1)/usr/share/lxpanel/images/xkb-flags
	$(INSTALL_DIR) $(1)/usr/share/lxpanel/profile/default/panels
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/usr/bin/{lxpanel,lxpanelctl} $(1)/usr/bin/
	$(INSTALL_DATA) $(PKG_INSTALL_DIR)/usr/lib/lxpanel/plugins/*.so $(1)/usr/lib/lxpanel/plugins/
	$(INSTALL_DATA) $(PKG_INSTALL_DIR)/usr/share/lxpanel/images/*.png $(1)/usr/share/lxpanel/images/
	$(INSTALL_DATA) $(PKG_INSTALL_DIR)/usr/share/lxpanel/images/xkb-flags/*.png $(1)/usr/share/lxpanel/images/xkb-flags/
	$(INSTALL_DATA) $(PKG_INSTALL_DIR)/usr/share/lxpanel/ui/* $(1)/usr/share/lxpanel/ui/
	$(INSTALL_DATA) $(PKG_INSTALL_DIR)/usr/share/lxpanel/profile/default/config $(1)/usr/share/lxpanel/profile/default/
	$(INSTALL_DATA) $(PKG_INSTALL_DIR)/usr/share/lxpanel/profile/default/panels/* $(1)/usr/share/lxpanel/profile/default/panels/
endef

$(eval $(call BuildPackage,lxpanel))
