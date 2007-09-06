#
# Copyright (C) 2007 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
# $Id$

include $(TOPDIR)/rules.mk

PKG_NAME:=htop
PKG_VERSION:=0.6.5
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=@SF/htop
PKG_MD5SUM:=180aa7c9db7106ed1197b1e408660a0e

include $(INCLUDE_DIR)/package.mk

define Package/htop
  SECTION:=admin
  CATEGORY:=Administration
  TITLE:=process viewer
  DEPENDS:=+libncurses
  URL:=http://htop.sourceforge.net/
endef

define Package/htop/description
 An interactive process viewer with colors tree mode and other features.
endef

define Build/Compile
	$(MAKE) -C $(PKG_BUILD_DIR) all
endef

define Package/htop/install	
	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/htop $(1)/usr/bin/
endef

$(eval $(call BuildPackage,htop))
