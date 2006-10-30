# 
# Copyright (C) 2006 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
# $Id$

include $(TOPDIR)/rules.mk

PKG_NAME:=oidentd
PKG_VERSION:=2.0.8
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=@SF/ojnk
PKG_MD5SUM:=c3d9a56255819ef8904b867284386911
PKG_CAT:=zcat

PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)-$(PKG_VERSION)

include $(INCLUDE_DIR)/package.mk

define Package/oidentd
  SECTION:=net
  CATEGORY:=Network
  TITLE:=Identd server 
  DESCRIPTION:=\
	A nat aware identd server that will correctly forwared requests to clients.
  URL:=http://dev.ojnk.net/
endef

# uses GNU configure

define Build/Compile
	$(call Build/Compile/Default,all)
endef

define Package/oidentd/install
	install -d -m0755 $(1)/usr/sbin
	$(CP) $(PKG_BUILD_DIR)/src/$(PKG_NAME) $(1)/usr/sbin/
	install -d -m0755 $(1)/etc/init.d
	$(CP) ./files/oidentd.init $(1)/etc/init.d/oidentd
endef

$(eval $(call BuildPackage,oidentd))
