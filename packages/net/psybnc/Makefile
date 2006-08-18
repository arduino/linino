#
# Copyright (C) 2006 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
# $Id$

include $(TOPDIR)/rules.mk

PKG_NAME:=psybnc
PKG_VERSION:=2.3.2-7
PKG_RELEASE:=1
PKG_MD5SUM:=4b893a92f914813450e0921b2894ad6c

PKG_SOURCE_URL:=http://www.psybnc.info/download/beta/
PKG_SOURCE:=psyBNC-$(PKG_VERSION).tar.gz
PKG_CAT:=zcat

PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)

include $(INCLUDE_DIR)/package.mk

define Package/psybnc
  SECTION:=net
  CATEGORY:=Network
  DEPENDS:=
  TITLE:=An IRC-Bouncer with many features
  DESCRIPTION:=psyBNC is an easy-to-use, multi-user, permanent\\\
	IRC-Bouncer with many features. Some of its features\\\
	vhost- and relay support to connected bouncers and an\\\
	extensive online help system. Many other helpful\\\
	functions are included.\\\
  URL:=http://www.psybnc.info/
endef

define Build/Compile	
  $(call Build/Compile/Default, \
	CFLAGS="$(TARGET_CFLAGS)" \
	HOSTCC="$(HOSTCC)" \
	all \
  )
endef

define Package/psybnc/install	
	install -d -m0755 $(1)/usr/share/psybnc/lang/
	install -d -m0755 $(1)/usr/share/psybnc/log/
	install -d -m0755 $(1)/usr/sbin/
	install -m0755 $(PKG_BUILD_DIR)/psybnc $(1)/usr/share/psybnc/
	install -m0600 $(PKG_BUILD_DIR)/psybnc.conf $(1)/usr/share/psybnc/
	install -m0644 $(PKG_BUILD_DIR)/lang/english.lng $(1)/usr/share/psybnc/lang/
	install -m0755 $(PKG_BUILD_DIR)/psybnc.sh $(1)/usr/sbin/psybnc
endef

$(eval $(call BuildPackage,psybnc))
