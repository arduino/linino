# 
# Copyright (C) 2006 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
# $Id$

include $(TOPDIR)/rules.mk

PKG_NAME:=wdiag
PKG_VERSION:=0.9
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tgz
PKG_SOURCE_URL:=@SF/wdiag
PKG_MD5SUM:=26ee93f3e2353ebb5d1df5f3e50eb4fd

PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)

include $(INCLUDE_DIR)/package.mk

define Package/wdiag
  SECTION:=net
  CATEGORY:=Network
  TITLE:=Westell DSL Modem Diagnostics for Linux
  URL:=http://sourceforge.net/projects/wdiag/
endef

define Package/wdiag/description
A collection of utilities to get DSL stats from Westell DSL modems.
endef

define Build/Compile
	$(MAKE) -C $(PKG_BUILD_DIR)/src \
		$(TARGET_CONFIGURE_OPTS) \
		CFLAGS="$(TARGET_CFLAGS)"
endef

define Package/wdiag/install
	$(INSTALL_DIR) $(1)/usr/sbin
	$(CP) $(PKG_BUILD_DIR)/src/w{start,stop,estell} $(1)/usr/sbin/
endef

$(eval $(call BuildPackage,wdiag))
