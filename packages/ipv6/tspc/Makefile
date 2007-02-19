# 
# Copyright (C) 2006 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
# $Id$

include $(TOPDIR)/rules.mk

PKG_NAME:=tspc
PKG_VERSION:=2.1.1
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)_$(PKG_VERSION).orig.tar.gz
PKG_SOURCE_URL:=http://ftp.debian.org/debian/pool/main/t/tspc
PKG_MD5SUM:=65183cae002feaacd8bc92d6a5404cc2
PKG_CAT:=zcat

PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)2
PKG_INSTALL_DIR:=$(PKG_BUILD_DIR)/ipkg-install

include $(INCLUDE_DIR)/package.mk

define Package/tspc
  SECTION:=ipv6
  CATEGORY:=IPv6
  TITLE:=Client for Hexago's (Freenet6's) IPv6 service
  DESCRIPTION:=\
	Client to configure an IPv6 tunnel to \\\
	Hexago's (Freenet6's) migration broker.
  URL:=http://www.hexago.com
endef

define Build/Compile
	rm -rf $(PKG_INSTALL_DIR)
	mkdir -p $(PKG_INSTALL_DIR)
	$(MAKE) -C $(PKG_BUILD_DIR) \
		CC="$(TARGET_CC)" \
		AR="$(TARGET_AR)" \
		installdir="$(PKG_INSTALL_DIR)" \
		install target=linux
endef

define Package/tspc/install
	$(INSTALL_DIR) $(1)/bin
	$(INSTALL_DIR) $(1)/etc
	$(INSTALL_DIR) $(1)/etc/tsp
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/bin/tspc $(1)/bin/
	$(INSTALL_CONF) $(PKG_INSTALL_DIR)/bin/tspc.conf $(1)/etc/tsp/
endef

$(eval $(call BuildPackage,tspc))
