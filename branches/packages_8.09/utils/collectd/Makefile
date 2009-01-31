#
# Copyright (C) 2006 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
# $Id$

include $(TOPDIR)/rules.mk

PKG_NAME:=collectd
PKG_VERSION:=4.4.4
PKG_RELEASE:=2

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.bz2
PKG_SOURCE_URL:=http://collectd.org/files/
PKG_MD5SUM:=9e0e89150b1ff28fc0fdd8a198c9ac5e

PKG_FIXUP=libtool
PKG_BUILD_DEPENDS:=+libxml2 +libnetsnmp +libcurl +librrd1

include $(INCLUDE_DIR)/package.mk
include $(INCLUDE_DIR)/kernel.mk

define Package/collectd/common_info
  SECTION:=utils
  CATEGORY:=Utilities
  TITLE:=Lightweight system statistics collection daemon
  URL:=http://verplant.org/collectd/
endef

define Package/collectd/description
	collectd is a small daemon which collects system information periodically 
	and provides mechanismns to store the values in a variety of ways.
endef

define Package/collectd
        $(call Package/collectd/common_info)
        DEPENDS:=+libgcc +libpthread
        MENU:=1
endef


#
# output plugins
#
define Package/collectd-mod-csv
        $(call Package/collectd/common_info)
        TITLE:=collectd - csv output plugin
        DEPENDS:=collectd
endef

define Package/collectd-mod-email
        $(call Package/collectd/common_info)
        TITLE:=collectd - email output plugin
        DEPENDS:=collectd
endef

define Package/collectd-mod-logfile
        $(call Package/collectd/common_info)
        TITLE:=collectd - logfile output plugin
        DEPENDS:=collectd
endef

define Package/collectd-mod-network
        $(call Package/collectd/common_info)
        TITLE:=collectd - network input/output plugin
        DEPENDS:=collectd
endef

define Package/collectd-mod-syslog
        $(call Package/collectd/common_info)
        TITLE:=collectd - syslog output plugin
        DEPENDS:=collectd
endef

define Package/collectd-mod-unixsock
        $(call Package/collectd/common_info)
        TITLE:=collectd - unix socket output plugin
        DEPENDS:=collectd
endef


#
# input plugins
#
define Package/collectd-mod-apache
        $(call Package/collectd/common_info)
        TITLE:=collectd - apache status input plugin
        DEPENDS:=collectd +libcurl
endef

define Package/collectd-mod-apcups
        $(call Package/collectd/common_info)
        TITLE:=collectd - apcups status input plugin
        DEPENDS:=collectd
endef

define Package/collectd-mod-ascent
        $(call Package/collectd/common_info)
        TITLE:=collectd - ascent status input plugin
        DEPENDS:=collectd +libcurl +libxml2
endef

define Package/collectd-mod-cpu
        $(call Package/collectd/common_info)
        TITLE:=collectd - cpu input plugin
        DEPENDS:=collectd
endef

define Package/collectd-mod-df
        $(call Package/collectd/common_info)
        TITLE:=collectd - disk space input plugin
        DEPENDS:=collectd
endef

define Package/collectd-mod-disk
        $(call Package/collectd/common_info)
        TITLE:=collectd - disk usage/timing input plugin
        DEPENDS:=collectd
endef

define Package/collectd-mod-dns
        $(call Package/collectd/common_info)
        TITLE:=collectd - dns traffic input plugin
        DEPENDS:=collectd +libpcap
endef

define Package/collectd-mod-exec
        $(call Package/collectd/common_info)
        TITLE:=collectd - process exec input plugin
        DEPENDS:=collectd
endef

define Package/collectd-mod-interface
        $(call Package/collectd/common_info)
        TITLE:=collectd - network interfaces input plugin
        DEPENDS:=collectd
endef

define Package/collectd-mod-iptables
        $(call Package/collectd/common_info)
        TITLE:=collectd - iptables status input plugin
        DEPENDS:=collectd +iptables
endef

define Package/collectd-mod-irq
        $(call Package/collectd/common_info)
        TITLE:=collectd - interrupt usage input plugin
        DEPENDS:=collectd
endef

define Package/collectd-mod-load
        $(call Package/collectd/common_info)
        TITLE:=collectd - system load input plugin
        DEPENDS:=collectd
endef

define Package/collectd-mod-netlink
        $(call Package/collectd/common_info)
        TITLE:=collectd - netlink input plugin (uses iproute2)
        DEPENDS:=collectd +ip
endef

define Package/collectd-mod-nginx
        $(call Package/collectd/common_info)
        TITLE:=collectd - nginx status input plugin
        DEPENDS:=collectd +libcurl
endef

define Package/collectd-mod-ntpd
        $(call Package/collectd/common_info)
        TITLE:=collectd - ntp daemon status input plugin
        DEPENDS:=collectd
