# Copyright (C) 2006 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
# $Id: Makefile 4603 2006-08-18 21:21:06Z mbm $

include $(TOPDIR)/rules.mk

PKG_NAME:=bing
PKG_VERSION:=1.3.5
PKG_RELEASE:=0

PKG_SOURCE:=$(PKG_NAME)_src-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=http://fgouget.free.fr/bing/
PKG_MD5SUM:=60aaee55277672d0cc163bf3f0b3d53f
PKG_CAT:=zcat

PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)-$(PKG_VERSION)
PKG_INSTALL_DIR:=$(PKG_BUILD_DIR)/ipkg-install

include $(INCLUDE_DIR)/package.mk

define Package/bing
  SECTION:=net
  CATEGORY:=Network
  TITLE:=bing bandwidth measuring utility
  DESCRIPTION:=\
  	bing evaluates the raw bandwidth of a link (PSTN, xDSL, Cable ...)
  URL:=http://fgouget.free.fr/bing/
endef

define Build/Compile
$(call Build/Compile/Default)
endef

define Package/bing/install
	install -d -m0755 $(1)/usr/sbin
	$(CP) $(PKG_BUILD_DIR)/bing $(1)/usr/sbin/
endef

$(eval $(call BuildPackage,bing))
