#
# Copyright (C) 2006 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
# $Id$

include $(TOPDIR)/rules.mk

PKG_NAME:=dhcp
PKG_VERSION:=3.0.3
PKG_RELEASE:=1
PKG_MD5SUM:=f91416a0b8ed3fd0601688cf0b7df58f

PKG_SOURCE_URL:=ftp://ftp.isc.org/isc/dhcp/
PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_CAT:=zcat

PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)-$(PKG_VERSION)
PKG_INSTALL_DIR:=$(PKG_BUILD_DIR)/ipkg-install

include $(INCLUDE_DIR)/package.mk

define Package/dhcp
  SECTION:=net
  CATEGORY:=Network
  SUBMENU:=ISC's DHCP implementation
  TITLE:=ISC's DHCP implementation
  DESCRIPTION:=ISC's DHCP implementation
  URL:=http://www.isc.org
endef

define Package/dhcp-relay
  $(call Package/dhcp)
  TITLE:=DHCP relay
  DESCRIPTION:=DHCP relay
endef

define Package/dhcp-server
  $(call Package/dhcp)
  TITLE:=DHCP server
  DESCRIPTION:=DHCP server
endef


define Build/Configure
	(cd $(PKG_BUILD_DIR) ; \
		./configure \
		  --copts "$(TARGET_CFLAGS)" \
		  linux-2.2 \
	);
endef

define Build/Compile
	rm -rf $(PKG_INSTALL_DIR)
	mkdir -p $(PKG_INSTALL_DIR)
	$(MAKE) -C $(PKG_BUILD_DIR) \
		$(TARGET_CONFIGURE_OPTS) \
		DESTDIR="$(PKG_INSTALL_DIR)" \
		all install
endef

	
define Package/dhcp-relay/install
	install -d -m0755 $(1)/usr/sbin
	$(CP) $(PKG_INSTALL_DIR)/usr/sbin/dhcrelay $(1)/usr/sbin/
endef

define Package/dhcp-server/install
	install -d -m0755 $(1)/usr/sbin
	$(CP) $(PKG_INSTALL_DIR)/usr/sbin/dhcpd $(1)/usr/sbin/
endef

$(eval $(call BuildPackage,dhcp-relay))
$(eval $(call BuildPackage,dhcp-server))
