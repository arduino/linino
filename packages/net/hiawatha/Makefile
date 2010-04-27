#
# Copyright (C) 2006-2010 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=hiawatha
PKG_VERSION:=7.2
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=http://www.hiawatha-webserver.org/files/
PKG_MD5SUM:=192a9fecea71cc4655dd68e2446919c7

PKG_INSTALL:=1

include $(INCLUDE_DIR)/package.mk

define Package/hiawatha
  CATEGORY:=Network
  SECTION:=net
  SUBMENU:=Web
  TITLE:=A very lightweight web server
  URL:=http://www.hiawatha-webserver.org/
  MAINTAINER:=Raphaël HUCK <rhk@cksum.org>
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
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/usr/sbin/hiawatha $(1)/usr/sbin/

	$(INSTALL_DIR) $(1)/etc/hiawatha
	$(INSTALL_CONF) $(PKG_INSTALL_DIR)/etc/hiawatha/{hiawatha,mimetype}.conf $(1)/etc/hiawatha/
endef

$(eval $(call BuildPackage,hiawatha))