endef

define Package/collectd-mod-nut
        $(call Package/collectd/common_info)
        TITLE:=collectd - UPS monitoring input plugin
        DEPENDS:=collectd @BROKEN
endef

define Package/collectd-mod-ping
        $(call Package/collectd/common_info)
        TITLE:=collectd - ping status input plugin
        DEPENDS:=collectd
endef

define Package/collectd-mod-powerdns
        $(call Package/collectd/common_info)
        TITLE:=collectd - powerdns server status input plugin
        DEPENDS:=collectd
endef

define Package/collectd-mod-processes
        $(call Package/collectd/common_info)
        TITLE:=collectd - process status plugin
        DEPENDS:=collectd
endef


define Package/collectd-mod-rrdtool1
        $(call Package/collectd/common_info)
        TITLE:=collectd - rrdtool 1.0.x output plugin
        DEPENDS:=collectd +librrd1
endef

define Package/collectd-mod-sensors
        $(call Package/collectd/common_info)
        TITLE:=collectd - lm_sensors input plugin
        DEPENDS:=collectd +libsensors @BROKEN
endef

define Package/collectd-mod-snmp
        $(call Package/collectd/common_info)
        TITLE:=collectd - snmp input plugin
        DEPENDS:=collectd +libnetsnmp
endef

define Package/collectd-mod-tail
        $(call Package/collectd/common_info)
        TITLE:=collectd - tail input plugin
        DEPENDS:=collectd
endef

define Package/collectd-mod-teamspeak2
        $(call Package/collectd/common_info)
        TITLE:=collectd - teamspeak2 input plugin
        DEPENDS:=collectd
endef

define Package/collectd-mod-tcpconns
        $(call Package/collectd/common_info)
        TITLE:=collectd - tcp connection tracking input plugin
        DEPENDS:=collectd
endef

define Package/collectd-mod-users
        $(call Package/collectd/common_info)
        TITLE:=collectd - user login status input plugin
        DEPENDS:=collectd
endef

define Package/collectd-mod-vmem
        $(call Package/collectd/common_info)
        TITLE:=collectd - virtual memory usage input plugin
        DEPENDS:=collectd
endef

define Package/collectd-mod-wireless
        $(call Package/collectd/common_info)
        TITLE:=collectd - wireless status input plugin
        DEPENDS:=collectd
endef


define Package/collectd/conffiles 
/etc/collectd.conf 
endef

define Build/Configure
endef

define Build/Compile
	-$(MAKE) -C $(PKG_BUILD_DIR) clean
	$(call Build/Configure/Default, $(PKG_CONFIGURE_OPTS))
	$(call Build/Compile/Default)
endef


#
# Build PKG_CONFIGURE_OPTS
#

# common configure args
PKG_CONFIGURE_OPTS:= \
	--disable-debug \
	--enable-daemon \
	--enable-getifaddrs \
	--with-nan-emulation \
	--with-fp-layout=nothing

CONFIGURE_VARS+= \
	CPPFLAGS="-I$(STAGING_DIR)/usr/include/libxml2 $$$$CPPFLAGS $(FPIC)" \
	KERNEL_DIR="$(LINUX_DIR)"

# list of permanently disabled plugins
disabled_plugins := apple_sensors battery cpufreq entropy hddtemp ipmi ipvs libvirt mbmon memcached \
			multimeter mysql nfs perl serial swap tape uuid vserver xmms

# list of selectable plugins
selectable_plugins := apache apcups ascent cpu csv df disk dns email exec interface iptables irq load \
			logfile memory netlink network nginx ntpd nut ping powerdns processes sensors \
			snmp syslog tail tcpconns teamspeak2 unixsock users vmem wireless

# makro to enable / disable plugin
define enable_plugin
	ifneq ($$(CONFIG_PACKAGE_collectd-mod-$(1)),)
		PKG_CONFIGURE_OPTS += --enable-$(1)
	else
		PKG_CONFIGURE_OPTS += --disable-$(1)
	endif
endef

# build args for permanently disabled plugins
PKG_CONFIGURE_OPTS += $(foreach plugin,$(disabled_plugins),--disable-$(plugin))

# build args for selectable plugins
$(foreach plugin,$(selectable_plugins),$(eval $(call enable_plugin,$(plugin))))

# exception: mod-netlink needs iproute2
ifneq ($(CONFIG_PACKAGE_collectd-mod-netlink),)
	PKG_CONFIGURE_OPTS += --with-libnetlink=$(wildcard $(BUILD_DIR)/iproute2-*)
endif

