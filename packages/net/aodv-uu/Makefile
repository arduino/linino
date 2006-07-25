# 
# Copyright (C) 2006 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
# $Id: Makefile 4091 2006-06-27 00:35:46Z mbm $

include $(TOPDIR)/rules.mk

PKG_NAME:=aodv-uu
PKG_VERSION:=0.9.1
PKG_RELEASE:=1

PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)-$(PKG_VERSION)
PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=http://www.comnets.uni-bremen.de/~mua/
PKG_MD5SUM:=ec23502d63664231f573557ddce38a82
PKG_CAT:=zcat

PKG_INSTALL_DIR:=$(PKG_BUILD_DIR)/ipkg-install

include $(INCLUDE_DIR)/package.mk

define Package/aodv-uu
SECTION:=base
CATEGORY:=Network
TITLE:=Ad-hoc On-demand Distance Vector Routing
DESCRIPTION:=Ad-hoc On-demand Distance Vector Routing
URL:=http://core.it.uu.se/adhoc/AodvUUImpl
endef

define Build/Compile
	$(call Build/Compile/Default,CC="$(TARGET_CC)" \
KERNEL_DIR="$(LINUX_DIR)/" KCC="$(TARGET_CC)" LD="$(TARGET_CROSS)ld" \
CFLAGS="$(TARGET_CFLAGS)" aodvd)
endef

define Package/aodv-uu/install
	install -m0755 -d $(1)/usr/sbin
	install -m0755 $(PKG_BUILD_DIR)/aodvd $(1)/usr/sbin
endef

$(eval $(call BuildPackage,aodv-uu))
