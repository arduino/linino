# 
# Copyright (C) 2006-2008 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
# $Id: Makefile 11116 2008-05-11 22:27:32Z nico $

include $(TOPDIR)/rules.mk

PKG_NAME:=pepsal
PKG_VERSION:=1.2.1
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=@SF/$(PKG_NAME)
PKG_MD5SUM:=c8ce69ad5590240d37118c8b6d2c1b0b

include $(INCLUDE_DIR)/package.mk

define Package/pepsal
  TITLE:=Performance Enhancing Proxy
  SECTION:=net
  CATEGORY:=Network
  DEPENDS:=+libnetfilter-queue
  URL:=http://pepsal.sourceforge.net/
endef

define Package/pepsal/description
 PEPsal is an integrated, multi-layer, transparent TCP Performance Enhancing 
 Proxy which splits the connection into two parts, making use of Linux TCP 
 enhancements when sending data, and largely improving performance in 
 links with different characteristics 
endef


define Build/Configure
	$(call Build/Configure/Default)
endef

define Build/Compile
	$(MAKE) -C $(PKG_BUILD_DIR) \
		DESTDIR="$(PKG_INSTALL_DIR)" \
		install
endef

define Package/pepsal/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/usr/bin/pepsal $(1)/usr/bin/
endef

$(eval $(call BuildPackage,pepsal))
