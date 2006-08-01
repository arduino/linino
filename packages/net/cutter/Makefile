# Copyright (C) 2006 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
# $Id$

include $(TOPDIR)/rules.mk

PKG_NAME:=cutter
PKG_VERSION:=1.03
PKG_RELEASE:=1
PKG_MD5SUM:=50093db9b64277643969ee75b83ebbd1

PKG_SOURCE_URL:=http://www.lowth.com/cutter/software/
PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tgz
PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)-$(PKG_VERSION)
PKG_CAT:=zcat
PKG_INSTALL_DIR:=$(PKG_BUILD_DIR)/ipkg-install

include $(INCLUDE_DIR)/package.mk

define Package/cutter
  SECTION:=net
  CATEGORY:=Network
  TITLE:=allows an user to abort TCP/IP connections
  DESCRIPTION:="Cutter" is an open source program that allows Linux firewall\\\
	administrators to abort TCP/IP connections routed over the\\\
	firewall or router on which it is run.\\\
  URL:=http://www.lowth.com/cutter/
endef
	
define Build/Compile
	$(TARGET_CC) $(PKG_BUILD_DIR)/cutter.c -o $(PKG_BUILD_DIR)/cutter
	install -d -m0755 $(PKG_INSTALL_DIR)/usr/sbin
	install -m0755 $(PKG_BUILD_DIR)/cutter $(PKG_INSTALL_DIR)/usr/sbin/
endef
	
define Package/cutter/install
	mkdir -p $(1)
	$(CP) $(PKG_INSTALL_DIR)/* $(1)/
endef

$(eval $(call BuildPackage,cutter))
