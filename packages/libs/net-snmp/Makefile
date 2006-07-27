# 
# Copyright (C) 2006 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
# $Id$

include $(TOPDIR)/rules.mk

PKG_NAME:=net-snmp
PKG_VERSION:=5.1.2
PKG_RELEASE:=2.1

PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)-$(PKG_VERSION)
PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=@SF/net-snmp
PKG_MD5SUM:=8080555ab3f90011f25d5122042d9a8d
PKG_CAT:=zcat

PKG_INSTALL_DIR:=$(PKG_BUILD_DIR)/ipkg-install

include $(INCLUDE_DIR)/package.mk

define Package/libnetsnmp
  SECTION:=libs
  CATEGORY:=Libraries
  DEPENDS:=+libelf
  TITLE:=Open source SNMP implementation (librairies)
  DESCRIPTION:=Open source SNMP (Simple Network Management Protocol) implementation (libraries).\\\
    Simple Network Management Protocol (SNMP) is a widely used \\\
    protocol for monitoring the health and welfare of network \\\
    equipment (eg. routers), computer equipment and even devices \\\
    like UPSs. Net-SNMP is a suite of applications used to implement \\\
    SNMP v1, SNMP v2c and SNMP v3 using both IPv4 and IPv6.\\\
    \\\
    This package contains shared libraries, needed by other programs.
  URL:=http://www.net-snmp.org/
endef

define Package/snmp-utils
  SECTION:=net
  CATEGORY:=Network
  DEPENDS:=+libnetsnmp
  TITLE:=Open source SNMP implementation (utilities)
  DESCRIPTION:=Open source SNMP (Simple Network Management Protocol) implementation (utilities).\\\
    Simple Network Management Protocol (SNMP) is a widely used \\\
    protocol for monitoring the health and welfare of network \\\
    equipment (eg. routers), computer equipment and even devices \\\
    like UPSs. Net-SNMP is a suite of applications used to implement \\\
    SNMP v1, SNMP v2c and SNMP v3 using both IPv4 and IPv6.\\\
    \\\
    This package contains SNMP client utilities.
  URL:=http://www.net-snmp.org/
endef

define Package/snmpd
  SECTION:=net
  CATEGORY:=Network
  DEPENDS:=+libnetsnmp
  TITLE:=Open source SNMP implementation (daemon)
  DESCRIPTION:=Open source SNMP (Simple Network Management Protocol) implementation (daemon).\\\
    Simple Network Management Protocol (SNMP) is a widely used \\\
    protocol for monitoring the health and welfare of network \\\
    equipment (eg. routers), computer equipment and even devices \\\
    like UPSs. Net-SNMP is a suite of applications used to implement \\\
    SNMP v1, SNMP v2c and SNMP v3 using both IPv4 and IPv6.\\\
    \\\
    This package contains the SNMP agent, dynamically linked.
  URL:=http://www.net-snmp.org/
endef

define Package/snmpd/conffiles
/etc/default/snmpd
/etc/snmp/snmpd.conf
endef

define Package/snmpd-static
  SECTION:=net
  CATEGORY:=Network
  TITLE:=Open source SNMP implementation (daemon)
  DESCRIPTION:=Open source SNMP (Simple Network Management Protocol) implementation (daemon).\\\
    Simple Network Management Protocol (SNMP) is a widely used \\\
    protocol for monitoring the health and welfare of network \\\
    equipment (eg. routers), computer equipment and even devices \\\
    like UPSs. Net-SNMP is a suite of applications used to implement \\\
    SNMP v1, SNMP v2c and SNMP v3 using both IPv4 and IPv6.\\\
    \\\
    This package contains the SNMP agent, statically linked.
  URL:=http://www.net-snmp.org/
endef

define Package/snmpd-static/conffiles
/etc/default/snmpd
/etc/snmp/snmpd.conf
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

PKG_CONFIGURE_OPTIONS = \
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
	--disable-mib-loading \
	--disable-mibs \
	--disable-scripts \
	--with-out-mib-modules="$(SNMP_MIB_MODULES_EXCLUDED)" \
	--with-mib-modules="$(SNMP_MIB_MODULES_INCLUDED)" \
	--with-out-transports="$(SNMP_TRANSPORTS_EXCLUDED)" \
	--with-transports="$(SNMP_TRANSPORTS_INCLUDED)" \
	--without-opaque-special-types \
	--without-openssl \
	--without-libwrap \
	--without-rpm \
	--without-zlib \

