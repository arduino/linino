#
# Copyright (C) 2009 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=ccid
PKG_VERSION:=1.3.11
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.bz2
PKG_SOURCE_URL:=http://alioth.debian.org/frs/download.php/3080
PKG_MD5SUM:=727dc7eb4d560f81fe70a766a96de970

PKG_INSTALL:=1

include $(INCLUDE_DIR)/package.mk

define Package/ccid
  SECTION:=libs
  CATEGORY:=Libraries
  DEPENDS:=+libusb +libpcsclite
  TITLE:=Generic USB CCID smart card reader driver
  URL:=http://pcsclite.alioth.debian.org/ccid.html
endef

define Package/ccid/description
  Generic USB CCID (Chip/Smart Card Interface Devices) driver and  ICCD (Integrated Circuit(s) Card Devices).
endef

TARGET_CFLAGS += $(FPIC)

define Build/Configure
	$(call Build/Configure/Default, \
	  --enable-usbdropdir=/usr/lib/pcsc/drivers \
	)
endef

define Package/ccid/install
	$(INSTALL_DIR) $(1)/usr/lib/pcsc/
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/pcsc/drivers $(1)/usr/lib/pcsc/
endef

$(eval $(call BuildPackage,ccid))
