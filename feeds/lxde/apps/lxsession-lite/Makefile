#
# Copyright (C) 2009 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
# $Id$

include $(TOPDIR)/rules.mk

PKG_NAME:=lxsession-lite
PKG_VERSION:=0.3.7
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=@SF/lxde
PKG_MD5SUM:=4dc3e413f5a314e855ecc93bc67f6bd4
PKG_FIXUP:=libtool
PKG_INSTALL:=1

include $(INCLUDE_DIR)/package.mk
include $(INCLUDE_DIR)/nls.mk

TARGET_LDFLAGS+= \
	-Wl,-rpath-link=$(STAGING_DIR)/usr/lib

define Package/lxsession-lite
  SECTION:=xorg-app
  CATEGORY:=Xorg
  SUBMENU:=app
  TITLE:=lxsession-lite
  DEPENDS:=+glib2 +vte
endef

define Package/lxsession-lite/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_BIN) \
		$(PKG_INSTALL_DIR)/usr/bin/lxsession{,-logout} \
		$(1)/usr/bin

	$(INSTALL_DIR) $(1)/usr/share/lxsession/images
	$(INSTALL_DATA) \
		$(PKG_INSTALL_DIR)/usr/share/lxsession/images/* \
		$(1)/usr/share/lxsession/images/

endef

$(eval $(call BuildPackage,lxsession-lite))
