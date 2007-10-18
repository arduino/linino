#
# Copyright (C) 2006 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
# $Id$

include $(TOPDIR)/rules.mk

PKG_NAME:=mutt
PKG_VERSION:=1.5.16
PKG_RELEASE:=2

PKG_SOURCE_URL:=@SF/mutt
PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_MD5SUM:=10eff7024dbb7ce1f773d688a69ea9db

PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)-$(PKG_VERSION)

include $(INCLUDE_DIR)/package.mk

define Package/mutt
  SECTION:=utils
  CATEGORY:=Utilities
  DEPENDS:=+libopenssl +libncurses
  TITLE:=Console mail client
  URL:=http://www.mutt.org/
  SUBMENU:=mail
endef

CONFIGURE_ARGS += \
	--includedir=$(PKG_BUILD_DIR)/. \
	--oldincludedir=$(PKG_BUILD_DIR)/. \
	--enable-pop \
	--enable-imap \
	--with-ssl

define Package/mutt/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(CP) $(PKG_BUILD_DIR)/mutt $(1)/usr/bin/
endef

$(eval $(call BuildPackage,mutt))
