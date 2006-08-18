#
# Copyright (C) 2006 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
# $Id$

include $(TOPDIR)/rules.mk

PKG_NAME:=miau
PKG_VERSION:=0.6.0.2
PKG_RELEASE:=1
PKG_MD5SUM:=1b78d219a03655399c165eeb021cddd8

PKG_SOURCE_URL:= @SF/miau
PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_CAT:=zcat

PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)-$(PKG_VERSION)
PKG_INSTALL_DIR:=$(PKG_BUILD_DIR)/ipkg-install

include $(INCLUDE_DIR)/package.mk

define Package/miau
  SECTION:=net
  CATEGORY:=Network
  TITLE:=Another IRC-bouncer/proxy
  DESCRIPTION:=In short, miau is an IRC-bouncer/proxy.\\\
Being more verbose, miau is small but quite featured\\\
IRC-bouncer - a service bit like HTTP-proxy, but\\\
for IRC-networks.\\\
  URL:=http://sourceforge.net/projects/miau/
endef

define Build/Configure
$(call Build/Configure/Default,--enable-automode \
--enable-releasenick \
--enable-uptime \
--enable-privlog \
--enable-onconnect,ac_cv_func_malloc_0_nonnull=yes \
ac_cv_func_realloc_0_nonnull=yes)
endef


define Build/Compile	
  $(call Build/Compile/Default,DESTDIR="$(PKG_INSTALL_DIR)" install)
endef

define Package/miau/install	
	install -d -m0755 $(1)/usr/bin  	
	$(CP) $(PKG_INSTALL_DIR)/usr/bin/$(PKG_NAME) $(1)/usr/bin/
	install -d -m0755 $(1)/etc/init.d
	install -d -m0755 $(1)/etc/default
	install -d -m0755 $(1)/etc/miau
	install -m0755 ./files/S50miau $(1)/etc/init.d/S50miau
	install -m0644 ./files/miau $(1)/etc/default/miau
	install -m0644 ./files/miaurc $(1)/etc/miau/miaurc
endef

$(eval $(call BuildPackage,miau))
