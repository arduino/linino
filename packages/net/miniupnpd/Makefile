#
# Copyright (C) 2006-2009 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=miniupnpd
PKG_VERSION:=1.3
PKG_RELEASE:=1
PKG_MD5SUM:=b5e70e80dcf45b424b8fe3c966bdc613

PKG_SOURCE_URL:=http://miniupnp.free.fr/files
PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz

include $(INCLUDE_DIR)/package.mk

define Package/miniupnpd
  SECTION:=net
  CATEGORY:=Network
  DEPENDS:=+iptables
  TITLE:=Lightweight UPnP daemon
  URL:=http://miniupnp.tuxfamily.org/
endef

define Build/Compile
	ln -sf $(PKG_BUILD_DIR)/config.h.openwrt $(PKG_BUILD_DIR)/config.h
	$(MAKE) -C $(PKG_BUILD_DIR) -f Makefile.openwrt \
		$(TARGET_CONFIGURE_OPTS) \
		STAGING_DIR="$(STAGING_DIR)" \
		CFLAGS="$(TARGET_CFLAGS) -I $(STAGING_DIR)/usr/include -DIPTABLES_143" \
		LIBS="$(STAGING_DIR)/usr/lib/libiptc.so"
endef

define Package/miniupnpd/install
	$(INSTALL_DIR) $(1)/usr/bin $(1)/etc/init.d $(1)/etc/config $(1)/etc/hotplug.d/iface $(1)/lib/miniupnpd
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/miniupnpd $(1)/usr/bin/
	$(INSTALL_BIN) ./files/miniupnpd.init $(1)/etc/init.d/miniupnpd
	$(INSTALL_DATA) ./files/upnpd.config $(1)/etc/config/upnpd
	$(INSTALL_DATA) ./files/miniupnpd.hotplug $(1)/etc/hotplug.d/iface/20-miniupnpd
	$(INSTALL_DATA) ./files/miniupnpd.firewall $(1)/lib/miniupnpd/firewall.sh
endef

$(eval $(call BuildPackage,miniupnpd))
