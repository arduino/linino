# Copyright (C) 2006 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
# $Id: $

include $(TOPDIR)/rules.mk

PKG_NAME:=ipkungfu
PKG_VERSION:=0.6.0
PKG_RELEASE:=1

PKG_SOURCE_URL:=http://www.linuxkungfu.org/ipkungfu
PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_MD5SUM:=a65b5e629a7e9ef00aaf20587d918e5f
PKG_CAT:=zcat

PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)-$(PKG_VERSION)

include $(INCLUDE_DIR)/package.mk

define Package/ipkungfu
  SECTION:=net
  CATEGORY:=Network
  TITLE:=IPKungFu is an iptables-based Linux firewall
  DESCRIPTION:=\
  	IPKungFu is an iptables-based Linux firewall.\\\
  	It aims to simplify the configuration of Internet\\\
  	connection sharing, port forwarding, and packet filtering.
  URL:=http://www.linuxkungfu.org
endef

define Package/ipkungfu/conffiles
/etc/ipkungfu/accept_hosts.conf
/etc/ipkungfu/custom.conf
/etc/ipkungfu/forward.conf
/etc/ipkungfu/log.conf
/etc/ipkungfu/pre.conf
/etc/ipkungfu/services.conf
/etc/ipkungfu/advanced.conf
/etc/ipkungfu/deny_hosts.conf
/etc/ipkungfu/ipkungfu.conf
/etc/ipkungfu/post.conf
/etc/ipkungfu/redirect.conf
/etc/ipkungfu/vhosts.conf
endef

define Build/Configure
$(call Build/Configure/Default)
endef

define Build/Compile
$(call Build/Compile/Default,all)
endef

define Package/ipkungfu/install	
	mkdir -p $(1)/usr/sbin $(1)/etc/ipkungfu/
	$(CP) $(PKG_BUILD_DIR)/dummy_server $(1)/usr/sbin
	install -m0755 $(PKG_BUILD_DIR)/ipkungfu $(1)/usr/sbin/
	$(CP) $(PKG_BUILD_DIR)/files/conf/* $(1)/etc/ipkungfu/
endef

$(eval $(call BuildPackage,ipkungfu))
