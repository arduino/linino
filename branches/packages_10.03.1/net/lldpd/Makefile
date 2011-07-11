#
# Copyright (C) 2008 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=lldpd
PKG_VERSION:=0.3
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=http://www.luffy.cx/lldpd/
PKG_MD5SUM:=317e1144ec7d2781ff123ec16845a2fc

include $(INCLUDE_DIR)/package.mk

define Package/lldpd
  SECTION:=net
  CATEGORY:=Network
  SUBMENU:=Routing and Redirection
  TITLE:=Link Layer Discovery Protocol damon
  DEPENDS:=@!LINUX_2_4
  URL:=https://trac.luffy.cx/lldpd/
endef

define Package/lldpd/description
	LLDP (Link Layer Discovery Protocol) is an industry standard protocol designed 
	to supplant proprietary Link-Layer protocols such as 
	Extreme's EDP (Extreme Discovery Protocol) and 
	CDP (Cisco Discovery Protocol). 
	The goal of LLDP is to provide an inter-vendor compatible mechanism to deliver 
	Link-Layer notifications to adjacent network devices. 
endef

CONFIGURE_ARGS += \
	--enable-cdp \
	--enable-fdp \
	--enable-edp \
	--enable-lldpmed \
	--enable-dot1 \
	--enable-dot3 \

CONFIGURE_VARS += \
	ac_cv_lib_nl_nl_connect=no

define Package/lldpd/install
	$(INSTALL_DIR) $(1)/etc/init.d
	$(INSTALL_DIR) $(1)/etc/config
	$(INSTALL_DIR) $(1)/usr/sbin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/src/lldpd $(1)/usr/sbin/
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/src/lldpctl $(1)/usr/sbin/
	$(INSTALL_BIN) ./files/lldpd.init $(1)/etc/init.d/lldpd
	$(INSTALL_DATA) ./files/lldpd.config $(1)/etc/config/lldpd
endef

$(eval $(call BuildPackage,lldpd))
