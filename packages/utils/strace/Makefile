# 
# Copyright (C) 2006 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
# $Id$

include $(TOPDIR)/rules.mk

PKG_NAME:=strace
PKG_VERSION:=4.5.11
PKG_RELEASE:=1
PKG_MD5SUM:=28335e15c83456a3db055a0a0efcb4fe

PKG_SOURCE_URL:=@SF/strace
PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.bz2
PKG_CAT:=bzcat

PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)-$(PKG_VERSION)

include $(INCLUDE_DIR)/package.mk

define Package/strace
  SECTION:=utils
  CATEGORY:=Utilities
  TITLE:=System call tracer
  DESCRIPTION:=A useful diagnostic, instructional, and debugging tool. \\\
    Allows you to track what system calls a program makes while it is \\\
    running.
  URL:=http://strace.sourceforge.net/
endef

define Build/Configure
	$(call Build/Configure/Default)
endef

define Build/Compile
	$(MAKE) -C $(PKG_BUILD_DIR) \
		CC="$(TARGET_CC)"
endef

define Package/strace/install
	install -m0755 -d $(1)/usr/sbin
	install -m0755 $(PKG_BUILD_DIR)/strace $(1)/usr/sbin/
endef

$(eval $(call BuildPackage,strace))
