# 
# Copyright (C) 2006 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
# $Id$

include $(TOPDIR)/rules.mk

PKG_NAME:=devio
PKG_VERSION:=1.2
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=@SF/devio
PKG_MD5SUM:=

PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)-$(PKG_VERSION)

include $(INCLUDE_DIR)/package.mk

define Package/devio
  SECTION:=utils
  CATEGORY:=Utilities
  TITLE:=Correctly write to and read from mtd character (and other block) devices
  DESCRIPTION:=\
	A command line program to correctly read (or write) a region of a block device.\\\
	Primary use is for extracting formatted data from MTD partitions.
  URL:=http://sourceforge.net/projects/devio/
endef

define Build/Configure
	(cd $(PKG_BUILD_DIR) ; \
		./configure \
	);
endef

define Build/Compile
	$(call Build/Compile/Default, \
		CFLAGS="$(EXTRA_CFLAGS)" \
		LDFLAGS="$(EXTRA_LDFLAGS)" \
	)
endef

define Package/devio/install
	$(INSTALL_DIR) $(1)/usr/sbin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/src/devio $(1)/usr/sbin
endef

$(eval $(call BuildPackage,devio))
