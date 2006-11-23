# 
# Copyright (C) 2006 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
# $Id$

include $(TOPDIR)/rules.mk

PKG_NAME:=bluez-utils
PKG_VERSION:=2.24
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=http://bluez.sourceforge.net/download
PKG_MD5SUM:=5f5488ff3d31bdb9cd36b7991fe68408
PKG_CAT:=zcat

PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)-$(PKG_VERSION)
PKG_INSTALL_DIR:=$(PKG_BUILD_DIR)/ipkg-install

include $(INCLUDE_DIR)/package.mk

define Package/bluez-utils
  SECTION:=utils
  CATEGORY:=Utilities
  DEPENDS:=+bluez-libs +libpthread
  TITLE:=Bluetooth utilities
  URL:=http://www.bluez.org/
endef

define Package/bluez-utils/conffiles
/etc/bluetooth/givepin
/etc/bluetooth/hcid.conf
/etc/bluetooth/rfcomm.conf
endef

define Build/Configure
	$(call Build/Configure/Default, \
		--disable-dbus \
		--disable-fuse \
		--disable-obex \
		--disable-alsa \
		--disable-cups \
		--disable-pcmcia \
		--disable-initscripts \
		--disable-bccmd \
		--disable-avctrl \
		--disable-hid2hci \
		--disable-dfutool \
		--disable-bcm203x \
		--disable-bluepin \
		--with-bluez="$(STAGING_DIR)/usr/include" \
		--with-usb=no \
	)
endef

define Build/Compile
	$(MAKE) -C $(PKG_BUILD_DIR) \
		DESTDIR="$(PKG_INSTALL_DIR)" \
		all install
endef

define Package/bluez-utils/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(CP) $(PKG_INSTALL_DIR)/usr/bin/* $(1)/usr/bin/
	$(INSTALL_DIR) $(1)/usr/sbin
	$(CP) $(PKG_INSTALL_DIR)/usr/sbin/* $(1)/usr/sbin/
	$(INSTALL_DIR) $(1)/etc/bluetooth
	$(CP) $(PKG_INSTALL_DIR)/../hcid/hcid.conf $(1)/etc/bluetooth/
	$(CP) $(PKG_INSTALL_DIR)/../rfcomm/rfcomm.conf $(1)/etc/bluetooth/
	install -m0700 ./files/givepin $(1)/etc/bluetooth/
endef

$(eval $(call BuildPackage,bluez-utils))
