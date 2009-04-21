#
# Copyright (C) 2006-2009 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
# $Id$

include $(TOPDIR)/rules.mk

PKG_NAME:=net-snmp
PKG_VERSION:=5.1.2
PKG_RELEASE:=3.1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=@SF/net-snmp
PKG_MD5SUM:=8080555ab3f90011f25d5122042d9a8d

include $(INCLUDE_DIR)/package.mk

define Package/net-snmp/Default
  SECTION:=net
  CATEGORY:=Network
  URL:=http://www.net-snmp.org/
endef

define Package/net-snmp/Default/description
 Simple Network Management Protocol (SNMP) is a widely used protocol for 
 monitoring the health and welfare of network equipment (eg. routers), 
 computer equipment and even devices like UPSs. Net-SNMP is a suite of 
 applications used to implement SNMP v1, SNMP v2c and SNMP v3 using both 
 IPv4 and IPv6.
endef


define Package/libnetsnmp
$(call Package/net-snmp/Default)
  SECTION:=libs
  CATEGORY:=Libraries
  DEPENDS:=+libelf
  TITLE:=Open source SNMP implementation (librairies)
endef

define Package/libnetsnmp/description
$(call Package/net-snmp/Default/description)
 .
 This package contains shared libraries, needed by other programs.
endef


define Package/snmp-utils
$(call Package/net-snmp/Default)
  DEPENDS:=+libnetsnmp
  TITLE:=Open source SNMP implementation (utilities)
endef

define Package/snmp-utils/description
$(call Package/net-snmp/Default/description)
 .
 This package contains SNMP client utilities.
endef


define Package/snmpd
$(call Package/net-snmp/Default)
  DEPENDS:=+libnetsnmp
  TITLE:=Open source SNMP implementation (daemon)
endef

define Package/snmpd/description
$(call Package/net-snmp/Default/description)
 .
 This package contains the SNMP agent, dynamically linked.
endef


define Package/snmpd-static
$(call Package/net-snmp/Default)
  TITLE:=Open source SNMP implementation (daemon)
  DEPENDS:=+libelf
endef

define Package/snmpd-static/description
$(call Package/net-snmp/Default/description)
 .
 This package contains the SNMP agent, statically linked.
endef


SNMP_MIB_MODULES_INCLUDED = \
	host/hr_device \
	host/hr_disk \
	host/hr_filesys \
	host/hr_network \
	host/hr_partition \
	host/hr_proc \
	host/hr_storage \
	host/hr_system \
	mibII/at \
	mibII/icmp \
	mibII/interfaces \
	mibII/ip \
	mibII/snmp_mib \
	mibII/sysORTable \
	mibII/system_mib \
	mibII/tcp \
	mibII/udp \
	mibII/vacm_context \
	mibII/vacm_vars \
	snmpv3/snmpEngine \
	snmpv3/snmpMPDStats \
	snmpv3/usmStats \
	snmpv3/usmUser \
	snmpv3mibs \
	tunnel \
	ucd-snmp/disk \
	ucd-snmp/dlmod \
	ucd-snmp/extensible \
	ucd-snmp/loadave \
	ucd-snmp/memory \
	ucd-snmp/pass \
	ucd-snmp/proc \
	ucd-snmp/vmstat \
	util_funcs \
	utilities/execute \

SNMP_MIB_MODULES_EXCLUDED = \
	agent_mibs \
	agentx \
	host \
	ieee802dot11 \
	mibII \
	notification \
	snmpv3mibs \
	target \
	ucd_snmp \
	utilities \

SNMP_TRANSPORTS_INCLUDED = Callback UDP

SNMP_TRANSPORTS_EXCLUDED = TCP TCPv6 UDPv6 Unix

TARGET_CFLAGS += $(FPIC)

CONFIGURE_ARGS += \
	--enable-shared \
	--enable-static \
	--with-endianness=little \
	--with-logfile=/var/log/snmpd.log \
	--with-persistent-directory=/usr/lib/snmp/ \
	--with-default-snmp-version=1 \
	--with-sys-contact=root@localhost \
	--with-sys-location=Unknown \
	--enable-applications \
	--disable-debugging \
	--disable-ipv6 \
	--disable-manuals \
	--disable-mibs \
	--disable-scripts \
	--with-out-mib-modules="$(SNMP_MIB_MODULES_EXCLUDED)" \
	--with-mib-modules="$(SNMP_MIB_MODULES_INCLUDED)" \
	--with-out-transports="$(SNMP_TRANSPORTS_EXCLUDED)" \
	--with-transports="$(SNMP_TRANSPORTS_INCLUDED)" \
	--without-openssl \
	--without-libwrap \
	--without-rpm \
	--without-zlib \

