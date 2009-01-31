#
# Copyright (C) 2006 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
# $Id$

include $(TOPDIR)/rules.mk

PKG_NAME:=miax
PKG_VERSION:=1.4
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)_$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=http://mesh.dl.sourceforge.net/sourceforge/miax/
PKG_MD5SUM:=44f0d2ef46ee2697d890b7b96846adc7

PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)

include $(INCLUDE_DIR)/package.mk

define Package/miax
  SECTION:=net
  CATEGORY:=Network
  DEPENDS:=+libpthread +bluez-libs
  TITLE:=A console iax (asterisk) client
  URL:=http://www.eja.it/?l=gpl&testo=miax
endef

define Package/miax/description
	miax is a console iax (asterisk) client, it can work with 
	a soundcard as a normal voip phone, taking input/output from 
	keyboard, analog/gsm/isdn modem or bluetooth phones.
endef

define Build/Compile
	$(MAKE) -C "$(PKG_BUILD_DIR)" \
		CC="$(TARGET_CC)" \
		OFLAGS="$(TARGET_CFLAGS)" \
		CPPFLAGS="-I$(STAGING_DIR)/usr/include" \
		LDFLAGS="-L$(STAGING_DIR)/usr/lib" \
		all
endef

define Package/miax/install	
	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/miax $(1)/usr/bin/
endef

$(eval $(call BuildPackage,miax))
