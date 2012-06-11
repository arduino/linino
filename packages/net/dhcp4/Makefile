#
# Copyright (C) 2006-2008 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
# This makefile is loosely based on a version for 4.1.0 that was designed to be OpenWRT friendly.
#
# $Id: Makefile 1 2011-12-17 17:42:34Z Olipro $

include $(TOPDIR)/rules.mk

PKG_NAME:=dhcp
PKG_VERSION:=4.2.3-P1
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=ftp://ftp.isc.org/isc/dhcp/$(PKG_VERSION)
PKG_MD5SUM:=04599f1557a5cafd10d7745267a68c8b

PKG_FIXUP:=autoreconf
PKG_BUILD_PARALLEL:=1

include $(INCLUDE_DIR)/package.mk

define Package/dhcp4/Default
  SECTION:=net
  CATEGORY:=Network
  URL:=http://www.isc.org/
endef

define Package/dhcp4
  $(call Package/dhcp4/Default)
  TITLE:=ISC DHCP-${PKG_VERSION}
#  PKG_HOST_ONLY:=1
  MENU:=1
endef

define Package/dhcp4/config
  source "$(SOURCE)/Config.in"
endef

define Package/dhcp4/description
-
	This is the latest available version of the ISC DHCP suite. Generally speaking, you are unlikely
	to have any need of this application; it has a considerably larger filesize than dnsmasq and thus
	you should only be selecting this package because you need features only available in this suite.
	
endef

define Package/dhcp4-relay
  $(call Package/dhcp4/Default)
  DEPENDS:=@PACKAGE_dhcp4
  TITLE:=ISC DHCP Relay
endef

define Package/dhcp4-relay/description
The DHCP relay agent is for relaying DHCP messages between separate network segments.
	
	This is the latest available version of the ISC DHCP suite. Generally speaking, you are unlikely
	to have any need of this application; it has a considerably larger filesize than dnsmasq and thus
	you should only be selecting this package because you need features only available in this suite.
	
endef

define Package/dhcp4-server
  $(call Package/dhcp4/Default)
  DEPENDS:=@PACKAGE_dhcp4
  TITLE:=ISC DHCP Server
endef

define Package/dhcp4-server/description
The ISC DHCP server provides comprehensive DHCP configuration and functionality for network
hosts that have a complimentary DHCP client running.
	
	This is the latest available version of the ISC DHCP suite. Generally speaking, you are unlikely
	to have any need of this application; it has a considerably larger filesize than dnsmasq and thus
	you should only be selecting this package because you need features only available in this suite.
	
endef

define Package/dhcp4-client
  $(call Package/dhcp4/Default)
  DEPENDS:=@PACKAGE_dhcp4
  TITLE:=ISC DHCP Client
endef

define Package/dhcp4-client/description
The ISC DHCP client receives configuration information from a DHCP server and configures the host
accordingly.
	
	This is the latest available version of the ISC DHCP suite. Generally speaking, you are unlikely
	to have any need of this application; it has a considerably larger filesize than dnsmasq and thus
	you should only be selecting this package because you need features only available in this suite.
	
endef

define Package/dhcp4-omshell
  $(call Package/dhcp4/Default)
  DEPENDS:=@PACKAGE_dhcp4
  TITLE:=ISC DHCP OmShell
endef

define Package/dhcp4-omshell/description
The ISC OmShell utility enables you to change the configuration of a running DHCP instance
without having to endure the hassle of manually modifying the configuration file then
killing and restarting it.
	
	This is the latest available version of the ISC DHCP suite. Generally speaking, you are unlikely
	to have any need of this application; it has a considerably larger filesize than dnsmasq and thus
	you should only be selecting this package because you need features only available in this suite.
	
endef

CONFIGURE_ARGS += ac_cv_file__dev_random=yes --disable-tracing --enable-paranoia --disable-dependency-tracking
ifeq ($(CONFIG_DHCP4_ENABLE_IPV6),y)
  CONFIGURE_ARGS += --enable-dhcpv6
else
  CONFIGURE_ARGS += --disable-dhcpv6
endif


define Build/Compile
	$(MAKE) -C $(PKG_BUILD_DIR) \
		DESTDIR="$(PKG_INSTALL_DIR)" \
		CROSS_COMPILE="$(GNU_TARGET_NAME)" BUILD_CC="$(HOSTCC)" CC="$(TARGET_CC)" host_alias="$(GNU_TARGET_NAME)" target_alias="$(GNU_TARGET_NAME)" build_alias="$(GNU_HOST_NAME)" \
		ac_cv_file__dev_random=yes \
		all install-exec
endef

define Package/dhcp4/install

endef

define Package/dhcp4-relay/install
	$(INSTALL_DIR) $(1)/usr/sbin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/usr/sbin/dhcrelay $(1)/usr/sbin/
endef

define Package/dhcp4-server/install
	$(INSTALL_DIR) $(1)/usr/sbin
#	$(INSTALL_DIR) $(1)/usr/lib
	$(INSTALL_DIR) $(1)/etc/init.d
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/usr/sbin/dhcpd $(1)/usr/sbin/
#Libs appear to be unnecessary
#	$(INSTALL_DATA) $(PKG_INSTALL_DIR)/usr/lib/*.a $(1)/usr/lib
	$(INSTALL_BIN) ./files/dhcpd.init $(1)/etc/init.d/dhcpd
	$(INSTALL_BIN) ./files/dhcpd.conf $(1)/etc
ifeq ($(CONFIG_DHCP4_ENABLE_IPV6),y)
	$(INSTALL_BIN) ./files/dhcpd6.init $(1)/etc/init.d/dhcpd6
	$(INSTALL_BIN) ./files/dhcpd6.conf $(1)/etc
endif
endef

define Package/dhcp4-client/install
	$(INSTALL_DIR) $(1)/usr/sbin
	$(INSTALL_DIR) $(1)/etc/init.d
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/usr/sbin/dhclient $(1)/usr/sbin/
	$(INSTALL_BIN) ./files/dhclient-script $(1)/usr/sbin/
	$(INSTALL_BIN) ./files/dhclient.init $(1)/etc/init.d/dhclient
ifeq ($(CONFIG_DHCP4_ENABLE_IPV6),y)
	$(INSTALL_BIN) ./files/dhclient6.init $(1)/etc/init.d/dhclient6
	$(INSTALL_BIN) ./files/dhclient6.conf $(1)/etc
endif
endef

define Package/dhcp4-omshell/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/usr/bin/omshell $(1)/usr/bin/
endef

$(eval $(call BuildPackage,dhcp4))
$(eval $(call BuildPackage,dhcp4-relay))
$(eval $(call BuildPackage,dhcp4-server))
$(eval $(call BuildPackage,dhcp4-client))
$(eval $(call BuildPackage,dhcp4-omshell))
