# 
# Copyright (C) 2006 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
# $Id$

include $(TOPDIR)/rules.mk

PKG_NAME:=sysfsutils
PKG_VERSION:=2.1.0
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=@SF/linux-diag
PKG_MD5SUM:=14e7dcd0436d2f49aa403f67e1ef7ddc

PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)-$(PKG_VERSION)

include $(INCLUDE_DIR)/package.mk

define Package/sysfsutils
  SECTION:=utils
  CATEGORY:=Utilities
  DEPENDS:=@LINUX_2_6
  TITLE:=sysfs Utilities
  URL:=http://linux-diag.sourceforge.net/Sysfsutils.html
endef

define Build/Configure
	$(call Build/Configure/Default)
endef

define Build/Compile
	$(MAKE) -C "$(PKG_BUILD_DIR)" \
		$(TARGET_CONFIGURE_OPTS) \
		CFLAGS="$(TARGET_CFLAGS)" \
		all
endef

define Build/InstallDev
	mkdir -p $(1)/usr/include/sysfs
	$(CP) $(PKG_BUILD_DIR)/include/*.h $(1)/usr/include/sysfs
	mkdir -p $(1)/usr/lib
	$(CP) $(PKG_BUILD_DIR)/lib/.libs/libsysfs.{a,so*} $(1)/usr/lib/
endef

define Package/sysfsutils/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(CP) $(PKG_BUILD_DIR)/cmd/systool $(1)/usr/bin/
	$(INSTALL_DIR) $(1)/usr/lib
	$(CP) $(PKG_BUILD_DIR)/lib/.libs/libsysfs.so.* $(1)/usr/lib/
endef

$(eval $(call BuildPackage,sysfsutils))
