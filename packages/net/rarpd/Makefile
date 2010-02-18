#
# Copyright (C) 2006 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=rarpd
PKG_VERSION:=1.1
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=ftp://ftp.dementia.org/pub/net-tools
PKG_MD5SUM:=04e2ca849e758d0b88c8281775ec3b58

PKG_INSTALL:=1

include $(INCLUDE_DIR)/package.mk

define Package/rarpd
  SECTION:=net
  CATEGORY:=Network
  DEPENDS:=+libnet0
  TITLE:=Reverse ARP Daemon
  URL:=ftp://ftp.dementia.org/pub/net-tools/
endef

define Package/rarpd/description
	Rarpd is a daemon which responds to RARP requests.
	RARP is used by some machines at boot time to discover their
	IP address. They provide their Ethernet address and rarpd
	responds with their IP address if it finds it in the ethers
	database.
endef

define Build/Configure
	$(call Build/Configure/Default, \
		--with-libnet="$(STAGING_DIR)/usr/lib/libnet-1.0.x" \
		--with-pcap="$(STAGING_DIR)/usr" \
		, \
		CFLAGS="$$$$CFLAGS -DNEW_LIBNET_INTERFACE" \
	)
endef

define Package/rarpd/install
	$(INSTALL_DIR) $(1)/usr/sbin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/usr/sbin/rarpd $(1)/usr/sbin/
	$(INSTALL_DIR) $(1)/etc/default
	install -m644 ./files/rarpd.default $(1)/etc/default/rarpd
	$(INSTALL_DIR) $(1)/etc/init.d
	install -m755 ./files/rarpd.init $(1)/etc/init.d/rarpd
endef

$(eval $(call BuildPackage,rarpd))
