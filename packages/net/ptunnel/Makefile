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
PKG_CAT:=zcat

PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)-$(PKG_VERSION)
PKG_INSTALL_DIR:=$(PKG_BUILD_DIR)/ipkg-install

include $(INCLUDE_DIR)/package.mk

define Package/ptunnel
  SECTION:=net
  CATEGORY:=Network
  DEPENDS:=+libpthread +libpcap
  TITLE:=Tunnel TCP connections over ICMP packets
  DESCRIPTION:=\
	ptunnel is an application that allows you to reliably tunnel TCP connections to \\\
	a remote host using ICMP echo request and reply packets, commonly known as ping \\\
	requests and replies. It acts as a proxy and can handle sockets and secured \\\
	identification.
  URL:=http://www.cs.uit.no/~daniels/PingTunnel/
endef

# uses GNU configure

define Build/Compile	
	$(MAKE) -C $(PKG_BUILD_DIR) \
		DESTDIR="$(PKG_INSTALL_DIR)" \
		all install
endef

define Package/ptunnel/install	
	$(INSTALL_DIR) $(1)/usr/sbin
	$(CP) $(PKG_INSTALL_DIR)/usr/sbin/ptunnel $(1)/usr/sbin/
endef

$(eval $(call BuildPackage,ptunnel))
