#
# Copyright (C) 2009 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
# $Id$

include $(TOPDIR)/rules.mk

PKG_NAME:=lxtask
PKG_VERSION:=0.1.3
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=@SF/lxde
PKG_MD5SUM:=eccfb69ee1a209248b22a5f0a34a4734
PKG_FIXUP:=libtool
PKG_INSTALL:=1

include $(INCLUDE_DIR)/package.mk

TARGET_CFLAGS+= \
    -I$(STAGING_DIR)/usr/lib/libintl/include/ \
    -I$(STAGING_DIR)/usr/lib/libiconv/include/ \
    -include $(STAGING_DIR)/usr/include/libintl.h

TARGET_LDFLAGS+= \
	-Wl,-rpath-link=$(STAGING_DIR)/usr/lib \
	-L$(STAGING_DIR)/usr/lib/libintl/lib \
	-L$(STAGING_DIR)/usr/lib/libiconv/lib

define Package/lxtask
  SECTION:=xorg-app
  CATEGORY:=Xorg
  SUBMENU:=app
  TITLE:=lxtask
  DEPENDS:=+gtk2 +lxde-common +libintl +libiconv
endef

define Package/lxtask/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_BIN) \
		$(PKG_INSTALL_DIR)/usr/bin/lxtask \
		$(1)/usr/bin

	$(INSTALL_DIR) $(1)/usr/share/applications
	$(INSTALL_DATA) \
		$(PKG_INSTALL_DIR)/usr/share/applications/* \
		$(1)/usr/share/applications
endef

$(eval $(call BuildPackage,lxtask))