# exception: mod-rrdtool(1) needs rrdtool
ifneq ($(CONFIG_PACKAGE_collectd-mod-rrdtool1),)
	PKG_CONFIGURE_OPTS += --with-rrdtool=$(wildcard $(BUILD_DIR)/rrdtool-1.0.*)
	TARGET_LDFLAGS := -L$(wildcard $(BUILD_DIR)/rrdtool-1.0.*)/src/.libs -lz $(TARGET_LDFLAGS)
endif


MAKE_FLAGS += \
	DESTDIR="$(PKG_INSTALL_DIR)" \
	all install

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

define Package/collectd-mod-apache/install
	$(INSTALL_DIR) $(1)/usr/lib/collectd
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/usr/lib/collectd/apache.so $(1)/usr/lib/collectd/
endef

define Package/collectd-mod-apcups/install
	$(INSTALL_DIR) $(1)/usr/lib/collectd
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/usr/lib/collectd/apcups.so $(1)/usr/lib/collectd/
endef

define Package/collectd-mod-ascent/install
	$(INSTALL_DIR) $(1)/usr/lib/collectd
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/usr/lib/collectd/ascent.so $(1)/usr/lib/collectd/
endef

define Package/collectd-mod-cpu/install
	$(INSTALL_DIR) $(1)/usr/lib/collectd
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/usr/lib/collectd/cpu.so $(1)/usr/lib/collectd/
endef

define Package/collectd-mod-csv/install
	$(INSTALL_DIR) $(1)/usr/lib/collectd
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/usr/lib/collectd/csv.so $(1)/usr/lib/collectd/
endef

define Package/collectd-mod-df/install
	$(INSTALL_DIR) $(1)/usr/lib/collectd
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/usr/lib/collectd/df.so $(1)/usr/lib/collectd/
endef

define Package/collectd-mod-disk/install
	$(INSTALL_DIR) $(1)/usr/lib/collectd
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/usr/lib/collectd/disk.so $(1)/usr/lib/collectd/
endef

define Package/collectd-mod-dns/install
	$(INSTALL_DIR) $(1)/usr/lib/collectd
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/usr/lib/collectd/dns.so $(1)/usr/lib/collectd/
endef

define Package/collectd-mod-email/install
	$(INSTALL_DIR) $(1)/usr/lib/collectd
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/usr/lib/collectd/email.so $(1)/usr/lib/collectd/
endef

define Package/collectd-mod-exec/install
	$(INSTALL_DIR) $(1)/usr/lib/collectd
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/usr/lib/collectd/exec.so $(1)/usr/lib/collectd/
endef

define Package/collectd-mod-interface/install
	$(INSTALL_DIR) $(1)/usr/lib/collectd
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/usr/lib/collectd/interface.so $(1)/usr/lib/collectd/
endef

define Package/collectd-mod-iptables/install
	$(INSTALL_DIR) $(1)/usr/lib/collectd
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/usr/lib/collectd/iptables.so $(1)/usr/lib/collectd/
endef

define Package/collectd-mod-irq/install
	$(INSTALL_DIR) $(1)/usr/lib/collectd
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/usr/lib/collectd/irq.so $(1)/usr/lib/collectd/
endef

define Package/collectd-mod-load/install
	$(INSTALL_DIR) $(1)/usr/lib/collectd
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/usr/lib/collectd/load.so $(1)/usr/lib/collectd/
endef

define Package/collectd-mod-logfile/install
	$(INSTALL_DIR) $(1)/usr/lib/collectd
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/usr/lib/collectd/logfile.so $(1)/usr/lib/collectd/
endef

define Package/collectd-mod-netlink/install
	$(INSTALL_DIR) $(1)/usr/lib/collectd
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/usr/lib/collectd/netlink.so $(1)/usr/lib/collectd/
endef

define Package/collectd-mod-network/install
	$(INSTALL_DIR) $(1)/usr/lib/collectd
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/usr/lib/collectd/network.so $(1)/usr/lib/collectd/
endef

define Package/collectd-mod-nginx/install
	$(INSTALL_DIR) $(1)/usr/lib/collectd
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/usr/lib/collectd/nginx.so $(1)/usr/lib/collectd/
endef

define Package/collectd-mod-ntpd/install
	$(INSTALL_DIR) $(1)/usr/lib/collectd
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/usr/lib/collectd/ntpd.so $(1)/usr/lib/collectd/
endef

define Package/collectd-mod-nut/install
	$(INSTALL_DIR) $(1)/usr/lib/collectd
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/usr/lib/collectd/nut.so $(1)/usr/lib/collectd/
endef

define Package/collectd-mod-ping/install
	$(INSTALL_DIR) $(1)/usr/lib/collectd
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/usr/lib/collectd/ping.so $(1)/usr/lib/collectd/
endef

define Package/collectd-mod-powerdns/install
	$(INSTALL_DIR) $(1)/usr/lib/collectd
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/usr/lib/collectd/powerdns.so $(1)/usr/lib/collectd/
endef

