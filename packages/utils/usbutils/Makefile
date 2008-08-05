#
# Copyright (C) 2007 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
# $Id$

include $(TOPDIR)/rules.mk

PKG_NAME:=usbutils
PKG_VERSION:=0.73
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=@SF/linux-usb
PKG_MD5SUM:=88978b4ad891f610620b1b8e5e0f43eb

PKG_BUILD_DEPENDS:=zlib

include $(INCLUDE_DIR)/package.mk

define Package/usbutils
  SECTION:=utils
  CATEGORY:=Utilities
  DEPENDS:=+libusb +zlib
  TITLE:=USB devices listing utilities
  URL:=http://linux-usb.sourceforge.net/
endef

define Package/usbutils/postinst
#!/bin/sh
$${IPKG_INSTROOT}/usr/sbin/update-usbids.sh
endef

# uses GNU configure

define Build/Compile
	$(MAKE) -C $(PKG_BUILD_DIR) \
		DESTDIR="$(PKG_INSTALL_DIR)" \
		all install
endef

define Package/usbutils/install
	$(INSTALL_DIR) $(1)/usr/sbin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/usr/sbin/lsusb $(1)/usr/sbin/
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/update-usbids.sh $(1)/usr/sbin/
	$(INSTALL_DIR) $(1)/usr/share
	$(INSTALL_DATA) $(PKG_INSTALL_DIR)/usr/share/usb.ids.gz $(1)/usr/share/
endef

$(eval $(call BuildPackage,usbutils))
