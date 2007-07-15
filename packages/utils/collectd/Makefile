#
# Copyright (C) 2006 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
# $Id$

include $(TOPDIR)/rules.mk

PKG_NAME:=collectd
PKG_VERSION:=3.11.5
PKG_RELEASE:=2

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.bz2
PKG_SOURCE_URL:=http://verplant.org/collectd/files
PKG_MD5SUM:=7a3e47ccaed2eb1d03f91c82a1406e8d

PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)-$(PKG_VERSION)
PKG_INSTALL_DIR:=$(PKG_BUILD_DIR)/ipkg-install

include $(INCLUDE_DIR)/package.mk

define Package/collectd
  SECTION:=utils
  CATEGORY:=Utilities
  DEPENDS=+libgcc
  TITLE:=Lightweight system statistics collection daemon
  DESCRIPTION:=\
	collectd is a small daemon which collects system information periodically \\\
	and provides mechanismns to store the values in a variety of ways.
  URL:=http://verplant.org/collectd/
endef

define Package/collectd/conffiles 
/etc/collectd.conf 
endef

CONFIGURE_ARGS += \
	--disable-debug \
	--enable-daemon \
	--enable-getifaddrs \
	--disable-apache \
	--disable-apcups \
	--disable-apple_sensors \
	--disable-battery \
	--enable-cpu \
	--disable-cpufreq \
	--enable-disk \
	--enable-df \
	--disable-dns \
	--disable-email \
	--disable-quota \
	--disable-hddtemp \
	--enable-load \
	--disable-mbmon \
	--enable-memory \
	--disable-multimeter \
	--disable-mysql \
	--disable-nfs \
	--disable-ntpd \
	--enable-ping \
	--enable-processes \
	--disable-sensors \
	--enable-serial \
	--disable-swap \
	--disable-tape \
	--enable-traffic \
	--disable-users \
	--disable-vserver \
	--enable-wireless

MAKE_FLAGS += \
	DESTDIR="$(PKG_INSTALL_DIR)" \
	all install

define Package/collectd/install
	$(INSTALL_DIR) $(1)/usr/sbin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/usr/sbin/collectd $(1)/usr/sbin/
	$(INSTALL_DIR) $(1)/usr/lib/collectd
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/usr/lib/collectd/*.so $(1)/usr/lib/collectd/
	$(INSTALL_DIR) $(1)/etc
	$(INSTALL_CONF) ./files/collectd.conf $(1)/etc/
	$(INSTALL_DIR) $(1)/etc/init.d
	$(INSTALL_BIN) ./files/collectd.init $(1)/etc/init.d/collectd
endef

$(eval $(call BuildPackage,collectd))
