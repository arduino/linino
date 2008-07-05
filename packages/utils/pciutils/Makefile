#
# Copyright (C) 2007 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
# $Id$

include $(TOPDIR)/rules.mk

PKG_NAME:=pciutils
PKG_VERSION:=3.0.0
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.bz2
PKG_SOURCE_URL:=http://www.kernel.org/pub/software/utils/pciutils/ \
	ftp://atrey.karlin.mff.cuni.cz/pub/linux/pci
PKG_MD5SUM:=85b5dae042217cf11bca10d52210a78d

include $(INCLUDE_DIR)/package.mk

define Package/pciutils
  SECTION:=utils
  CATEGORY:=Utilities
  TITLE:=Linux PCI Utilities
  URL:=http://mj.ucw.cz/pciutils.shtml
endef

define Package/pciutils/description
	This package contains various utilities for inspecting and setting of
	devices connected to the PCI bus.
endef

define Package/pciutils/postinst
#!/bin/sh
$${IPKG_INSTROOT}/usr/sbin/update-pciids.sh
endef

MAKE_FLAGS += \
	CFLAGS="$(TARGET_CFLAGS)" \
	IDSDIR="/usr/share" \
	HOST="$(GNU_TARGET_NAME)" \
	ZLIB="no" \

define Build/InstallDev
	$(INSTALL_DIR) $(1)/usr/lib
	$(CP) $(PKG_BUILD_DIR)/lib/libpci.a $(1)/usr/lib
	$(INSTALL_DIR) $(1)/usr/include/pci
	$(CP) $(foreach i,pci.h config.h header.h types.h, \
		$(PKG_BUILD_DIR)/lib/$(i)) $(1)/usr/include/pci
endef

define Package/pciutils/install
	$(INSTALL_DIR) $(1)/usr/sbin
	$(CP) $(PKG_BUILD_DIR)/{lspci,setpci,update-pciids.sh} $(1)/usr/sbin/
	$(INSTALL_DIR) $(1)/usr/share
	$(CP) $(PKG_BUILD_DIR)/pci.ids $(1)/usr/share/
endef

$(eval $(call BuildPackage,pciutils))
