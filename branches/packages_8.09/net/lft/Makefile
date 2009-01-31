#
# Copyright (C) 2006 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
# $Id$

include $(TOPDIR)/rules.mk

PKG_NAME:=lft
PKG_VERSION:=3.1
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=http://pwhois.org/get
PKG_MD5SUM:=70e69706e7600f34c0dfb54e2ee5eb01

include $(INCLUDE_DIR)/package.mk

define Package/lft
  SECTION:=net
  CATEGORY:=Network
  DEPENDS:=+libpcap
  TITLE:=The alternative traceroute and whois tools for network engineers
  URL:=http://pwhois.org/lft
endef

define Package/lft/description
	LFT, short for Layer Four Traceroute, is a sort of 'traceroute' that
	often works much faster (than the commonly-used Van Jacobson method)
	and goes through many configurations of packet-filters (firewalls).
	More importantly, LFT implements numerous other features including AS
	number lookups through several reliable sources, loose source routing,
	netblock name lookups, et al.
endef

define Build/Configure	
	$(call Build/Configure/Default, \
		--with-pcap="$(STAGING_DIR)/usr" \
	)
endef

define Build/Compile	
	$(MAKE) -C $(PKG_BUILD_DIR)
endef

define Package/lft/install	
	$(INSTALL_DIR) $(1)/usr/sbin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/lft $(1)/usr/sbin/
endef

$(eval $(call BuildPackage,lft))
