# 
# Copyright (C) 2006 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
# $Id$

include $(TOPDIR)/rules.mk

PKG_NAME:=lm-sensors
PKG_VERSION:=3.0.2
PKG_RELEASE:=1

PKG_SOURCE:=lm_sensors-$(PKG_VERSION).tar.bz2
PKG_SOURCE_URL:=http://dl.lm-sensors.org/lm-sensors/releases/
PKG_MD5SUM:=5b210ba9cc01f00161c438fd618484e5

PKG_BUILD_DIR:=$(BUILD_DIR)/lm_sensors-$(PKG_VERSION)

include $(INCLUDE_DIR)/package.mk

define Package/lm-sensors/Default
  SECTION:=utils
  CATEGORY:=Utilities
  TITLE:=lm-sensors
  DEPENDS:=+sysfsutils @LINUX_2_6
  URL:=http://www.lm-sensors.org/
endef

define Package/lm-sensors
  $(call Package/lm-sensors/Default)
  TITLE+= (programs)
  DEPENDS+= @TARGET_x86
endef

define Package/libsensors
  $(call Package/lm-sensors/Default)
  SECTION:=libs
  CATEGORY:=Libraries
  TITLE+= libraries
endef

define Package/lm-sensors/description
	Utility to read hardware sensor data
endef

define Package/libsensors/description
	lm-sensors libraries
endef

define Build/Compile
	$(MAKE) -C $(PKG_BUILD_DIR) \
		KERNELVERSION="$(LINUX_VERSION)" \
		LINUX="$(LINUX_DIR)" \
		CC="$(TARGET_CC)" \
		STAGING_DIR="$(STAGING_DIR)" \
		PREFIX="/usr" \
		MACHINE="$(ARCH)" \
		user
endef

define Package/lm-sensors/install
	$(INSTALL_DIR) $(1)/usr/sbin
	$(CP) $(PKG_BUILD_DIR)/prog/sensors/sensors $(1)/usr/sbin/
	$(CP) $(PKG_BUILD_DIR)/prog/detect/sensors-detect $(1)/usr/sbin/
	$(INSTALL_DIR) $(1)/etc
	$(CP) files/sensors.conf $(1)/etc/sensors.conf
endef

define Package/libsensors/install
	$(INSTALL_DIR) $(1)/usr/lib
	$(CP) $(PKG_BUILD_DIR)/lib/libsensors.so* $(1)/usr/lib/
endef


$(eval $(call BuildPackage,lm-sensors))
$(eval $(call BuildPackage,libsensors))
