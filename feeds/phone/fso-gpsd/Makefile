#
# Copyright (C) 2006-2008 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
# $Id: Makefile 12228 2008-08-06 22:43:15Z nbd $

include $(TOPDIR)/rules.mk

PKG_NAME:=fso-gpsd
PKG_VERSION:=20081211
PKG_REV:=78fe48dffb923175bde9f0aabc3500a9264a57e0
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.bz2
PKG_SOURCE_URL:=git://git.freesmartphone.org/fso-gpsd.git
PKG_SOURCE_PROTO:=git
PKG_SOURCE_SUBDIR:=$(PKG_NAME)-$(PKG_VERSION)
PKG_SOURCE_VERSION:=$(PKG_REV)

PKG_FIXUP = libtool

include $(INCLUDE_DIR)/package.mk
include $(INCLUDE_DIR)/nls.mk

define Package/fso-gpsd
  SECTION:=phone
  CATEGORY:=Phone
  TITLE:=FSO gps daemon
  URL:=http://freesmartphone.org
  DEPENDS:=fso-frameworkd
endef

define Build/Configure
	( cd $(PKG_BUILD_DIR); NOCONFIGURE=YES ./autogen.sh );
	$(call Build/Configure/Default)
endef

define Build/Compile
	DESTDIR="$(PKG_INSTALL_DIR)" $(MAKE) -C $(PKG_BUILD_DIR) install
endef

define Package/fso-gpsd/install
	$(INSTALL_DIR) $(1)/usr/sbin $(1)/etc/init.d
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/usr/sbin/fso-gpsd $(1)/usr/sbin/
	$(INSTALL_BIN) ./files/fso-gpsd.init $(1)/etc/init.d/fso-gpsd
endef

$(eval $(call BuildPackage,fso-gpsd))
