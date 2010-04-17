#
# Copyright (C) 2009-2010 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=mini_snmpd
PKG_VERSION:=1.0
PKG_RELEASE:=7

PKG_SOURCE:=mini_snmpd.tar.gz
PKG_SOURCE_URL:=http://members.aon.at/linuxfreak/linux/
PKG_MD5SUM:=13f2202ff01ff6b6463989f34f453063

PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)-$(BUILD_VARIANT)/$(PKG_NAME)

include $(INCLUDE_DIR)/package.mk

define Package/mini-snmpd/Default
  TITLE:=SNMP server for embedded systems
  URL:=http://members.aon.at/linuxfreak/linux/mini_snmpd.html
endef

define Package/mini-snmpd
$(call Package/mini-snmpd/Default)
  SECTION:=net
  CATEGORY:=Network
  TITLE+= (IPv4 only)
  VARIANT:=ipv4
endef

define Package/mini-snmpd6
$(call Package/mini-snmpd/Default)
  SECTION:=ipv6
  CATEGORY:=IPv6
  TITLE+= (IPv6 only)
  VARIANT:=ipv6
  DEPENDS:=+kmod-ipv6
endef


PKG_OFLAGS:=$(TARGET_CFLAGS) -DSYSLOG
ifeq ($(BUILD_VARIANT),ipv6)
  PKG_OFLAGS+= -DIPV6
endif

MAKE_FLAGS+= \
	OFLAGS="$(PKG_OFLAGS)" \
	STRIP="/bin/true" \
	INSTALL_ROOT="$(PKG_INSTALL_DIR)" \
	mini_snmpd install

define Package/mini-snmpd/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(CP) $(PKG_INSTALL_DIR)/sbin/mini_snmpd $(1)/usr/bin/
	$(INSTALL_DIR) $(1)/etc/config
	$(INSTALL_CONF) ./files/mini_snmpd.config $(1)/etc/config/mini_snmpd
	$(INSTALL_DIR) $(1)/etc/init.d
	$(INSTALL_BIN) ./files/mini_snmpd.init $(1)/etc/init.d/mini_snmpd
endef

Package/mini-snmpd6/install=$(Package/mini-snmpd/install)

$(eval $(call BuildPackage,mini-snmpd))
$(eval $(call BuildPackage,mini-snmpd6))
