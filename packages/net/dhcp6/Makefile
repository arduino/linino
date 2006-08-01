#
# Copyright (C) 2006 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
# $Id$

include $(TOPDIR)/rules.mk

PKG_NAME:=dhcp6
PKG_VERSION:=1.0
PKG_RELEASE:=1
PKG_MD5SUM:=86193dfa62137db3ea459543db4f1102
PKG_SOURCE_URL:=@SF/dhcpv6-linux
PKG_SOURCE:=dhcpv6-linux-$(PKG_VERSION).zip
PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)-$(PKG_VERSION)
PKG_CAT:=unzip

PKG_INSTALL_DIR:=$(PKG_BUILD_DIR)/ipkg-install

include $(INCLUDE_DIR)/package.mk

define Package/dhcp6
  SECTION:=net
  CATEGORY:=Network
  DEPENDS:=+libncurses
  SUBMENU:=IPv6 DHCP server and client
  TITLE:=IPv6 DHCP server and client
  DESCRIPTION:=IPv6 DHCP server and client
  URL:=http://sourceforge.net/projects/dhcpv6-linux
endef

define Package/dhcp6-server
  $(call Package/dhcp6)
  DEFAULT:=m if ALL
  TITLE:=DHCPv6 server
  DESCRIPTION:=DHCPv6 server
endef

define Package/dhcp6-server/conffiles
/etc/dhcpd6/dhcpd6.conf
/etc/dhcpd6/leases6.conf
/etc/dhcpd6/partial_leases6.conf
endef

define Package/dhcp6-client
  $(call Package/dhcp6)
  DEFAULT:=m if ALL
  TITLE:=DHCPv6 client
  DESCRIPTION:=DHCPv6 client
endef

define Package/dhcp6-client/conffiles
/etc/dhcp6/solicit.conf
endef


define Build/Compile
	$(MAKE) -C $(PKG_BUILD_DIR)/server \
		CC=$(TARGET_CC) STAGING_DIR=$(STAGING_DIR)
	$(MAKE) -C $(PKG_BUILD_DIR)/client \
		CC=$(TARGET_CC) STAGING_DIR=$(STAGING_DIR)
endef

define Package/dhcp6-server/install
	install -d -m0755 $(1)/usr/sbin $(1)/etc/dhcpd6
	install -m0755 $(PKG_BUILD_DIR)/server/serv $(1)/usr/sbin/dhcpd6
	install -m0755 $(PKG_BUILD_DIR)/server/*.conf $(1)/etc/dhcpd6/
endef

define Package/dhcp6-client/install
	install -d $(1)/usr/sbin $(1)/etc/dhcp6
	install -m0755 $(PKG_BUILD_DIR)/client/cli $(1)/usr/sbin/dhcp6client
	install -m0755 $(PKG_BUILD_DIR)/client/solicit.conf $(1)/etc/dhcp6/
endef

$(eval $(call BuildPackage,dhcp6-server))
$(eval $(call BuildPackage,dhcp6-client))
