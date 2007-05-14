# 
# Copyright (C) 2007 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
# $Id: $

include $(TOPDIR)/rules.mk

PKG_NAME:=asterisk-prompt-de
PKG_VERSION:=2.0
PKG_RELEASE:=1

PKG_SOURCE:=ast_prompts_de_v2_0.tar.gz
PKG_SOURCE_URL:=http://www.stadt-pforzheim.de/asterisk/dateien/
PKG_MD5SUM:=d263b0b746acf84d7519ff8fb6699dc8
PKG_CAT:=zcat

PKG_BUILD_DIR:=$(BUILD_DIR)/ast_prompts_de_v2_0
PKG_INSTALL_DIR:=$(PKG_BUILD_DIR)/ipkg-install

include $(INCLUDE_DIR)/package.mk

define Package/asterisk-prompt-de
  SECTION:=net
  CATEGORY:=Network
  TITLE:=German asterisk prompts
  DESCRIPTION:=German asterisk prompts
  DEPENDS:=+asterisk
  URL:=http://www.stadt-pforzheim.de/asterisk/
  SUBMENU:=asterisk (Complete Open Source PBX)
endef

define Build/Compile
endef

define Package/asterisk-prompt-de/install
	$(INSTALL_DIR) $(1)/usr/lib/asterisk/sounds/
	$(CP) $(PKG_BUILD_DIR)/var/lib/asterisk/sounds/* \
		$(1)/usr/lib/asterisk/sounds/
endef

$(eval $(call BuildPackage,asterisk-prompt-de))

