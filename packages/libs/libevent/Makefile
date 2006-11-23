# 
# Copyright (C) 2006 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
# $Id$

include $(TOPDIR)/rules.mk

PKG_NAME:=libevent
PKG_VERSION:=1.1
PKG_RELEASE:=1

PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)-$(PKG_VERSION)
PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=http://www.monkey.org/~provos/
PKG_MD5SUM:=a5bd281aeb41bdaa48fbbf0495423d20
PKG_CAT:=zcat

PKG_INSTALL_DIR:=$(PKG_BUILD_DIR)/ipkg-install

include $(INCLUDE_DIR)/package.mk

define Package/libevent
  SECTION:=libs
  CATEGORY:=Libraries
  TITLE:=Event notification library
  DESCRIPTION:=\
	The libevent API provides a mechanism to execute a callback function \\\
	when a specific event occurs on a file descriptor or after a timeout \\\
	has been reached. Furthermore, libevent also support callbacks due \\\
	to signals or regular timeouts.\\\
	\\\
	libevent is meant to replace the event loop found in event driven \\\
	network servers. An application just needs to call event_dispatch() \\\
	and then add or remove events dynamically without having to change \\\
	the event loop.
  URL:=http://www.monkey.org/~provos/libevent/
endef

define Build/Configure
	$(call Build/Configure/Default, \
		--enable-shared \
		--enable-static \
	)
endef

define Build/Compile
	$(MAKE) -C $(PKG_BUILD_DIR) \
		DESTDIR="$(PKG_INSTALL_DIR)" \
		all install
endef

define Build/InstallDev
	mkdir -p $(STAGING_DIR)/usr/include
	$(CP) $(PKG_INSTALL_DIR)/usr/include/event.h $(STAGING_DIR)/usr/include/
	mkdir -p $(STAGING_DIR)/usr/lib
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/libevent.{a,so} $(STAGING_DIR)/usr/lib/
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/libevent-$(PKG_VERSION).so* $(STAGING_DIR)/usr/lib/
endef

define Build/UninstallDev
	rm -rf \
		$(STAGING_DIR)/usr/include/event.h \
		$(STAGING_DIR)/usr/lib/libevent.{a,so} \
		$(STAGING_DIR)/usr/lib/libevent-$(PKG_VERSION).so*
endef

define Package/libevent/install
	$(INSTALL_DIR) $(1)/usr/lib
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/libevent-$(PKG_VERSION).so.* $(1)/usr/lib/
endef

$(eval $(call BuildPackage,libevent))
