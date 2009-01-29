#
# Copyright (C) 2009 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
# $Id: Makefile 14099 2009-01-18 23:10:59Z lars $

include $(TOPDIR)/rules.mk

PKG_NAME:=freedesktop-compliant
PKG_VERSION:=1.0
PKG_RELEASE:=1

include $(INCLUDE_DIR)/package.mk

define Package/freedesktop-compliant
  SECTION:=xorg-meta
  CATEGORY:=Xorg
  SUBMENU:=meta
  TITLE:=freedesktop-compliant
endef

define Package/freedesktop-compliant/description
	This package contains a set of configuraton files based on freedesktop.org specifications which should by freedesktop.org compliant software
endef

define Build/Configure
endef

define Build/Compile
endef

define Package/freedesktop-compliant/install
	$(INSTALL_DIR) $(1)/etc
	$(CP) \
		./files/etc/* \
		$(1)/etc/
endef

$(eval $(call BuildPackage,freedesktop-compliant))
