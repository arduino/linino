#
# Copyright (C) 2006-2010 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=hiawatha
PKG_VERSION:=7.0
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=http://www.hiawatha-webserver.org/files/
PKG_MD5SUM:=1e48a61d67e03ff6f03b92778050d04e

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
	--disable-monitor \
	--disable-ssl \
	--disable-xslt

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
