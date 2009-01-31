# 
# Copyright (C) 2006 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
# $Id$

include $(TOPDIR)/rules.mk

PKG_NAME:=libevent
PKG_VERSION:=1.4.4
PKG_RELEASE:=1

PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)-$(PKG_VERSION)-stable
PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION)-stable.tar.gz
PKG_SOURCE_URL:=http://www.monkey.org/~provos/
PKG_MD5SUM:=5d7591aa6301f06315b52bade472bf2f

include $(INCLUDE_DIR)/package.mk

define Package/libevent
  SECTION:=libs
  CATEGORY:=Libraries
  TITLE:=Event notification library
  URL:=http://www.monkey.org/~provos/libevent/
endef

define Package/libevent/description
	The libevent API provides a mechanism to execute a callback function 
	when a specific event occurs on a file descriptor or after a timeout 
	has been reached. Furthermore, libevent also support callbacks due 
	to signals or regular timeouts.
	
	libevent is meant to replace the event loop found in event driven 
	network servers. An application just needs to call event_dispatch() 
	and then add or remove events dynamically without having to change 
	the event loop.
endef

TARGET_CFLAGS += $(FPIC)

CONFIGURE_ARGS += \
	--enable-shared \
	--enable-static \

MAKE_FLAGS += \
	CFLAGS="$(TARGET_CFLAGS)" \
	DESTDIR="$(PKG_INSTALL_DIR)" \
	all install

define Build/InstallDev
	mkdir -p $(1)/usr/include
	$(CP) $(PKG_INSTALL_DIR)/usr/include/* $(1)/usr/include/
	mkdir -p $(1)/usr/lib
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/libevent.{a,so} $(1)/usr/lib/
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/libevent-1.4.so* $(1)/usr/lib/
endef

define Package/libevent/install
	$(INSTALL_DIR) $(1)/usr/lib
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/libevent-1.4.so.* $(1)/usr/lib/
endef

$(eval $(call BuildPackage,libevent))
