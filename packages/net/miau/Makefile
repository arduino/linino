#
# Copyright (C) 2006 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
# $Id$

include $(TOPDIR)/rules.mk

PKG_NAME:=miau
PKG_VERSION:=0.6.4
PKG_RELEASE:=2

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.bz2
PKG_SOURCE_URL:=@SF/miau
PKG_MD5SUM:=6ee1b23fe55b46988d0714021b0ff76c
PKG_CAT:=bzcat

PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)-$(PKG_VERSION)
PKG_INSTALL_DIR:=$(PKG_BUILD_DIR)/ipkg-install

include $(INCLUDE_DIR)/package.mk

define Package/miau
  SUBMENU:=Instant Messaging
  SECTION:=net
  CATEGORY:=Network
  TITLE:=Another IRC-bouncer/proxy
  URL:=http://sourceforge.net/projects/miau/
endef

define Package/miau/description
	In short, miau is an IRC-bouncer/proxy.
	Being more verbose, miau is small but quite featured 
	IRC-bouncer - a service bit like HTTP-proxy, but 
	for IRC-networks.
endef

CONFIGURE_ARGS += \
	--enable-automode \
	--enable-releasenick \
	--enable-uptime \
	--enable-privlog \
	--enable-onconnect

MAKE_FLAGS += \
	DESTDIR="$(PKG_INSTALL_DIR)" \
	all install

define Package/miau/install	
	$(INSTALL_DIR) $(1)/usr/bin  	
	$(CP) $(PKG_INSTALL_DIR)/usr/bin/$(PKG_NAME) $(1)/usr/bin/
	$(INSTALL_DIR) $(1)/etc/init.d
	$(INSTALL_DIR) $(1)/etc/default
	$(INSTALL_DIR) $(1)/etc/miau
	$(INSTALL_BIN) ./files/miau.init $(1)/etc/init.d/miau
	$(INSTALL_DATA) ./files/miau $(1)/etc/default/miau
	$(INSTALL_DATA) ./files/miaurc $(1)/etc/miau/miaurc
endef

$(eval $(call BuildPackage,miau))
