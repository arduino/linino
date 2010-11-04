#
# Copyright (C) 2009 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
# $Id$

include $(TOPDIR)/rules.mk

PKG_NAME:=pcmanfm
PKG_VERSION:=0.5
PKG_RELEASE:=2

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=@SF/pcmanfm
PKG_MD5SUM:=fe1a836eed6a42107e7d71a01a52f7ec
PKG_FIXUP:=libtool
PKG_INSTALL:=1

include $(INCLUDE_DIR)/package.mk

TARGET_CFLAGS+=-I$(STAGING_DIR)/usr/lib/libintl/include/

TARGET_LDFLAGS+= \
	-Wl,-rpath-link=$(STAGING_DIR)/usr/lib \
	-L$(STAGING_DIR)/usr/lib/libintl/lib

define Package/pcmanfm
  SECTION:=xorg-app
  CATEGORY:=Xorg
  SUBMENU:=app
  TITLE:=pcmanfm
  DEPENDS:=+gtk2 +libstartup-notification +libgamin
endef

define Build/Configure
	$(call Build/Configure/Default, \
	    --disable-hal \
	)
endef

define Package/pcmanfm/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_BIN) \
		$(PKG_INSTALL_DIR)/usr/bin/pcmanfm \
		$(1)/usr/bin

	$(INSTALL_DIR) $(1)/usr/share/{mime/packages,applications,pixmaps}
	$(INSTALL_DATA) \
		$(PKG_INSTALL_DIR)/usr/share/mime/packages/* \
		$(1)/usr/share/mime/packages

	$(INSTALL_DATA) \
		$(PKG_INSTALL_DIR)/usr/share/applications/* \
		$(1)/usr/share/applications

	$(INSTALL_DATA) \
		$(PKG_INSTALL_DIR)/usr/share/pixmaps/* \
		$(1)/usr/share/pixmaps/

	$(INSTALL_DIR) $(1)/usr/share/pcmanfm/{icons,ui}
	$(INSTALL_DATA) \
		$(PKG_INSTALL_DIR)/usr/share/pcmanfm/*.rules \
		$(1)/usr/share/pcmanfm/
	$(INSTALL_DATA) \
		$(PKG_INSTALL_DIR)/usr/share/pcmanfm/icons/* \
		$(1)/usr/share/pcmanfm/icons/
	$(INSTALL_DATA) \
		$(PKG_INSTALL_DIR)/usr/share/pcmanfm/ui/* \
		$(1)/usr/share/pcmanfm/ui/

endef

$(eval $(call BuildPackage,pcmanfm))
