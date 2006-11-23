# 
# Copyright (C) 2006 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
# $Id$

include $(TOPDIR)/rules.mk

PKG_NAME:=alsa-utils
PKG_VERSION:=1.0.13
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.bz2
PKG_SOURCE_URL:=ftp://ftp.alsa-project.org/pub/utils/
PKG_MD5SUM:=dfe4bb5d3217f3ec662b172ce8397cf0
PKG_CAT:=bzcat

PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)-$(PKG_VERSION)
PKG_INSTALL_DIR:=$(PKG_BUILD_DIR)/ipkg-install

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
	)
endef

define Build/Compile
	$(MAKE) -C $(PKG_BUILD_DIR) \
		DESTDIR="$(PKG_INSTALL_DIR)" \
		all install
endef

define Package/alsa-utils/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(CP) $(PKG_INSTALL_DIR)/usr/bin/amixer $(1)/usr/bin/
	$(CP) $(PKG_INSTALL_DIR)/usr/bin/alsamixer $(1)/usr/bin/
	$(CP) $(PKG_INSTALL_DIR)/usr/bin/aplay $(1)/usr/bin/
endef

$(eval $(call BuildPackage,alsa-utils))
