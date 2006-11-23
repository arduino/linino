#
# Copyright (C) 2006 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
# $Id: $

include $(TOPDIR)/rules.mk

PKG_NAME:=lft
PKG_VERSION:=2.5
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=http://ftp.fredan.se/pub/gentoo.org/distfiles
PKG_MD5SUM:=5b0f45addbb371cc076fe6d9d9694546
PKG_CAT:=zcat

PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)-$(PKG_VERSION)

include $(INCLUDE_DIR)/package.mk

define Package/lft
  SECTION:=net
  CATEGORY:=Network
  DEPENDS:=+libpcap
  TITLE:=The alternative traceroute and whois tools for network engineers
  URL:=http://pwhois.org/lft
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
