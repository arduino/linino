#
# Copyright (C) 2006 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
# $Id$

include $(TOPDIR)/rules.mk

PKG_NAME:=bluez-utils
PKG_VERSION:=3.24
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=http://bluez.sourceforge.net/download
PKG_MD5SUM:=cc3582da827bc4c468147af1afaa5aff

PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)-$(PKG_VERSION)
PKG_INSTALL_DIR:=$(PKG_BUILD_DIR)/ipkg-install

include $(INCLUDE_DIR)/package.mk

define Package/bluez-utils
  SECTION:=utils
  CATEGORY:=Utilities
  DEPENDS:=+bluez-libs +libpthread +dbus
  TITLE:=Bluetooth utilities
  URL:=http://www.bluez.org/
endef

define Package/bluez-utils/conffiles
/etc/bluetooth/hcid.conf
/etc/bluetooth/rfcomm.conf
/etc/config/bluetooth
endef


define Build/Configure
	$(call Build/Configure/Default, \
		--enable-debug \
		--enable-usb \
		--enable-input \
		--enable-serial \
		--enable-network \
		--with-bluez="$(STAGING_DIR)/usr/include" \
		--with-usb=yes \
	)
endef

define Build/Compile
	$(MAKE) -C $(PKG_BUILD_DIR) \
		DESTDIR="$(PKG_INSTALL_DIR)" \
		all install
endef

#copy bluetooth.conf nach /etc/dbus-1/system.d/

define Package/bluez-utils/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/usr/bin/* $(1)/usr/bin/
	$(INSTALL_DIR) $(1)/usr/sbin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/usr/sbin/* $(1)/usr/sbin/
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/../daemon/passkey-agent $(1)/usr/sbin/
	$(INSTALL_DIR) $(1)/etc/bluetooth
	$(CP) $(PKG_INSTALL_DIR)/../hcid/hcid.conf $(1)/etc/bluetooth/
	$(CP) $(PKG_INSTALL_DIR)/../rfcomm/rfcomm.conf $(1)/etc/bluetooth/
	$(INSTALL_DIR) $(1)/etc/config
	$(INSTALL_DATA) ./files/bluetooth.conf $(1)/etc/config/bluetooth
	$(INSTALL_DIR) $(1)/etc/dbus-1/system.d/
	$(INSTALL_DATA) $(PKG_INSTALL_DIR)/../daemon/bluetooth.conf $(1)/etc/dbus-1/system.d/
	$(INSTALL_DIR) $(1)/etc/init.d
	$(INSTALL_BIN) ./files/bluez-utils.init $(1)/etc/init.d/bluez-utils
endef

$(eval $(call BuildPackage,bluez-utils))
