# 
# Copyright (C) 2006 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
# $Id$

include $(TOPDIR)/rules.mk

PKG_NAME:=lm-sensors
PKG_VERSION:=2.10.3
PKG_RELEASE:=1

PKG_SOURCE:=lm_sensors-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=http://dl.lm-sensors.org/lm-sensors/releases/
PKG_MD5SUM:=55d77146fbd56c205a9f81d262b9453c
PKG_CAT:=zcat

PKG_BUILD_DIR:=$(BUILD_DIR)/lm_sensors-$(PKG_VERSION)

include $(INCLUDE_DIR)/package.mk

define Package/lm-sensors
  SECTION:=utils
  CATEGORY:=Utilities
  TITLE:=lm-sensors
  DEPENDS:=+sysfsutils @LINUX_2_6_X86
  DESCRIPTION:=\
	Utility to read hardware sensor data
  URL:=http://www.lm-sensors.org/
endef

define Build/Compile
	$(MAKE) -C $(PKG_BUILD_DIR) \
		KERNELVERSION="$(LINUX_VERSION)" \
		LINUX="$(LINUX_DIR)" \
		CC="$(TARGET_CC)" \
		STAGING_DIR="$(STAGING_DIR)" \
		user
endef

define Package/lm-sensors/install
	$(INSTALL_DIR) $(1)/usr/lib
	$(CP) $(PKG_BUILD_DIR)/lib/libsensors.so* $(1)/usr/lib/
	$(INSTALL_DIR) $(1)/usr/sbin
	$(CP) $(PKG_BUILD_DIR)/prog/sensors/sensors $(1)/usr/sbin/
	$(CP) $(PKG_BUILD_DIR)/prog/detect/i2cdetect $(1)/usr/sbin/
	$(CP) $(PKG_BUILD_DIR)/prog/detect/sensors-detect $(1)/usr/sbin/
	$(INSTALL_DIR) $(1)/etc
	$(CP) files/sensors.conf $(1)/etc/sensors.conf
endef

$(eval $(call BuildPackage,lm-sensors))
