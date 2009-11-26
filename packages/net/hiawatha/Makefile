#
# Copyright (C) 2009 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=hiawatha
PKG_VERSION:=6.18
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=http://www.hiawatha-webserver.org/files/
PKG_MD5SUM:=cd923b80db84c6e9f356dad3343ba3f5

include $(INCLUDE_DIR)/package.mk

define Package/hiawatha
  CATEGORY:=Network
  SECTION:=net
  SUBMENU:=Web
  TITLE:=A very lightweight web server
  URL:=http://www.hiawatha-webserver.org/
  DEPENDS:=+libpthread
endef

define Package/hiawatha/description
  Hiawatha is a webserver for Unix.
endef

CONFIGURE_ARGS+= \
	--disable-cache \
	--disable-ssl

CONFIGURE_VARS+= \
	ac_cv_file__dev_urandom=yes \
	webrootdir=/www

define Package/hiawatha/conffiles
/etc/hiawatha/hiawatha.conf
/etc/hiawatha/mimetype.conf
endef

define Package/hiawatha/install
	$(INSTALL_DIR) $(1)/usr/sbin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/hiawatha $(1)/usr/sbin/
	$(INSTALL_DIR) $(1)/etc/hiawatha
	$(INSTALL_CONF) $(PKG_BUILD_DIR)/etc/hiawatha/{hiawatha,mimetype}.conf $(1)/etc/hiawatha/
endef

$(eval $(call BuildPackage,hiawatha))
