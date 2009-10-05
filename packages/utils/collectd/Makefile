#
# Copyright (C) 2006-2009 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=collectd
PKG_VERSION:=4.4.4
PKG_RELEASE:=3

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.bz2
PKG_SOURCE_URL:=http://collectd.org/files/
PKG_MD5SUM:=9e0e89150b1ff28fc0fdd8a198c9ac5e

PKG_FIXUP:=libtool

COLLECTD_PLUGINS_DISABLED:= \
	apple_sensors \
	battery \
	cpufreq \
	entropy \
	hddtemp \
	ipmi \
	ipvs \
	libvirt \
	mbmon \
	memcached \
	multimeter \
	nfs \
	perl \
	serial \
	swap \
	tape \
	uuid \
	vserver \
	xmms \

COLLECTD_PLUGINS_SELECTED:= \
	apache \
	apcups \
	ascent \
	cpu \
	csv \
	df \
	disk \
	dns \
	email \
	exec \
	interface \
	iptables \
	irq \
	load \
	logfile \
	memory \
	mysql \
	netlink \
	network \
	nginx \
	ntpd \
	nut \
	ping \
	powerdns \
	processes \
	rrdtool \
	sensors \
	snmp \
	syslog \
	tail \
	tcpconns \
	teamspeak2 \
	unixsock \
	users \
	vmem \
	wireless \

PKG_CONFIG_DEPENDS:= \
	$(patsubst %,CONFIG_PACKAGE_collectd-mod-%,$(COLLECTD_PLUGINS_SELECTED)) \

include $(INCLUDE_DIR)/package.mk
include $(INCLUDE_DIR)/kernel.mk

define Package/collectd/Default
  SECTION:=utils
  CATEGORY:=Utilities
  TITLE:=Lightweight system statistics collection daemon
  URL:=http://verplant.org/collectd/
endef

define Package/collectd
$(call Package/collectd/Default)
  DEPENDS:=+libgcc +libpthread +zlib
  MENU:=1
endef

define Package/collectd/description
 collectd is a small daemon which collects system information periodically
 and provides mechanismns to store the values in a variety of ways.
endef

# common configure args
CONFIGURE_ARGS+= \
	--disable-debug \
	--enable-daemon \
	--enable-getifaddrs \
	--with-nan-emulation \
	--with-fp-layout=nothing

CONFIGURE_VARS+= \
	CFLAGS="$$$$CFLAGS $(FPIC)" \
	LDFLAGS="$$$$LDFLAGS -lm -lz" \
	KERNEL_DIR="$(LINUX_DIR)" \

CONFIGURE_PLUGIN:= \
	$(foreach m, $(1), \
		$(if $(CONFIG_PACKAGE_collectd-mod-$(m)),--enable-$(m),--disable-$(m)) \
	)

CONFIGURE_ARGS+= \
	$(call CONFIGURE_PLUGIN,$(COLLECTD_PLUGINS_SELECTED)) \
	$(call CONFIGURE_PLUGIN,$(COLLECTD_PLUGINS_DISABLED)) \

# exception: mod-ascent needs libxml2
ifneq ($(CONFIG_PACKAGE_collectd-mod-netlink),)
  CONFIGURE_VARS+= \
	CPPFLAGS="$$$$CPPFLAGS -I$(STAGING_DIR)/usr/include/libxml2"
endif

# exception: mod-netlink needs libnetlink from iproute
ifneq ($(CONFIG_PACKAGE_collectd-mod-netlink),)
  CONFIGURE_ARGS+= --with-libnetlink="$(STAGING_DIR)/usr"
endif

# exception: mod-rrdtool needs rrdtool-1.0.x
ifneq ($(CONFIG_PACKAGE_collectd-mod-rrdtool),)
  CONFIGURE_ARGS+= --with-rrdtool="$(STAGING_DIR)/usr/lib/rrdtool-1.0"
endif

MAKE_FLAGS += \
	DESTDIR="$(PKG_INSTALL_DIR)" \
	all install

define Package/collectd/conffiles
/etc/collectd.conf
endef

