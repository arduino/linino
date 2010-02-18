# 
# Copyright (C) 2006-2009 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=sysfsutils
PKG_VERSION:=2.1.0
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=@SF/linux-diag
PKG_MD5SUM:=14e7dcd0436d2f49aa403f67e1ef7ddc

PKG_INSTALL:=1

include $(INCLUDE_DIR)/package.mk

define Package/sysfsutils
  SECTION:=utils
  CATEGORY:=Utilities
  SUBMENU:=Filesystem
  DEPENDS:=@LINUX_2_6
  TITLE:=sysfs Utilities
  URL:=http://linux-diag.sourceforge.net/Sysfsutils.html
endef

define Build/InstallDev
	$(INSTALL_DIR) $(1)/usr/include
	$(CP) $(PKG_INSTALL_DIR)/usr/include/sysfs $(1)/usr/include/
	$(INSTALL_DIR) $(1)/usr/lib
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/libsysfs.{a,so*} $(1)/usr/lib/
endef

define Package/sysfsutils/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(CP) $(PKG_INSTALL_DIR)/usr/bin/systool $(1)/usr/bin/
	$(INSTALL_DIR) $(1)/usr/lib
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/libsysfs.so.* $(1)/usr/lib/
endef

$(eval $(call BuildPackage,sysfsutils))
