#
# Copyright (C) 2006-2011 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=dhcp
PKG_VERSION:=3.1.0
PKG_RELEASE:=4

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=ftp://ftp.isc.org/isc/dhcp/
PKG_MD5SUM:=27d179a3c3fbef576566b456a1168246

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

define Package/dhcp-server
  $(call Package/dhcp/Default)
  TITLE+= server
endef


define Build/Configure
	# it's not GNU autoconf stuff
	(cd $(PKG_BUILD_DIR) ; \
		UNAME_S=Linux \
		UNAME_M=$(ARCH) \
		UNAME_R=2.6.23 \
		./configure \
			--copts "$(TARGET_CFLAGS)" \
	);
endef

define Build/Compile
	UNAME_S=Linux \
	UNAME_M=$(ARCH) \
	UNAME_R=2.6.23 \
	$(MAKE) -C $(PKG_BUILD_DIR) \
		$(TARGET_CONFIGURE_OPTS) \
		DESTDIR="$(PKG_INSTALL_DIR)" \
		all install
endef


define Package/dhcp-relay/install
	$(INSTALL_DIR) $(1)/usr/sbin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/usr/sbin/dhcrelay $(1)/usr/sbin/
endef

define Package/dhcp-server/install
	$(INSTALL_DIR) $(1)/usr/sbin
	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_DIR) $(1)/usr/local/lib
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/usr/sbin/dhcpd $(1)/usr/sbin/
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/usr/bin/omshell $(1)/usr/bin/
	$(INSTALL_DIR) $(1)/etc/init.d
	$(INSTALL_BIN) ./files/dhcpd.init $(1)/etc/init.d/dhcpd
endef

$(eval $(call BuildPackage,dhcp-relay))
$(eval $(call BuildPackage,dhcp-server))
