# 
# Copyright (C) 2006 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
# $Id$

include $(TOPDIR)/rules.mk

PKG_NAME:=usbutils
PKG_VERSION:=0.71
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=@SF/linux-usb
PKG_MD5SUM:=479d7c7098ef44cc95e7978fd71c712c
PKG_CAT:=zcat

PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)-$(PKG_VERSION)
PKG_INSTALL_DIR:=$(PKG_BUILD_DIR)/ipkg-install

include $(INCLUDE_DIR)/package.mk

define Package/usbutils
  SECTION:=utils
  CATEGORY:=Utilities
  DEPENDS:=+libusb
  TITLE:=USB devices listing utilities
  URL:=http://linux-usb.sourceforge.net/
endef

# uses GNU configure

define Build/Compile
	$(MAKE) -C $(PKG_BUILD_DIR) \
		DESTDIR="$(PKG_INSTALL_DIR)" \
		all install
endef

define Package/usbutils/install
	install -d -m0755 $(1)/usr/sbin
	$(CP) $(PKG_INSTALL_DIR)/usr/sbin/lsusb $(1)/usr/sbin/
	install -d -m0755 $(1)/usr/share
	$(CP) $(PKG_INSTALL_DIR)/usr/share/usb.ids $(1)/usr/share/
endef

$(eval $(call BuildPackage,usbutils))
