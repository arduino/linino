#
# Copyright (C) 2006 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
# $Id$

include $(TOPDIR)/rules.mk

PKG_NAME:=rarpd
PKG_VERSION:=1.1
PKG_RELEASE:=1
PKG_MD5SUM:=04e2ca849e758d0b88c8281775ec3b58

PKG_SOURCE_URL:=ftp://ftp.dementia.org/pub/net-tools
PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_CAT:=zcat

PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)-$(PKG_VERSION)
PKG_INSTALL_DIR:=$(PKG_BUILD_DIR)/ipkg-install

# Hack Alert!
# The configure script for rarpd, when used with the --with-libnet option
# doesn't correctly detect and set -DNEW_LIBNET_INTERFACE.
EXTRA_CFLAGS = -DNEW_LIBNET_INTERFACE

include $(INCLUDE_DIR)/package.mk

define Package/rarpd
  SECTION:=net
  CATEGORY:=Network
  DEPENDS:=+libnet
  TITLE:=Reverse ARP Daemon
  DESCRIPTION:=Rarpd  is  a  daemon  which responds to RARP requests.\\\
	RARP is used by some machines at boot time to discover their\\\
	IP address.  They  provide their  Ethernet address and rarpd\\\
	responds with their IP address if it finds it in the ethers\\\
	database.\\\
  URL:=ftp://ftp.dementia.org/pub/net-tools/
endef

define Build/Configure
$(call Build/Configure/Default,--with-libnet="$(STAGING_DIR)/usr" \
			--with-pcap="$(STAGING_DIR)/usr",CFLAGS="$(TARGET_CFLAGS) $(EXTRA_CFLAGS)")
endef

define Build/Compile	
	rm -rf $(PKG_INSTALL_DIR)
	mkdir -p $(PKG_INSTALL_DIR)
	$(MAKE) -C $(PKG_BUILD_DIR) \
		$(TARGET_CONFIGURE_OPTS) \
		DESTDIR="$(PKG_INSTALL_DIR)" \
		all install
endef

define Package/rarpd/install	
	install -d -m0755 $(1)/usr/sbin
	$(CP) $(PKG_INSTALL_DIR)/usr/sbin/rarpd $(1)/usr/sbin/
	install -d -m0755 $(1)/etc/default
	install -m644 ./files/rarpd.default $(1)/etc/default/rarpd
	install -d -m0755 $(1)/etc/init.d
	install -m755 ./files/rarpd.init $(1)/etc/init.d/rarpd
	ln -sf rarpd $(1)/etc/init.d/S50rarpd
endef

$(eval $(call BuildPackage,rarpd))
