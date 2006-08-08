#
# Copyright (C) 2006 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
# $Id$

include $(TOPDIR)/rules.mk

PKG_NAME:=shat
PKG_VERSION:=0.9.7
PKG_RELEASE:=1
PKG_MD5SUM:= da06846f35838b14d1513523dad84d24

PKG_SOURCE_URL:=http://world.maxina.de/src/
PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_CAT:=zcat

PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)-$(PKG_VERSION)
PKG_INSTALL_DIR:=$(PKG_BUILD_DIR)/ipkg-install

include $(INCLUDE_DIR)/package.mk

define Package/shat
  SECTION:=net
  CATEGORY:=Network
  TITLE:=Source Hardware Address Translation
  DESCRIPTION:=A tool which allows hosts with arbitrary IP configuration\\\
	to connect to the internet over a SHAT gateway.\\\
  URL:=http://www.teddy-net.com/cvs/Maxina/128gw/service/arpcatch/shat/
endef

define Build/Compile	
	$(MAKE) -C $(PKG_BUILD_DIR)/src \
		CC=$(TARGET_CC) LD=$(TARGET_CROSS)ld \
		CFLAGS="$(TARGET_CFLAGS) -Wall -I$(PKG_BUILD_DIR)/include/linux/include -I$(PKG_BUILD_DIR)/include -DVERSION=\\\"$(PKG_VERSION)\\\" -DDROP_NETBIOS"
endef

define Package/shat/install
	install -d -m0755 $(1)/usr/sbin
	install -m0755 $(PKG_BUILD_DIR)/src/shatd $(1)/usr/sbin/
	install -m0755 $(PKG_BUILD_DIR)/src/shatc $(1)/usr/sbin/
endef

$(eval $(call BuildPackage,shat))
