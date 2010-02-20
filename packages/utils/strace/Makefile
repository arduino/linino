#
# Copyright (C) 2006-2010 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk
include $(INCLUDE_DIR)/kernel.mk

PKG_NAME:=strace
PKG_RELEASE:=3

ifeq ($(CONFIG_LINUX_2_6_25),y)
  PKG_VERSION:=4.5.16
  PKG_MD5SUM:=77f66d09aa82981bb6d65fa19a2c1ba9
  PATCH_DIR:=patches-4.5.16
else
  PKG_VERSION:=4.5.19
  PKG_MD5SUM:=2415e435d61e40315a298c80aced0cda
endif

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.bz2
PKG_SOURCE_URL:=@SF/$(PKG_NAME)

PKG_FIXUP:=libtool
PKG_INSTALL:=1

include $(INCLUDE_DIR)/package.mk

define Package/strace
  SECTION:=utils
  CATEGORY:=Utilities
  TITLE:=System call tracer
  URL:=http://strace.sourceforge.net/
endef

define Package/strace/description
A useful diagnostic, instructional, and debugging tool. Allows you to track what
system calls a program makes while it is running.
endef

# needed when compiling against Linux 2.4
CONFIGURE_VARS += \
	ac_cv_header_linux_netlink_h=yes

# needed when compiling with an external toolchain
TARGET_CFLAGS += \
	-I$(LINUX_DIR)/include

MAKE_FLAGS := \
	CCOPT="$(TARGET_CFLAGS)"

define Package/strace/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/usr/bin/strace $(1)/usr/bin/
endef

$(eval $(call BuildPackage,strace))