define Package/collectd/install
	$(INSTALL_DIR) $(1)/usr/sbin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/usr/sbin/collectd $(1)/usr/sbin/
	$(INSTALL_DIR) $(1)/usr/lib/collectd
	$(INSTALL_CONF) $(PKG_INSTALL_DIR)/usr/lib/collectd/types.db $(1)/usr/lib/collectd/
	$(INSTALL_DIR) $(1)/etc
	$(INSTALL_CONF) ./files/collectd.conf $(1)/etc/
	$(INSTALL_DIR) $(1)/etc/init.d
	$(INSTALL_BIN) ./files/collectd.init $(1)/etc/init.d/collectd
endef

# 1: plugin name
# 2: plugin title/description
# 3: files
# 4: extra dependency
define BuildPlugin

  PKG_CONFIG_DEPENDS+= CONFIG_PACKAGE_collectd-mod-$(1)

  define Package/collectd-mod-$(1)
  $$(call Package/collectd/Default)
    TITLE:=$(2) plugin
    DEPENDS:= collectd $(4)
  endef

  define Package/collectd-mod-$(1)/install
	$(INSTALL_DIR) $$(1)/usr/lib/collectd
	for m in $(3); do \
		$(CP) \
			$(PKG_INSTALL_DIR)/usr/lib/collectd/$$$$$$$${m}.so \
			$$(1)/usr/lib/collectd/ ; \
	done
  endef

  $$(eval $$(call BuildPackage,collectd-mod-$(1)))

endef

$(eval $(call BuildPackage,collectd))

#$(eval $(call BuildPlugin,NAME,DESCRIPTION,FILES,DEPENDENCIES))
$(eval $(call BuildPlugin,apache,apache status input,apache,+libcurl))
$(eval $(call BuildPlugin,apcups,apcups status input,apcups,))
$(eval $(call BuildPlugin,ascent,ascent status input,ascent,+libcurl +libxml2))
$(eval $(call BuildPlugin,cpu,CPU input,cpu,))
$(eval $(call BuildPlugin,csv,CSV output,csv,))
$(eval $(call BuildPlugin,df,disk space input,df,))
$(eval $(call BuildPlugin,disk,disk usage/timing input,disk,))
$(eval $(call BuildPlugin,dns,DNS traffic input,dns,+libpcap))
$(eval $(call BuildPlugin,email,email output,email,))
$(eval $(call BuildPlugin,exec,process exec input,exec,))
$(eval $(call BuildPlugin,interface,network interfaces input,interface,))
$(eval $(call BuildPlugin,iptables,iptables status input,iptables,+iptables))
$(eval $(call BuildPlugin,irq,interrupt usage input,irq,))
$(eval $(call BuildPlugin,load,system load input,load,))
$(eval $(call BuildPlugin,logfile,log files output,logfile,))
$(eval $(call BuildPlugin,mysql,MySQL status input,mysql,+libmysqlclient))
$(eval $(call BuildPlugin,memory,physical memory usage input,memory,))
$(eval $(call BuildPlugin,netlink,netlink input,netlink,+ip))
$(eval $(call BuildPlugin,network,network input/output,network))
$(eval $(call BuildPlugin,nginx,nginx status input,nginx,+libcurl))
$(eval $(call BuildPlugin,ntpd,NTP daemon status input,ntpd,))
$(eval $(call BuildPlugin,nut,UPS monitoring input,nut,@BROKEN))
$(eval $(call BuildPlugin,ping,ping status input,ping,+liboping))
$(eval $(call BuildPlugin,powerdns,PowerDNS server status input,powerdns,))
$(eval $(call BuildPlugin,processes,process status input,processes,))
$(eval $(call BuildPlugin,rrdtool,RRDtool output,rrdtool,+librrd1))
$(eval $(call BuildPlugin,sensors,lm_sensors input,sensors,+libsensors @BROKEN))
$(eval $(call BuildPlugin,snmp,SNMP input,snmp,+libnetsnmp))
$(eval $(call BuildPlugin,syslog,syslog output,syslog,))
$(eval $(call BuildPlugin,tail,tail input,tail,))
$(eval $(call BuildPlugin,teamspeak2,TeamSpeak2 input,teamspeak2,))
$(eval $(call BuildPlugin,tcpconns,TCP connection tracking input,tcpconns,))
$(eval $(call BuildPlugin,unixsock,unix socket output,unixsock,))
$(eval $(call BuildPlugin,users,user logged in status input,users,))
$(eval $(call BuildPlugin,vmem,virtual memory usage input,vmem,))
$(eval $(call BuildPlugin,wireless,wireless status input,wireless,))
