# 
# Copyright (C) 2007 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
# $Id: $

include $(TOPDIR)/rules.mk

PKG_NAME:=aoetools
PKG_VERSION:=26
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=@SF/aoetools
PKG_MD5SUM:=9dc4a56cbd4ebd3eb226c2b46a401766

include $(INCLUDE_DIR)/package.mk

define Package/aoetools
  SECTION:=net
  CATEGORY:=Network
  TITLE:=ATA over Ethernet tools
  URL:=http://aoetools.sourceforge.net/
endef

define Package/aoetools/description
	The aoetools are programs for users of the ATA over Ethernet (AoE)
	network storage protocol, a simple protocol for using storage over an
	ethernet LAN. The vblade program (storage target) exports a block
	device using AoE.
endef

CONFIGURE_ARGS +=  NPERSHELF=16

define Package/$(PKG_NAME)/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/aoe-discover $(1)/usr/bin/
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/aoe-flush $(1)/usr/bin/
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/aoe-mkdevs $(1)/usr/bin/
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/aoe-mkshelf $(1)/usr/bin/
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/aoe-revalidate $(1)/usr/bin/
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/aoe-stat $(1)/usr/bin/
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/aoeping $(1)/usr/bin/
endef

$(eval $(call BuildPackage,$(PKG_NAME)))
