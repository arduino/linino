#
# Copyright (C) 2011 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=libevent2
PKG_VERSION:=2.0.10
PKG_RELEASE:=1

PKG_BUILD_DIR:=$(BUILD_DIR)/libevent-$(PKG_VERSION)-stable
PKG_SOURCE:=libevent-$(PKG_VERSION)-stable.tar.gz
PKG_SOURCE_URL:=http://www.monkey.org/~provos/
PKG_MD5SUM:=a37401d26cbbf28185211d582741a3d4

PKG_FIXUP:=libtool
PKG_INSTALL:=1
PKG_BUILD_PARALLEL:=1

include $(INCLUDE_DIR)/package.mk

define Package/libevent2
  SECTION:=libs
  CATEGORY:=Libraries
  TITLE:=Event notification library (version 2.0)
  URL:=http://www.monkey.org/~provos/libevent/
endef

define Package/libevent2/description
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
	--enable-static

MAKE_FLAGS += \
	CFLAGS="$(TARGET_CFLAGS)"

define Build/InstallDev
	$(INSTALL_DIR) $(1)/usr/include
	$(CP) $(PKG_INSTALL_DIR)/usr/include/* $(1)/usr/include/
	$(INSTALL_DIR) $(1)/usr/lib
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/libevent.{la,a,so} $(1)/usr/lib/
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/libevent-2.0.so* $(1)/usr/lib/
	$(INSTALL_DIR) $(1)/usr/lib/pkgconfig
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/pkgconfig/libevent.pc $(1)/usr/lib/pkgconfig
endef

define Package/libevent2/install
	$(INSTALL_DIR) $(1)/usr/lib
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/libevent-2.0.so.* $(1)/usr/lib/
endef

$(eval $(call BuildPackage,libevent2))
