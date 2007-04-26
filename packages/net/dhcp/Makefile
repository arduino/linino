#
# Copyright (C) 2006 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
# $Id$

include $(TOPDIR)/rules.mk

PKG_NAME:=dhcp
PKG_VERSION:=3.0.5
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=ftp://ftp.isc.org/isc/dhcp/
PKG_MD5SUM:=ce5d30d4645e4eab1f54561b487d1ec7
PKG_CAT:=zcat

PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)-$(PKG_VERSION)
PKG_INSTALL_DIR:=$(PKG_BUILD_DIR)/ipkg-install

include $(INCLUDE_DIR)/package.mk

define Package/dhcp/Default
  SECTION:=net
  CATEGORY:=Network
  TITLE:=ISC's DHCP
  URL:=http://www.isc.org/
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
		UNAME_R=2.4.34 \
		./configure \
			--copts "$(TARGET_CFLAGS)" \
			linux-2.2 \
	);
endef

define Build/Compile
	UNAME_S=Linux \
	UNAME_M=$(ARCH) \
	UNAME_R=2.4.34 \
	$(MAKE) -C $(PKG_BUILD_DIR) \
		$(TARGET_CONFIGURE_OPTS) \
		DESTDIR="$(PKG_INSTALL_DIR)" \
		all install
endef

	
define Package/dhcp-relay/install
	$(INSTALL_DIR) $(1)/usr/sbin
	$(CP) $(PKG_INSTALL_DIR)/usr/sbin/dhcrelay $(1)/usr/sbin/
endef

define Package/dhcp-server/install
	$(INSTALL_DIR) $(1)/usr/sbin
	$(CP) $(PKG_INSTALL_DIR)/usr/sbin/dhcpd $(1)/usr/sbin/
endef

$(eval $(call BuildPackage,dhcp-relay))
$(eval $(call BuildPackage,dhcp-server))
