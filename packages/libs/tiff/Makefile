# 
# Copyright (C) 2006 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
# blogic@openwrt.org

include $(TOPDIR)/rules.mk

PKG_NAME:=tiff
PKG_VERSION:=3.8.2
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:= http://libtiff.maptools.org/dl/
PKG_FIXUP := libtool

include $(INCLUDE_DIR)/package.mk

define Package/libtiff
  SECTION:=libs
  CATEGORY:=Libraries
  TITLE:=TIFF libraries
  DEPENDS:=+zlib +libjpeg
endef

CONFIGURE_ARGS += --without-x
MAKE_FLAGS += all install DESTDIR=$(PKG_INSTALL_DIR)

define Build/InstallDev
	$(INSTALL_DIR) $(1)/usr/{lib,include}
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/lib* $(1)/usr/lib
	$(CP) $(PKG_INSTALL_DIR)/usr/include/* $(1)/usr/include/
endef

define Package/tiff/Install
	$(INSTALL_DIR) $(1)/usr/lib
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/lib*so* $(1)/usr/lib/
endef

$(eval $(call BuildPackage,libtiff))
