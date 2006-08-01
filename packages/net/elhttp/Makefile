#
# Copyright (C) 2006 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
# $Id$

include $(TOPDIR)/rules.mk

PKG_NAME:=elhttp
PKG_VERSION:=0.22
PKG_RELEASE:=1
PKG_MD5SUM:=b52f68c47f709e9fc9429250eb8f954c

PKG_SOURCE_URL:=http://phadej.daug.net/files/ \
	http://www.cr0.net:8040/code/network/
PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tgz
PKG_CAT:=zcat

PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)-$(PKG_VERSION)
PKG_INSTALL_DIR:=$(PKG_BUILD_DIR)/ipkg-install

include $(INCLUDE_DIR)/package.mk

define Package/elhttp
  SECTION:=net
  CATEGORY:=Network
  TITLE:=The extra-light http proxy server
  DESCRIPTION:=The extra-light http proxy server. Features: keep-alive\\\
	connections, http connect method, SSL/TLS support, ACLs\\\
	and client requests logging.\\\
  URL:=http://www.cr0.net:8040/code/network/
endef


define Build/Compile
	mkdir -p $(PKG_INSTALL_DIR)/usr/sbin
	$(MAKE) CC=$(TARGET_CC) CROSS=$(TARGET_CROSS) -C $(PKG_BUILD_DIR) \
		DESTDIR="$(PKG_INSTALL_DIR)" \
		all install
endef

define Package/elhttp/install
	mkdir -p $(1)
	$(CP) $(PKG_INSTALL_DIR)/* $(1)/ 
endef

$(eval $(call BuildPackage,elhttp))
