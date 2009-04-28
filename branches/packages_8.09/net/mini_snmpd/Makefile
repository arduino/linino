#
# Copyright (C) 2009 OpenWrt.orgv
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
# $Id$

include $(TOPDIR)/rules.mk

PKG_NAME:=mini_snmpd
PKG_VERSION:=1.0
PKG_RELEASE:=1.1

PKG_SOURCE:=mini_snmpd.tar.gz
PKG_SOURCE_URL:=http://members.aon.at/linuxfreak/linux/
PKG_MD5SUM:=13f2202ff01ff6b6463989f34f453063

PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)

include $(INCLUDE_DIR)/package.mk

define Package/mini-snmpd
  SECTION:=net
  CATEGORY:=Network
  TITLE:=SNMP server for embedded systems
  URL:=http://members.aon.at/linuxfreak/linux/mini_snmpd.html
endef


define Build/Compile
	$(MAKE) -C $(PKG_BUILD_DIR) \
		CC="$(TARGET_CC)" \
		OFLAGS="$(TARGET_CFLAGS) -DSYSLOG" \
		STRIP="/bin/true" \
		INSTALL_ROOT="$(PKG_INSTALL_DIR)" \
		mini_snmpd install
endef

define Package/mini-snmpd/install
	$(INSTALL_DIR) $(1)/sbin
	$(CP) $(PKG_INSTALL_DIR)/sbin/mini_snmpd $(1)/sbin/
endef

$(eval $(call BuildPackage,mini-snmpd))
