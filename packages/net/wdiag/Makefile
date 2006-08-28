# 
# Copyright (C) 2006 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
# $Id: $

include $(TOPDIR)/rules.mk

PKG_NAME:=wdiag
PKG_VERSION:=0.8
PKG_RELEASE:=1
PKG_MD5SUM:=248bc2ca318f697e9edce1af945c57bd

PKG_SOURCE_URL:=@SF/wdiag
PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tgz
PKG_CAT:=zcat

PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)
PKG_INSTALL_DIR:=$(PKG_BUILD_DIR)/ipkg-install

include $(INCLUDE_DIR)/package.mk

define Package/wdiag
  SECTION:=net
  CATEGORY:=Network
  TITLE:=Westell DSL Modem Diagnostics for Linux
  DESCRIPTION:=A collection of utilities to get DSL stats from Westell DSL modems.\\\
  URL:=http://sourceforge.net/projects/wdiag/
endef

define Build/Compile
	$(MAKE) -C $(PKG_BUILD_DIR)/src \
	$(TARGET_CONFIGURE_OPTS) \
	prefix="$(PKG_INSTALL_DIR)/usr"
endef

define Package/wdiag/install
	install -m0755 -d $(1)/usr/sbin
	$(CP) $(PKG_BUILD_DIR)/src/w{start,stop,estell} $(1)/usr/sbin
endef

$(eval $(call BuildPackage,wdiag))
