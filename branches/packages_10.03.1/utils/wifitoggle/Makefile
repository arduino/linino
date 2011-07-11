# 
# Copyright (C) 2010 segal.di.ubi.pt 
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=wifitoggle
PKG_VERSION:=1
PKG_RELEASE:=2

include $(INCLUDE_DIR)/package.mk

define Package/wifitoggle
  SECTION:=utils
  CATEGORY:=Utilities
  TITLE:=Script to toogle WiFi with a button and UCI config
  MAINTAINER:=Nuno Goncalves <nunojpg@gmail.com>
endef

define Package/wifitoggle/description
Very versatile script to toogle WiFi with a button. Allows to set
timeouts, persist changes after boot, and set leds acording to the state.
endef

define Package/wifitoggle/conffiles
/etc/config/wifitoggle
endef

define Build/Compile
endef

define Package/wifitoggle/install
	$(INSTALL_DIR) $(1)/etc/hotplug.d/button
	$(INSTALL_BIN) ./files/hotplug_wifitoggle $(1)/etc/hotplug.d/button/50-wifitoggle
	$(INSTALL_DIR) $(1)/etc/config
	$(INSTALL_DATA) ./files/uci_wifitoggle $(1)/etc/config/wifitoggle
endef

$(eval $(call BuildPackage,wifitoggle))
