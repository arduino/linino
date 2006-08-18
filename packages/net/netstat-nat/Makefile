#
# Copyright (C) 2006 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
# $Id$

include $(TOPDIR)/rules.mk

PKG_NAME:=netstat-nat
PKG_VERSION:=1.4.6
PKG_RELEASE:=1
PKG_MD5SUM:=ccf71a6cbd9a513ea3adec54b54ee770

PKG_SOURCE_URL:=http://tweegy.demon.nl/download/
PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_CAT:=zcat

PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)-$(PKG_VERSION)
PKG_INSTALL_DIR:=$(PKG_BUILD_DIR)/ipkg-install

include $(INCLUDE_DIR)/package.mk

define Package/netstat-nat
  SECTION:=net
  CATEGORY:=Network
  TITLE:=A netstat variant for NAT connections
  DESCRIPTION:=Netstat-nat is a small program written in C.\\\
	It displays NAT connections, managed by netfilter/iptables which comes\\\
	with the > 2.4.x linux kernels.\\\
	The program reads its information from '/proc/net/ip_conntrack', which\\\
	is the temporary conntrack-storage of netfilter.\\\
  URL:=http://tweegy.demon.nl/projects/netstat-nat/
endef

define Build/Compile	
	rm -rf $(PKG_INSTALL_DIR)
	mkdir -p $(PKG_INSTALL_DIR)
	$(MAKE) -C $(PKG_BUILD_DIR) \
	  $(TARGET_CONFIGURE_OPTS) \
	  DESTDIR="$(PKG_INSTALL_DIR)" \
	  all install
endef

define Package/netstat-nat/install	
	install -d -m0755 $(1)/usr/bin
	$(CP) $(PKG_INSTALL_DIR)/usr/bin/netstat-nat $(1)/usr/bin/
endef

$(eval $(call BuildPackage,netstat-nat))