define Package/collectd-mod-processes/install
	$(INSTALL_DIR) $(1)/usr/lib/collectd
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/usr/lib/collectd/processes.so $(1)/usr/lib/collectd/
endef

define Package/collectd-mod-rrdtool1/install
	$(INSTALL_DIR) $(1)/usr/lib/collectd
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/usr/lib/collectd/rrdtool.so $(1)/usr/lib/collectd/
endef

define Package/collectd-mod-sensors/install
	$(INSTALL_DIR) $(1)/usr/lib/collectd
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/usr/lib/collectd/sensors.so $(1)/usr/lib/collectd/
endef

define Package/collectd-mod-snmp/install
	$(INSTALL_DIR) $(1)/usr/lib/collectd
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/usr/lib/collectd/snmp.so $(1)/usr/lib/collectd/
endef

define Package/collectd-mod-syslog/install
	$(INSTALL_DIR) $(1)/usr/lib/collectd
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/usr/lib/collectd/syslog.so $(1)/usr/lib/collectd/
endef

define Package/collectd-mod-tail/install
	$(INSTALL_DIR) $(1)/usr/lib/collectd
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/usr/lib/collectd/tail.so $(1)/usr/lib/collectd/
endef

define Package/collectd-mod-teamspeak2/install
	$(INSTALL_DIR) $(1)/usr/lib/collectd
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/usr/lib/collectd/teamspeak2.so $(1)/usr/lib/collectd/
endef

define Package/collectd-mod-tcpconns/install
	$(INSTALL_DIR) $(1)/usr/lib/collectd
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/usr/lib/collectd/tcpconns.so $(1)/usr/lib/collectd/
endef

define Package/collectd-mod-unixsock/install
	$(INSTALL_DIR) $(1)/usr/lib/collectd
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/usr/lib/collectd/unixsock.so $(1)/usr/lib/collectd/
endef

define Package/collectd-mod-users/install
	$(INSTALL_DIR) $(1)/usr/lib/collectd
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/usr/lib/collectd/users.so $(1)/usr/lib/collectd/
endef

define Package/collectd-mod-vmem/install
	$(INSTALL_DIR) $(1)/usr/lib/collectd
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/usr/lib/collectd/vmem.so $(1)/usr/lib/collectd/
endef

define Package/collectd-mod-wireless/install
	$(INSTALL_DIR) $(1)/usr/lib/collectd
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/usr/lib/collectd/wireless.so $(1)/usr/lib/collectd/
endef


$(eval $(call BuildPackage,collectd))
$(eval $(call BuildPackage,collectd-mod-apache))
$(eval $(call BuildPackage,collectd-mod-apcups))
$(eval $(call BuildPackage,collectd-mod-ascent))
$(eval $(call BuildPackage,collectd-mod-cpu))
$(eval $(call BuildPackage,collectd-mod-csv))
$(eval $(call BuildPackage,collectd-mod-df))
$(eval $(call BuildPackage,collectd-mod-disk))
$(eval $(call BuildPackage,collectd-mod-dns))
$(eval $(call BuildPackage,collectd-mod-email))
$(eval $(call BuildPackage,collectd-mod-exec))
$(eval $(call BuildPackage,collectd-mod-interface))
$(eval $(call BuildPackage,collectd-mod-iptables))
$(eval $(call BuildPackage,collectd-mod-irq))
$(eval $(call BuildPackage,collectd-mod-load))
$(eval $(call BuildPackage,collectd-mod-logfile))
$(eval $(call BuildPackage,collectd-mod-netlink))
$(eval $(call BuildPackage,collectd-mod-network))
$(eval $(call BuildPackage,collectd-mod-nginx))
$(eval $(call BuildPackage,collectd-mod-ntpd))
$(eval $(call BuildPackage,collectd-mod-nut))
$(eval $(call BuildPackage,collectd-mod-ping))
$(eval $(call BuildPackage,collectd-mod-powerdns))
$(eval $(call BuildPackage,collectd-mod-processes))
$(eval $(call BuildPackage,collectd-mod-rrdtool1))
$(eval $(call BuildPackage,collectd-mod-sensors))
$(eval $(call BuildPackage,collectd-mod-snmp))
$(eval $(call BuildPackage,collectd-mod-syslog))
$(eval $(call BuildPackage,collectd-mod-tail))
$(eval $(call BuildPackage,collectd-mod-teamspeak2))
$(eval $(call BuildPackage,collectd-mod-tcpconns))
$(eval $(call BuildPackage,collectd-mod-unixsock))
$(eval $(call BuildPackage,collectd-mod-users))
$(eval $(call BuildPackage,collectd-mod-vmem))
$(eval $(call BuildPackage,collectd-mod-wireless))
