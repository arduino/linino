#
# Copyright (C) 2006-2012 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=dhcp
PKG_VERSION:=4.2.4
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=ftp://ftp.isc.org/isc/dhcp/$(PKG_VERSION)
PKG_MD5SUM:=c244cefe663d43100af757d8ff625a1f

PKG_FIXUP:=autoreconf
PKG_BUILD_PARALLEL:=1

include $(INCLUDE_DIR)/package.mk

define Package/dhcp/Default
  SECTION:=net
  CATEGORY:=Network
  SUBMENU:=IP Addresses and Names
  TITLE:=ISC's DHCP
  URL:=https://www.isc.org/software/dhcp
endef

define Package/dhcp-relay
  $(call Package/dhcp/Default)
  TITLE+= relay
endef

define Package/dhcp-relay/description
 provides a means for relaying DHCP and BOOTP requests from a subnet to which
 no DHCP server is directly connected to one or more DHCP servers on other
 subnets.
endef

define Package/dhcp-client
  $(call Package/dhcp/Default)
  TITLE+= client
endef

define Package/dhcp-client/description
 provides a means for configuring one or more network interfaces using the
 Dynamic Host Configuration Protocol, BOOTP protocol, or if these protocols
 fail, by statically assigning an address.
endef

define Package/dhcp-server
  $(call Package/dhcp/Default)
  TITLE+= server
endef

define Package/dhcp-server/description
 implements the Dynamic Host Configuration Protocol (DHCP) and the Internet
 Bootstrap Protocol (BOOTP).
endef

define Package/dhcp-omshell
  $(call Package/dhcp/Default)
  DEPENDS:= +dhcp-server
  TITLE+= omshell
endef

define Package/dhcp-omshell/description
 provides an interactive way to connect to, query, and possibly change, the ISC
 DHCP Server's state via OMAPI, the Object Management API.
endef

CONFIGURE_ARGS += \
	--disable-tracing 		\
	--enable-paranoia		\
	--disable-dependency-tracking	\
	ac_cv_file__dev_random=yes

ifeq ($(CONFIG_DHCP4_ENABLE_IPV6),y)
  CONFIGURE_ARGS += --enable-dhcpv6
else
  CONFIGURE_ARGS += --disable-dhcpv6
endif

define Build/Compile
	$(MAKE) -C $(PKG_BUILD_DIR)			\
		DESTDIR="$(PKG_INSTALL_DIR)"		\
		BUILD_CC="$(HOSTCC_NOCACHE)"		\
		host_alias="$(GNU_TARGET_NAME)"		\
		target_alias="$(GNU_TARGET_NAME)"	\
		build_alias="$(GNU_HOST_NAME)"		\
		ac_cv_file__dev_random=yes		\
		all install-exec
endef

define Package/dhcp-relay/install
	$(INSTALL_DIR) $(1)/usr/sbin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/usr/sbin/dhcrelay $(1)/usr/sbin/
endef

define Package/dhcp-server/install
	$(INSTALL_DIR) $(1)/usr/sbin $(1)/etc/init.d
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/usr/sbin/dhcpd $(1)/usr/sbin/
	$(INSTALL_BIN) ./files/dhcpd.init $(1)/etc/init.d/dhcpd
	$(INSTALL_BIN) ./files/dhcpd.conf $(1)/etc
ifeq ($(CONFIG_DHCP4_ENABLE_IPV6),y)
	$(INSTALL_BIN) ./files/dhcpd6.init $(1)/etc/init.d/dhcpd6
	$(INSTALL_BIN) ./files/dhcpd6.conf $(1)/etc
endif
endef

define Package/dhcp-client/install
	$(INSTALL_DIR) $(1)/usr/sbin $(1)/etc/init.d
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/usr/sbin/dhclient $(1)/usr/sbin/
	$(INSTALL_BIN) ./files/dhclient-script $(1)/usr/sbin/
	$(INSTALL_BIN) ./files/dhclient.init $(1)/etc/init.d/dhclient
ifeq ($(CONFIG_DHCP4_ENABLE_IPV6),y)
	$(INSTALL_BIN) ./files/dhclient6.init $(1)/etc/init.d/dhclient6
	$(INSTALL_BIN) ./files/dhclient6.conf $(1)/etc
endif
endef

define Package/dhcp-omshell/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/usr/bin/omshell $(1)/usr/bin/
endef

$(eval $(call BuildPackage,dhcp-relay))
$(eval $(call BuildPackage,dhcp-server))
$(eval $(call BuildPackage,dhcp-client))
$(eval $(call BuildPackage,dhcp-omshell))
