#
# Copyright (C) 2008 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
# $Id: $

include $(TOPDIR)/rules.mk

PKG_NAME:=sysstat
PKG_VERSION:=8.0.1
PKG_RELEASE:=2

PKG_SOURCE:=sysstat-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=http://perso.orange.fr/sebastien.godard
PKG_MD5SUM:=10369aeb42290f0141e685d33cdac658

include $(INCLUDE_DIR)/package.mk

define Package/sysstat
  SECTION:=utils
  CATEGORY:=Utilities
  TITLE:=Sysstat performance monitoring tools
  URL:=http://perso.orange.fr/sebastien.godard/index.html
endef

define Package/sysstat/description
  The sysstat utilities are a collection of performance monitoring tools for Linux. These include sar, sadf, mpstat, iostat, pidstat and sa tools.
endef

define Package/sysstat/conffiles
/etc/sysstat/sysstat.ioconf
/etc/sysstat/config
endef

define Build/Configure
	$(call Build/Configure/Default, \
		sa_lib_dir="/usr/lib/sysstat" \
		sa_dir="/var/log/sysstat" \
		conf_dir="/etc/sysstat" \
	)
endef

define Package/sysstat/install
	$(INSTALL_DIR) $(1)/usr/lib/sysstat
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/{sadc,sa1,sa2} $(1)/usr/lib/sysstat
	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/{sar,sadf,iostat,mpstat} $(1)/usr/bin
	$(INSTALL_DIR) $(1)/etc/sysstat
	$(CP) $(PKG_BUILD_DIR)/sysstat.ioconf $(1)/etc/sysstat
	$(CP) ./files/config $(1)/etc/sysstat/config
	$(INSTALL_DIR) $(1)/etc/init.d
	$(INSTALL_BIN) ./files/sysstat.init $(1)/etc/init.d/sysstat
endef

$(eval $(call BuildPackage,sysstat))
