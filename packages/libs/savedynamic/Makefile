#
# Copyright (C) 2006-2009 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk
include $(INCLUDE_DIR)/kernel.mk

PKG_NAME:=savedynamic
PKG_VERSION:=1.0
PKG_RELEASE:=1
MAINTAINER:=Daniel Dickinson <cshore@csolve.net>

PKG_BUILD_DIR := $(BUILD_DIR)/$(PKG_NAME)

include $(INCLUDE_DIR)/package.mk

define Package/savedynamic/Default
  SECTION:=libs
  CATEGORY:=Libraries
  TITLE:=Preserve dynamic chains during firewall restart
endef

define Package/savedynamic
  $(call Package/savedynamic/Default)
  MENU:=1
  DEPENDS:=+iptables-utils
endef

define Package/savedynamic/description
    Uses iptables-save to save the option chain in option table (default filter)
    as defined by the config section save in /etc/config/firewall.
endef

define Build/Prepare
endef

define Build/Configure
endef

define Build/Compile
endef

define Package/block-extroot/install
	$(INSTALL_DIR) $(1)/lib/firewall
	$(INSTALL_DATA) ./files/savedynamic.sh $(1)/lib/firewall/
endef

$(eval $(call BuildPackage,savedynamic))

