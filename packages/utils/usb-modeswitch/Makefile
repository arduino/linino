#
# Copyright (C) 2008-2009 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=usb_modeswitch
PKG_VERSION:=0.9.5
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.bz2
PKG_SOURCE_URL:=http://www.draisberghof.de/usb_modeswitch
PKG_CAT:=bzcat
PKG_MD5SUM:=d84961e86f0c3578f83448a3fb01ef52

include $(INCLUDE_DIR)/package.mk

define Package/usb-modeswitch
  SECTION:=utils
  CATEGORY:=Utilities
  DEPENDS:=+libusb
  TITLE:=USB ModeSwitch
endef

define Package/usb-modeswitch/description
  A mode switching tool for controlling
  "flip flop" (multiple device) USB gear.
endef

define Build/Compile
	"$(TARGET_CC)" $(TARGET_CFLAGS) $(TARGET_CPPFLAGS) $(TARGET_LDFLAGS) \
		-lusb \
		-o $(PKG_BUILD_DIR)/usb_modeswitch-OpenWrt \
				$(PKG_BUILD_DIR)/usb_modeswitch.c
endef

define Package/usb-modeswitch/install	
	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/usb_modeswitch-OpenWrt $(1)/usr/bin/usb_modeswitch
endef

$(eval $(call BuildPackage,usb-modeswitch))
