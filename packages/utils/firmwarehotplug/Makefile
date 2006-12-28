# 
# Copyright (C) 2006 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=firmwarehotplug
PKG_VERSION:=0.1
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=@SF/linux-hotplug
PKG_MD5SUM:=unknown
PKG_CAT:=zcat

PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)-$(PKG_VERSION)
PKG_INSTALL_DIR:=$(PKG_BUILD_DIR)/ipkg-install

include $(INCLUDE_DIR)/package.mk

define Package/firmwarehotplug
  SECTION:=utils
  CATEGORY:=Utilities
  DEPENDS:=@USB_SUPPORT +fxload
  TITLE:=Hotplug firmware for EZ-USB microcontrollers
  URL:=http://linux-hotplug.sourceforge.net/
endef

define Build/Compile
	$(call Build/Compile/Default, \
		-C $(PKG_BUILD_DIR)/ezusb/midi/original \
		DESTDIR="$(PKG_INSTALL_DIR)" \
                all install
	)
endef

define Package/firmwarehotplug/install
	$(INSTALL_DIR) $(1)/etc/hotplug.d/usb
	install -m755 $(PKG_BUILD_DIR)/ezusb/midi/original/Hotplug/ezusbmidi $(1)/etc/hotplug.d/usb
	install -m644 $(PKG_BUILD_DIR)/ezusb/midi/original/Hotplug/ezusbmidi.usermap $(1)/etc/hotplug.d
	$(INSTALL_DIR) $(1)/usr/share/usb/ezusbmidi
	install -m644 $(PKG_BUILD_DIR)/ezusb/midi/original/ezusbmidi1x1.ihx $(1)/usr/share/usb/ezusbmidi
	install -m644 $(PKG_BUILD_DIR)/ezusb/midi/original/ezusbmidi2x2.ihx $(1)/usr/share/usb/ezusbmidi
endef

$(eval $(call BuildPackage,firmwarehotplug))

$(eval $(call RequireCommand,sdcc, \
      	$(PKG_NAME) requires sdcc. \
))
