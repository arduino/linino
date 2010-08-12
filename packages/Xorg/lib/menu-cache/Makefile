# 
# Copyright (C) 2010 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=menu-cache
PKG_VERSION:=0.3.2
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=@SF/project/lxde/menu-cache/menu-cache%20$(PKG_VERSION)
PKG_MD5SUM:=ac4a9ea77db68d3db3f9f53cc75af66a
PKG_INSTALL:=1

include $(INCLUDE_DIR)/package.mk

define Package/menu-cache
  SECTION:=xorg-libraries
  CATEGORY:=Xorg
  SUBMENU:=libraries
  TITLE:=menu-cache
  DEPENDS:=+libintl +libiconv +glib2
  URL:=http://sourceforge.net/projects/lxde/
endef

define Package/menu-cache/description
  LXDE menu-cache library
endef

TARGET_CFLAGS+= \
	-I$(STAGING_DIR)/usr/lib/libintl/include \
	-I$(STAGING_DIR)/usr/lib/libiconv/include

TARGET_LDFLAGS+= \
	-L$(STAGING_DIR)/usr/lib/libintl/lib \
	-L$(STAGING_DIR)/usr/lib/libiconv/lib

define Build/InstallDev
	$(INSTALL_DIR) $(1)/usr/lib
	$(INSTALL_DIR) $(1)/usr/include/menu-cache
	$(INSTALL_DATA) $(PKG_INSTALL_DIR)/usr/include/menu-cache/* $(1)/usr/include/menu-cache/
	$(INSTALL_DATA) $(PKG_INSTALL_DIR)/usr/lib/lib*.{so,a,la}* $(1)/usr/lib/
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/usr/lib/{menu-cached,menu-cache-gen} $(1)/usr/lib/
endef

define Package/menu-cache/install
	$(INSTALL_DIR) $(1)/usr/lib
	$(INSTALL_DATA) $(PKG_INSTALL_DIR)/usr/lib/lib*.so* $(1)/usr/lib/
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/usr/lib/{menu-cached,menu-cache-gen} $(1)/usr/lib/
endef

$(eval $(call BuildPackage,menu-cache))
