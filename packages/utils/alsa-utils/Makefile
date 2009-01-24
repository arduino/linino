#
# Copyright (C) 2006-2009 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
# $Id$

include $(TOPDIR)/rules.mk

PKG_NAME:=alsa-utils
PKG_VERSION:=1.0.19
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.bz2
PKG_SOURCE_URL:=ftp://ftp.alsa-project.org/pub/utils/
PKG_MD5SUM:=5ff0379c707c1a29083233edc9ab4e06
PKG_INSTALL:=1

include $(INCLUDE_DIR)/package.mk

define Package/alsa-utils
  SECTION:=utils
  CATEGORY:=Utilities
  DEPENDS:=+alsa-lib +libncurses +libpthread
  TITLE:=ALSA (Advanced Linux Sound Architecture) utilities
  URL:=http://www.alsa-project.org/
endef

define Build/Configure
	$(call Build/Configure/Default, \
		--disable-rpath \
		--disable-alsatest \
		--disable-xmlto \
	)
endef

define Package/alsa-utils/install
	$(INSTALL_DIR) $(1)/usr/{s,}bin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/usr/bin/amixer $(1)/usr/bin/
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/usr/bin/alsamixer $(1)/usr/bin/
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/usr/bin/aplay $(1)/usr/bin/
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/usr/sbin/alsactl $(1)/usr/sbin/

	$(INSTALL_DIR) $(1)/usr/share/alsa/init
	$(INSTALL_DATA) \
	    $(PKG_INSTALL_DIR)/usr/share/alsa/init/* \
	    $(1)/usr/share/alsa/init/
endef

$(eval $(call BuildPackage,alsa-utils))
