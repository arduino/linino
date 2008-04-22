#
# Copyright (C) 2006-2008 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
# $Id$

include $(TOPDIR)/rules.mk

PKG_NAME:=ntp
PKG_VERSION:=4.2.4p4
PKG_RELEASE:=3

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=http://www.eecis.udel.edu/~ntp/ntp_spool/ntp4/
PKG_MD5SUM:=fcb32a01e1ae3f9ed5bac86b12c7a1cc

PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)-$(PKG_VERSION)
PKG_BUILD_DEPENDS:=libelf

include $(INCLUDE_DIR)/package.mk

define Package/ntpd/Default
  SUBMENU:=Time Synchronization
  SECTION:=net
  CATEGORY:=Network
  TITLE:=ISC ntp
  URL:=http://www.ntp.org/
endef

define Package/ntpd/Default/description
	The ISC ntp suite is a collection of tools used to synchronize
	the system clock with remote NTP time servers and run/montior
	local NTP servers.
endef

define Package/ntpd
  $(call Package/ntpd/Default)
  DEPENDS:=+ntpdate
  TITLE+= server
endef

define Package/ntpd/description
	$(call Package/ntpd/Default/description)
	This package contains the ntpd server.
endef

define Package/ntpdate
  $(call Package/ntpd/Default)
  TITLE+=date
endef

define Package/ntpdate/description
	$(call Package/ntpd/Default/description)
	This package contains ntpdate.
endef

define Package/ntp-utils
  $(call Package/ntpd/Default)
  DEPENDS:=+libreadline +libncurses
  TITLE+= utilities
endef

define Package/ntp-utils/description
	$(call Package/ntpd/Default/description)
	This package contains ntpdc and ntpq.
endef

define Package/ntpd/conffiles
/etc/ntp.conf
endef

define Package/ntpd/postinst
#!/bin/sh
echo "ntp             123/udp     # Network Time Protocol
ntp             123/tcp     # Network Time Protocol" >> $${IPKG_INSTROOT}/etc/services
endef

TARGET_CPPFLAGS += -I$(STAGING_DIR)/usr/include/libelf

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
	$(INSTALL_DIR) $(1)/etc
	$(INSTALL_DATA) ./files/ntp.conf $(1)/etc/
	$(INSTALL_DIR) $(1)/etc/init.d
	$(INSTALL_BIN) ./files/ntpd.init $(1)/etc/init.d/ntpd
	$(INSTALL_DIR) $(1)/etc/hotplug.d/iface
	$(INSTALL_BIN) ./files/ntpd.hotplug $(1)/etc/hotplug.d/iface/20-ntpd
endef

define Package/ntpdate/install
	$(INSTALL_DIR) $(1)/usr/sbin/
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/ntpdate/ntpdate $(1)/usr/sbin/
endef

define Package/ntp-utils/install
	$(INSTALL_DIR) $(1)/usr/sbin/
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/ntpdc/ntpdc $(1)/usr/sbin/
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/ntpq/ntpq $(1)/usr/sbin/
endef

$(eval $(call BuildPackage,ntpd))
$(eval $(call BuildPackage,ntpdate))
$(eval $(call BuildPackage,ntp-utils))
