# 
# Copyright (C) 2006 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
# blogic@openwrt.org

include $(TOPDIR)/rules.mk

PKG_NAME:=atk
PKG_VERSION:=1.22.0
PKG_RELEASE:=2

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.bz2
PKG_SOURCE_URL:=@GNOME/$(PKG_NAME)/1.22/
PKG_MD5SUM:=06a2b39a22d5ca35c47435da6b9643ac
PKG_FIXUP:=libtool

include $(INCLUDE_DIR)/package.mk

EXTRA_LDFLAGS:=-L$(STAGING_DIR)/usr/lib/libiconv/lib/ -L$(STAGING_DIR)/usr/lib/libintl/lib/

define Package/atk
  SECTION:=xorg-libs
  CATEGORY:=Xorg
  SUBMENU:=libraries
  TITLE:=Accesibility library for gtk+ apps
  DEPENDS:=+glib2
endef


define Build/Compile
	$(MAKE) -C $(PKG_BUILD_DIR) all install DESTDIR=$(PKG_INSTALL_DIR)
endef

define Build/InstallDev
	$(INSTALL_DIR) $(1)/usr/{lib,include}
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/lib* $(1)/usr/lib
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/pkgconfig/ $(1)/usr/lib/
	$(CP) $(PKG_INSTALL_DIR)/usr/include/* $(1)/usr/include/
endef

define Package/atk/install
	$(INSTALL_DIR) $(1)/usr/lib
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/lib*so* $(1)/usr/lib/
endef

$(eval $(call BuildPackage,atk))
