# 
# Copyright (C) 2006 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
# $Id$

include $(TOPDIR)/rules.mk

PKG_NAME:=p910nd
PKG_VERSION:=0.7
PKG_RELEASE:=2

PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)-$(PKG_VERSION)
PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.bz2
PKG_SOURCE_URL:=http://www.etherboot.org/p910nd
PKG_MD5SUM:=7bf752532d26c9106f8039db95df3a6b
PKG_CAT:=bzcat

PKG_INIT_PRIO=70

include $(INCLUDE_DIR)/package.mk

define Package/p910nd
  SECTION:=net
  CATEGORY:=Network
  TITLE:=A small non-spooling printer server
  DESCRIPTION:=A small non-spooling printer server.\\\
    p910nd  is a small daemon that copies any data received on \\\
    the port it is listening on to the  corresponding  printer \\\
    port.   It  is primarily intended for diskless Linux hosts \\\
    running as printer drivers but there is no reason  why  it \\\
    could  not  be used on diskful hosts.  Port 9100 is copied \\\
    to /dev/lp0, 9101 to /dev/lp1 and 9102 to  /dev/lp2.   The \\\
    default is port 9100 to /dev/lp0.
  URL:=http://www.etherboot.org/p910nd/
endef

define Package/p910nd/conffiles
/etc/default/p910nd
endef

define Build/Configure
endef

define Build/Compile
	$(MAKE) -C $(PKG_BUILD_DIR) \
		$(TARGET_CONFIGURE_OPTS) \
		CFLAGS="$(TARGET_CFLAGS) -DLOCKFILE_DIR=\"\\\"/tmp\\\"\""
endef

define Package/p910nd/install
	install -d -m0755 $(1)/etc/default
	install -m0644 ./files/p910nd.default $(1)/etc/default/p910nd
	install -d -m0755 $(1)/etc/init.d
	install -m0755 ./files/p910nd.init $(1)/etc/init.d/p910nd
	install -d -m0755 $(1)/usr/sbin
	ln -sf p910nd $(1)/etc/init.d/S$(PKG_INIT_PRIO)p910nd
	install -m0755 $(PKG_BUILD_DIR)/p910nd $(1)/usr/sbin/
endef

$(eval $(call BuildPackage,p910nd))
