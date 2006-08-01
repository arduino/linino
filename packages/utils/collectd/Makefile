# Copyright (C) 2006 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
# $Id$

include $(TOPDIR)/rules.mk

PKG_NAME:=collectd
PKG_VERSION:=3.5.1
PKG_RELEASE:=1
PKG_MD5SUM:=46a4b81e46d3bb58faab1d603649d737

PKG_SOURCE_URL:=http://verplant.org/collectd/files
PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_CAT:=zcat

PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)-$(PKG_VERSION)
PKG_INSTALL_DIR:=$(PKG_BUILD_DIR)/ipkg-install

include $(INCLUDE_DIR)/package.mk

define Package/collectd
  SECTION:=utils
  CATEGORY:=Utilities
  TITLE:=Lightweight system statistics collection daemon
  DESCRIPTION:=Lightweight system statistics collection daemon
  URL:=http://verplant.org/collectd/
endef

define Build/Compile
$(call Build/Configure/Default,--enable-shared \
--disable-static \
--disable-debug \
--enable-cpu \
--enable-load \
--enable-memory \
--enable-ping \
--enable-traffic \
--disable-cpufreq \
--disable-disk \
--disable-hddtemp \
--disable-nfs \
--disable-processes \
--disable-sensors \
--disable-serial \
--disable-swap \
--disable-tape \
--disable-users \
)
endef

define Build/Compile
	$(MAKE) -C $(PKG_BUILD_DIR)
	mkdir -p $(PKG_INSTALL_DIR)
	$(MAKE) -C $(PKG_BUILD_DIR) \
		DESTDIR="$(PKG_INSTALL_DIR)" \
		install
endef

define Package/collectd/install
	install -d -m0755 $(1)/etc/init.d
	install -d -m0755 $(1)/usr/sbin
	install -d -m0755 $(1)/usr/lib/collectd
	install -d -m0755 $(1)/var/lib/collectd
	install -d -m0755 $(1)/var/run
	install -m0755 ./files/S80collectd $(1)/etc/init.d/
	$(CP) $(PKG_INSTALL_DIR)/usr/sbin/collectd $(1)/usr/sbin/
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/collectd/*.so $(1)/usr/lib/collectd/
endef

$(eval $(call BuildPackage,collectd))
