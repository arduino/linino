#
# Copyright (C) 2007 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
# $Id: $

include $(TOPDIR)/rules.mk

PKG_NAME:=htop
PKG_VERSION:=0.6.5
PKG_RELEASE:=1
PKG_MD5SUM:=180aa7c9db7106ed1197b1e408660a0e

PKG_SOURCE_URL:=@SF/htop
PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_CAT:=zcat

PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)-$(PKG_VERSION)
PKG_INSTALL_DIR:=$(PKG_BUILD_DIR)/ipkg-install

include $(INCLUDE_DIR)/package.mk

define Package/htop
  SECTION:=admin
  CATEGORY:=Administration
  TITLE:=process viewer
  DEPENDS:=+libncurses
  DESCRIPTION:=\
	An interactive process viewer with colors \\\
	tree mode and other features.
  URL:=http://htop.sourceforge.net/
endef

define Build/Compile
	mkdir -p $(PKG_INSTALL_DIR)
	$(MAKE) -C $(PKG_BUILD_DIR) \
		DESTDIR="$(PKG_INSTALL_DIR)" \
		all install
endef

define Package/htop/install	
	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/htop $(1)/usr/bin
endef

$(eval $(call BuildPackage,htop))
