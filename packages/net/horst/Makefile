#
# Copyright (C) 2006 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
# $Id: Makefile 2007-10-31 23:30:20Z tetzlav $

include $(TOPDIR)/rules.mk

PKG_NAME:=horst
PKG_VERSION:=1.3pre
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tgz
PKG_SOURCE_URL:=http://br1.einfach.org/horst/
PKG_MD5SUM:=ceb1c8847be8e11db39df2fa74ac28f7
PKG_CAT:=zcat

PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)-$(PKG_VERSION)/horst.git

include $(INCLUDE_DIR)/package.mk

define Package/horst
	SECTION:=net
	CATEGORY:=Network
	DEPENDS:=+libncurses
	MAINTAINER:=Bruno Randolf <br1@einfach.org>
	TITLE:=Provides highly optimized radio scanning
	URL:=http://br1.einfach.org/horst/
endef

define Package/horst/description
	Provides highly optimized radio scanning.
endef

define Package/horst/install      
	$(INSTALL_DIR) $(1)/usr/sbin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/horst $(1)/usr/sbin/
endef


$(eval $(call BuildPackage,horst))
