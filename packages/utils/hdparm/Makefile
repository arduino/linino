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

PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)-$(PKG_VERSION)
PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=@SF/hdparm
PKG_MD5SUM:=ecea69f775396e4ab6112dcf9066239f
PKG_CAT:=zcat

PKG_INSTALL_DIR:=$(PKG_BUILD_DIR)/ipkg-install

include $(INCLUDE_DIR)/package.mk

define Package/hdparm
  SECTION:=utils
  CATEGORY:=Utilities
  TITLE:=Hard disk drive configuration utilitity
  DESCRIPTION:=Hard disk drive configuration utilitity.\\\
    Tune hard disk parameters for high performance.\\\
    Get/set hard disk parameters for Linux IDE drives.\\\
    Primary use is for enabling irq-unmasking and IDE multiplemode.
  URL:=http://sourceforge.net/projects/hdparm/
endef

define Build/Configure
endef

define Build/Compile
	$(MAKE) -C $(PKG_BUILD_DIR) \
		CC=$(TARGET_CC)
endef

define Package/hdparm/install
	install -d -m0755 $(1)/usr/sbin
	install -m0755 $(PKG_BUILD_DIR)/hdparm $(1)/usr/sbin
endef

$(eval $(call BuildPackage,hdparm))
