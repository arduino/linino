#
# Copyright (C) 2006-2011 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk
include $(INCLUDE_DIR)/kernel.mk

PKG_NAME:=firewall-mod-save
PKG_VERSION:=1.0
PKG_RELEASE:=2

PKG_BUILD_DIR := $(BUILD_DIR)/$(PKG_NAME)

include $(INCLUDE_DIR)/package.mk

define Package/firewall-mod-save/Default
  SECTION:=libs
  CATEGORY:=Libraries
  TITLE:=Preserve dynamic chains during firewall restart
  MAINTAINER:=Daniel Dickinson <openwrt@cshore.neomailbox.net>
endef

define Package/firewall-mod-save
  $(call Package/firewall-mod-save/Default)
  DEPENDS:=+iptables
endef

define Package/firewall-mod-save/description
    Uses iptables-save to save the option chain in option table (default filter)
    as defined by the config section save in /etc/config/firewall.
endef

define Build/Prepare
endef

define Build/Configure
endef

define Build/Compile
endef

define Package/firewall-mod-save/install
	$(INSTALL_DIR) $(1)/lib/firewall
	$(INSTALL_DATA) ./files/20_save.sh $(1)/lib/firewall/
endef

$(eval $(call BuildPackage,firewall-mod-save))

