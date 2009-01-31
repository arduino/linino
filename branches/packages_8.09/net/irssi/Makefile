#
# Copyright (C) 2006 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
# $Id$

include $(TOPDIR)/rules.mk

PKG_NAME:=irssi
PKG_VERSION:=0.8.10
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION)a.tar.bz2
PKG_SOURCE_URL:=http://irssi.org/files/
PKG_MD5SUM:=38e616bccb6a34ff6d91690317c2fa19

PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)-$(PKG_VERSION)

include $(INCLUDE_DIR)/package.mk

define Package/irssi
  SUBMENU:=Instant Messaging
  SECTION:=net
  CATEGORY:=Network
  DEPENDS:=+glib1 +libncurses
  TITLE:=console irc client
  URL:=http://irssi.org/
endef

define Build/Configure
	$(call Build/Configure/Default, \
		--with-perl=no \
		--with-glib1 \
		--with-glib-prefix="$(STAGING_DIR)/usr" \
		--with-textui \
		--without-terminfo \
		--without-bot \
		--without-file-offset-size \
		--without-ssl \
		--disable-ssl \
		--disable-ipv6 \
		--disable-proxy \
	)
endef

define Package/irssi/install	
	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/src/fe-text/irssi $(1)/usr/bin/
endef

$(eval $(call BuildPackage,irssi))
