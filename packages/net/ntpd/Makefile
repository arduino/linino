#
# Copyright (C) 2006 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
# $Id: Makefile 5624 2006-11-23 00:29:07Z nbd $

include $(TOPDIR)/rules.mk

PKG_NAME:=ntp
PKG_VERSION:=4.2.4
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=http://www.eecis.udel.edu/~ntp/ntp_spool/ntp4/
PKG_MD5SUM:=eb9147d26cbe18bd8fbec07f1df55aef
PKG_CAT:=zcat

PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)-$(PKG_VERSION)

include $(INCLUDE_DIR)/package.mk

define Package/ntpd
  SECTION:=net
  CATEGORY:=Network
  TITLE:=full featured NTP server
  DEPENDS:=+libreadline
  DESCRIPTION:=\
	The full featured original ntpd
  URL:=http://www.ntp.org/
endef

define Package/ntpd/conffiles
/etc/ntp.conf
endef

define Build/Configure
	$(call Build/Configure/Default, \
                --disable-all-clocks \
		--disable-parse-clocks \
                --enable-NMEA \
		--enable-LOCAL-CLOCK \
                --enable-SHM \
		--enable-linuxcaps \
	)
endef

define Build/Compile
	$(MAKE) -C $(PKG_BUILD_DIR) \
		CFLAGS="$(TARGET_CFLAGS)"
endef

define Package/ntpd/install	
	$(INSTALL_DIR) $(1)/usr/sbin/
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/ntpd/ntpd $(1)/usr/sbin/
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/ntpdate/ntpdate $(1)/usr/sbin/
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/ntpdc/ntpdc $(1)/usr/sbin/
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/ntpq/ntpq $(1)/usr/sbin/
	$(INSTALL_DIR) $(1)/etc
	$(INSTALL_DATA) ./files/ntp.conf $(1)/etc/
	$(INSTALL_DIR) $(1)/etc/init.d
	$(INSTALL_DATA) ./files/ntpd.init $(1)/etc/init.d/ntpd
	$(INSTALL_DIR) $(1)/etc/hotplug.d/iface
	$(INSTALL_DATA) ./files/ntpd.hotplug $(1)/etc/hotplug.d/iface/20-ntpd
endef

$(eval $(call BuildPackage,ntpd))
