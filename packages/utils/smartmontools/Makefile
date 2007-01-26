# 
# Copyright (C) 2006 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
# $Id: $

include $(TOPDIR)/rules.mk

PKG_NAME:=smartmontools
PKG_VERSION:=5.37
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=@SF/smartmontools
PKG_MD5SUM:=4ab3668b7d1362ce923f64a211e0e568
PKG_CAT:=zcat

PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)-$(PKG_VERSION)

include $(INCLUDE_DIR)/package.mk

define Package/smartmontools
  SECTION:=utils
  CATEGORY:=Utilities
  TITLE:=S.M.A.R.T Monitoring Tool
  DESCRIPTION:=\
	smartmontools contains utility programs (smartctl, smartd) to \\\
	control/monitor storage systems using the Self-Monitoring, Analysis \\\
	and Reporting Technology System (S.M.A.R.T.) built into most modern \\\
	ATA and SCSI disks. It is derived from smartsuite.
  URL:=http://smartmontools.sourceforge.net/
endef

# uses GNU configure

define Build/Configure	
	(cd $(PKG_BUILD_DIR); ./autogen.sh );
	$(call Build/Configure/Default,, \
	ac_libc_have_working_snprintf=yes \
	)
endef

define Build/Compile
	$(MAKE) -C $(PKG_BUILD_DIR) \
		CC="$(TARGET_CC)"
endef

define Package/smartmontools/install
	$(INSTALL_DIR) $(1)/usr/sbin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/smartctl $(1)/usr/sbin/
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/smartd $(1)/usr/sbin/
	$(INSTALL_DIR) $(1)/etc
	$(INSTALL_DATA) ./files/smartd.conf $(1)/etc
	$(INSTALL_DIR) $(1)/etc/init.d
	$(INSTALL_DATA) ./files/smartd.init $(1)/etc/init.d/smartd
endef

$(eval $(call BuildPackage,smartmontools))