define Build/Compile
	rm -rf $(PKG_INSTALL_DIR)
	mkdir -p $(PKG_INSTALL_DIR)
	$(MAKE) -C $(PKG_BUILD_DIR) \
		INSTALL_PREFIX="$(PKG_INSTALL_DIR)" \
		all install
	( cd $(PKG_INSTALL_DIR); mv ./usr/sbin/snmpd ./usr/sbin/snmpd-shared; )
	#ifneq ($(CONFIG_PACKAGE_snmpd-static),)
	( cd $(PKG_BUILD_DIR); rm -f agent/snmpd; )
	$(MAKE) -C $(PKG_BUILD_DIR) \
		LDFLAGS="$(TARGET_LDFLAGS) -static" \
		INSTALL_PREFIX="$(PKG_INSTALL_DIR)" \
		all install
	( cd $(PKG_INSTALL_DIR); mv ./usr/sbin/snmpd ./usr/sbin/snmpd-static; )
	#endif
endef

define Build/InstallDev
	$(INSTALL_DIR) $(2)/bin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/usr/bin/net-snmp-config $(2)/bin/
	$(SED) 's,=/usr,=$(STAGING_DIR)/usr,g' $(2)/bin/net-snmp-config

	$(INSTALL_DIR) $(1)/usr/include
	$(CP) $(PKG_INSTALL_DIR)/usr/include/net-snmp $(1)/usr/include/
	$(INSTALL_DIR) $(1)/usr/lib
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/libnetsnmp{,agent,helpers,mibs}.{a,so*} $(1)/usr/lib/
endef

define Package/libnetsnmp/install
	$(INSTALL_DIR) $(1)/usr/lib
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/libnetsnmp{,agent,helpers,mibs}.so.* $(1)/usr/lib/
endef

define Package/snmpd/conffiles
/etc/default/snmpd
/etc/config/snmpd
endef

define Package/snmpd/install
	$(INSTALL_DIR) $(1)/etc/config
	$(INSTALL_DATA) ./files/snmpd.conf $(1)/etc/config/snmpd
	$(INSTALL_DIR) $(1)/etc/snmp
	ln -sf /var/run/snmpd.conf $(1)/etc/snmp/
	$(INSTALL_DIR) $(1)/etc/default
	$(INSTALL_DATA) ./files/snmpd.default $(1)/etc/default/snmpd
	$(INSTALL_DIR) $(1)/etc/init.d
	$(INSTALL_BIN) ./files/snmpd.init $(1)/etc/init.d/snmpd
	$(INSTALL_DIR) $(1)/usr/sbin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/usr/sbin/snmpd-shared $(1)/usr/sbin/snmpd
endef

define Package/snmpd-static/conffiles
/etc/default/snmpd
/etc/config/snmpd
endef

define Package/snmpd-static/install
	$(INSTALL_DIR) $(1)/etc/config
	$(INSTALL_DATA) ./files/snmpd.conf $(1)/etc/config/snmpd
	$(INSTALL_DIR) $(1)/etc/snmp
	ln -sf /var/run/snmpd.conf $(1)/etc/snmp/
	$(INSTALL_DIR) $(1)/etc/default
	$(INSTALL_DATA) ./files/snmpd.default $(1)/etc/default/snmpd
	$(INSTALL_DIR) $(1)/etc/init.d
	$(INSTALL_BIN) ./files/snmpd.init $(1)/etc/init.d/snmpd
	$(INSTALL_DIR) $(1)/usr/sbin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/usr/sbin/snmpd-static $(1)/usr/sbin/snmpd
endef

define Package/snmp-utils/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/usr/bin/snmp{get,set,status,test,trap,walk} $(1)/usr/bin/
endef

$(eval $(call BuildPackage,libnetsnmp))
$(eval $(call BuildPackage,snmp-utils))
$(eval $(call BuildPackage,snmpd))
$(eval $(call BuildPackage,snmpd-static))
