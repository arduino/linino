#
# Copyright (C) 2006 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
# $Id$

include $(TOPDIR)/rules.mk

PKG_NAME:=mutt
PKG_VERSION:=1.5.11
PKG_RELEASE:=1

PKG_SOURCE_URL:=@SF/mutt
PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_MD5SUM:=00e6f8f7c37d4840e5e30583ebee21ce
PKG_CAT:=zcat

PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)-$(PKG_VERSION)

include $(INCLUDE_DIR)/package.mk

define Package/mutt
  SECTION:=utils
  CATEGORY:=Utilities
  DEPENDS:=+libopenssl +libncurses
  TITLE:=Console mail client
  URL:=http://www.mutt.org/
endef

define Build/Configure
	$(call Build/Configure/Default, \
		--includedir=$(PKG_BUILD_DIR)/. \
		--oldincludedir=$(PKG_BUILD_DIR)/. \
		--enable-pop \
		--enable-imap \
		--with-ssl \
	)
endef

define Build/Compile
	$(MAKE) -C $(PKG_BUILD_DIR)
endef

define Package/mutt/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(CP) $(PKG_BUILD_DIR)/mutt $(1)/usr/bin/
endef

$(eval $(call BuildPackage,mutt))
