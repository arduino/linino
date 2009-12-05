#
# Copyright (C) 2008 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=ngircd
PKG_VERSION:=15
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=ftp://ngircd.barton.de/pub/ngircd/
PKG_MD5SUM:=c183a85eba6fe51255983848f099c8ae

include $(INCLUDE_DIR)/package.mk

define Package/ngircd
  SECTION:=net
  CATEGORY:=Network
  DEPENDS:=+zlib
  TITLE:=Next Generation IRC Server
  URL:=http://ngircd.barton.de
endef

define Package/ngircd/description
  ngIRCd is an Open Source server for the Internet Relay Chat (IRC), which
  is developed and published under the terms of the GNU General Public Licence.
  ngIRCd means "next generation IRC daemon", it's written from scratch and
  not deduced from the "grandfather of IRC daemons", the daemon of the IRCNet.
endef

define Package/ngircd/conffiles
/etc/ngircd.conf
endef

define Build/Configure
	$(call Build/Configure/Default)
endef

define Build/Compile
	$(MAKE) -C $(PKG_BUILD_DIR) \
		DESTDIR="$(PKG_INSTALL_DIR)" \
		all install
endef

define Package/ngircd/install
	$(INSTALL_DIR) $(1)/usr/sbin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/usr/sbin/ngircd $(1)/usr/sbin/
	$(INSTALL_DIR) $(1)/etc
	$(INSTALL_CONF) $(PKG_INSTALL_DIR)/etc/ngircd.conf $(1)/etc/
endef

$(eval $(call BuildPackage,ngircd))
