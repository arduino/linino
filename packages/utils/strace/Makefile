#
# Copyright (C) 2007 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
# $Id$

include $(TOPDIR)/rules.mk

PKG_NAME:=strace
PKG_RELEASE:=2

OLD_KERNEL=$(findstring y,$(foreach v,23 24 25 26,$(CONFIG_LINUX_2_6_$(v))))
ifneq ($(OLD_KERNEL),)
  PKG_VERSION:=4.5.16
  PKG_MD5SUM:=77f66d09aa82981bb6d65fa19a2c1ba9
  PATCH_DIR:=patches-4.5.16
else
  PKG_VERSION:=4.5.18
  PKG_MD5SUM:=e9449fcee97e6a8ed73934c883c870e0
endif

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.bz2
PKG_SOURCE_URL:=@SF/$(PKG_NAME)

PKG_FIXUP = libtool

include $(INCLUDE_DIR)/package.mk

define Package/strace
  SECTION:=utils
  CATEGORY:=Utilities
  TITLE:=System call tracer
  URL:=http://strace.sourceforge.net/
endef

define Package/strace/description
	A useful diagnostic, instructional, and debugging tool.
	Allows you to track what system calls a program makes while it is
	running.
endef

define Build/Compile
	$(MAKE) -C $(PKG_BUILD_DIR) \
		CC="$(TARGET_CC)"
endef

define Package/strace/install
	$(INSTALL_DIR) $(1)/usr/sbin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/$(PKG_NAME) $(1)/usr/sbin/
endef

$(eval $(call BuildPackage,strace))
