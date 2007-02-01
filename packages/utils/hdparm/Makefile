# 
# Copyright (C) 2006 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
# $Id$

include $(TOPDIR)/rules.mk

PKG_NAME:=hdparm
PKG_VERSION:=6.6
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=@SF/hdparm
PKG_MD5SUM:=ecea69f775396e4ab6112dcf9066239f
PKG_CAT:=zcat

PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)-$(PKG_VERSION)

include $(INCLUDE_DIR)/package.mk

define Package/hdparm
  SECTION:=utils
  CATEGORY:=Utilities
  TITLE:=Hard disk drive configuration utilitity
  DESCRIPTION:=\
	Tune hard disk parameters for high performance.\\\
	Get/set hard disk parameters for Linux IDE drives.\\\
	Primary use is for enabling irq-unmasking and IDE multiplemode.
  URL:=http://sourceforge.net/projects/hdparm/
endef

define Build/Configure
endef

define Build/Compile
	$(call Build/Compile/Default, \
		CFLAGS="$(EXTRA_CFLAGS)" \
		LDFLAGS="$(EXTRA_LDFLAGS)" \
	)
endef

define Package/hdparm/install
	$(INSTALL_DIR) $(1)/usr/sbin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/hdparm $(1)/usr/sbin
endef

$(eval $(call BuildPackage,hdparm))
