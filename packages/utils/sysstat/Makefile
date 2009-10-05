#
# Copyright (C) 2008-2009 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=sysstat
PKG_VERSION:=9.0.5
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.bz2
PKG_SOURCE_URL:=http://pagesperso-orange.fr/sebastien.godard
PKG_MD5SUM:=

include $(INCLUDE_DIR)/package.mk

define Package/sysstat
  SECTION:=utils
  CATEGORY:=Utilities
  TITLE:=Sysstat performance monitoring tools
  URL:=http://pagesperso-orange.fr/sebastien.godard/index.html
endef

define Package/sysstat/description
  The sysstat utilities are a collection of performance monitoring tools for
  Linux. These include sar, sadf, mpstat, iostat, pidstat and sa tools.
endef

define Package/sysstat/conffiles
/etc/sysstat/sysstat.ioconf
/etc/sysstat/config
endef

CONFIGURE_ARGS+= \
	sa_lib_dir="/usr/lib/sysstat" \
	sa_dir="/var/log/sysstat" \
	conf_dir="/etc/sysstat" \

define Package/sysstat/install
	$(INSTALL_DIR) $(1)/usr/lib/sysstat
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/{sadc,sa1,sa2} $(1)/usr/lib/sysstat/
	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/{sar,sadf,iostat,mpstat,pidstat} $(1)/usr/bin/
	$(INSTALL_DIR) $(1)/etc/sysstat
	$(INSTALL_CONF) $(PKG_BUILD_DIR)/sysstat.ioconf $(1)/etc/sysstat/
	$(INSTALL_CONF) ./files/config $(1)/etc/sysstat/config
	$(INSTALL_DIR) $(1)/etc/init.d
	$(INSTALL_BIN) ./files/sysstat.init $(1)/etc/init.d/sysstat
endef

$(eval $(call BuildPackage,sysstat))
