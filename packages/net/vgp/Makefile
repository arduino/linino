#
# Copyright (C) 2006 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
# $Id$

include $(TOPDIR)/rules.mk

PKG_NAME:=vgp
PKG_VERSION:=0.2.1
PKG_RELEASE:=1
PKG_MD5SUM:=b8c25b5dfcb944f78bbc584be9c230c7
PKG_SOURCE_URL:=http://vgpd.freaknet.org/files/
PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)-$(PKG_VERSION)
PKG_CAT:=zcat

PKG_INSTALL_DIR:=$(PKG_BUILD_DIR)/ipkg-install

include $(INCLUDE_DIR)/package.mk

define Package/vgp
  SECTION:=net
  CATEGORY:=Network
  TITLE:=a daemon working like Cisco(c) HSRP
  DESCRIPTION:=VGP (Virtual Gateway Protocol)is a very simple protocol able to\\\
  work in a way similar to Cisco(c) HSRP. It implements the idea\\\
  of Virtual Gateway to provide fault tollerance (and load\\\
  balancing) on your net. Each client on your net has as its\\\
  default gateway the virtual gateway and not the real router.\\\
  URL:=http://vgpd.freaknet.org/
endef

define Build/Configure
$(call Build/Configure/Default)
endef

define Build/Compile
$(call Build/Compile/Default,DESTDIR=$(PKG_INSTALL_DIR) install)
endef

define Package/vgp/install
	mkdir -p $(1)
	$(CP) $(PKG_INSTALL_DIR)/* $(1)/
endef

$(eval $(call BuildPackage,vgp))