define Build/Configure
	(cd $(PKG_BUILD_DIR); rm -f config.cache; \
		$(TARGET_CONFIGURE_OPTS) \
		CFLAGS="$(TARGET_CFLAGS)" \
		CPPFLAGS="-I$(STAGING_DIR)/usr/include -I$(STAGING_DIR)/include" \
		LDFLAGS="-L$(STAGING_DIR)/usr/lib -L$(STAGING_DIR)/lib" \
		ac_cv_header_pcap_h=no \
		./configure \
			--target=$(GNU_TARGET_NAME) \
			--host=$(GNU_TARGET_NAME) \
			--build=$(GNU_HOST_NAME) \
			--program-prefix="" \
			--program-suffix="" \
			--prefix=/usr \
			--exec-prefix=/usr \
			--bindir=/usr/bin \
			--datadir=/usr/share \
			--includedir=/usr/include \
			--infodir=/usr/share/info \
			--libdir=/usr/lib \
			--libexecdir=/usr/lib \
			--localstatedir=/var \
			--mandir=/usr/share/man \
			--sbindir=/usr/sbin \
			--sysconfdir=/etc \
			$(DISABLE_LARGEFILE) \
			$(DISABLE_NLS) \
			$(PKG_CONFIGURE_OPTIONS) \
	);
endef

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
		LDFLAGS="-L$(STAGING_DIR)/usr/lib -L$(STAGING_DIR)/lib -static" \
		INSTALL_PREFIX="$(PKG_INSTALL_DIR)" \
		all install
	( cd $(PKG_INSTALL_DIR); mv ./usr/sbin/snmpd ./usr/sbin/snmpd-static; )
	#endif
endef

define Package/libnetsnmp/install
	install -d -m0755 $(1)/usr/lib
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/libnetsnmp{,agent,helpers,mibs}.so.* $(1)/usr/lib/
endef

define Package/snmpd/install
	install -d -m0755 $(1)/etc/snmp
	install -m0644 ./files/snmpd.conf $(1)/etc/snmp/snmpd.conf
	install -d -m0755 $(1)/etc/default
	install -m0644 ./files/snmpd.default $(1)/etc/default/snmpd
	install -d -m0755 $(1)/etc/init.d
	install -m0755 ./files/snmpd.init $(1)/etc/init.d/snmpd
	install -d -m0755 $(1)/usr/sbin
	install -m0755 $(PKG_INSTALL_DIR)/usr/sbin/snmpd-shared $(1)/usr/sbin/snmpd
endef

define Package/snmpd-static/install
	install -d -m0755 $(1)/etc/snmp
	install -m0644 ./files/snmpd.conf $(1)/etc/snmp/snmpd.conf
	install -d -m0755 $(1)/etc/default
	install -m0644 ./files/snmpd.default $(1)/etc/default/snmpd
	install -d -m0755 $(1)/etc/init.d
	install -m0755 ./files/snmpd.init $(1)/etc/init.d/snmpd
	install -d -m0755 $(1)/usr/sbin
	install -m0755 $(PKG_INSTALL_DIR)/usr/sbin/snmpd-static $(1)/usr/sbin/snmpd
endef

define Package/snmp-utils/install
	install -d -m0755 $(1)/usr/bin
	$(CP) $(PKG_INSTALL_DIR)/usr/bin/snmp{get,set,status,test,trap,walk} $(1)/usr/bin/
endef

define Build/InstallDev
	mkdir -p $(STAGING_DIR)/usr/bin
	$(CP) $(PKG_INSTALL_DIR)/usr/bin/net-snmp-config $(STAGING_DIR)/usr/bin/
	mkdir -p $(STAGING_DIR)/usr/include
	$(CP) $(PKG_INSTALL_DIR)/usr/include/net-snmp $(STAGING_DIR)/usr/include/
	mkdir -p $(STAGING_DIR)/usr/lib
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/libnetsnmp{,agent,helpers,mibs}.{a,so*} $(STAGING_DIR)/usr/lib/
endef

define Build/UninstallDev
	rm -rf \
		$(STAGING_DIR)/usr/bin/net-snmp-config \
		$(STAGING_DIR)/usr/include/net-snmp \
		$(STAGING_DIR)/usr/lib/libnetsnmp{,agent,helpers,mibs}.{a,so*}
endef

$(eval $(call BuildPackage,libnetsnmp))
$(eval $(call BuildPackage,snmp-utils))
$(eval $(call BuildPackage,snmpd))
$(eval $(call BuildPackage,snmpd-static))
