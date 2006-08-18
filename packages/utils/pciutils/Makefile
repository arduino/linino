# 
# Copyright (C) 2006 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
# $Id$

include $(TOPDIR)/rules.mk

PKG_NAME:=pciutils
PKG_VERSION:=2.2.1
PKG_RELEASE:=1

PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)-$(PKG_VERSION)
PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=http://www.kernel.org/pub/software/utils/pciutils/ \
	ftp://atrey.karlin.mff.cuni.cz/pub/linux/pci
PKG_MD5SUM:=c18e2a5f04e9abae5a42439de294f086
PKG_CAT:=zcat

PKG_INSTALL_DIR:=$(PKG_BUILD_DIR)/ipkg-install

include $(INCLUDE_DIR)/package.mk

define Package/pciutils
  SECTION:=utils
  CATEGORY:=Utilities
  TITLE:=Linux PCI Utilities
  DESCRIPTION:=Linux PCI Utilities.\\\
    This package contains various utilities for inspecting and setting of \\\
    devices connected to the PCI bus.
  URL:=http://www.kernel.org/pub/software/utils/pciutils/
endef

define Build/Configure
endef

define Build/Compile
  $(call Build/Compile/Default, CFLAGS="$(TARGET_CFLAGS)" IDSDIR="/usr/share" HOST=$(GNU_TARGET_NAME))
endef

define Package/pciutils/install
	install -d -m0755 $(1)/usr/sbin
	$(CP) $(PKG_BUILD_DIR)/{lspci,setpci} $(1)/usr/sbin/
	install -d -m0755 $(1)/usr/share
	$(CP) $(PKG_BUILD_DIR)/pci.ids $(1)/usr/share/
endef

$(eval $(call BuildPackage,pciutils))
