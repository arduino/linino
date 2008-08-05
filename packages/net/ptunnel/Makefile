#
# Copyright (C) 2006 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
# $Id$

include $(TOPDIR)/rules.mk

PKG_NAME:=ptunnel
PKG_VERSION:=0.61
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=http://www.cti.ecp.fr/~beauxir5/ptunnel/
PKG_MD5SUM:=b45f73875f2af48f101816672f83a5fe

include $(INCLUDE_DIR)/package.mk

define Package/ptunnel
  SECTION:=net
  CATEGORY:=Network
  DEPENDS:=+libpthread +libpcap
  TITLE:=Tunnel TCP connections over ICMP packets
  URL:=http://www.cs.uit.no/~daniels/PingTunnel/
endef

define Package/ptunnel/description
	ptunnel is an application that allows you to reliably tunnel TCP connections to 
	a remote host using ICMP echo request and reply packets, commonly known as ping 
	requests and replies. It acts as a proxy and can handle sockets and secured 
	identification.
endef

# uses GNU configure

define Build/Compile	
	$(MAKE) -C $(PKG_BUILD_DIR) \
		DESTDIR="$(PKG_INSTALL_DIR)" \
		all install
endef

define Package/ptunnel/install	
	$(INSTALL_DIR) $(1)/usr/sbin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/usr/sbin/ptunnel $(1)/usr/sbin/
	$(INSTALL_DIR) $(1)/etc/init.d
	$(INSTALL_BIN) ./files/ptunnel.init $(1)/etc/init.d/ptunnel
	$(INSTALL_DIR) $(1)/etc/config
	$(INSTALL_DATA) ./files/ptunnel.conf $(1)/etc/config/ptunnel
endef

$(eval $(call BuildPackage,ptunnel))
