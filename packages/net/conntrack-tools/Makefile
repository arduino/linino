#
# Copyright (C) 2009 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
# $Id$

include $(TOPDIR)/rules.mk

PKG_NAME:=conntrack-tools
PKG_VERSION:=0.9.10
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.bz2
PKG_SOURCE_URL:=http://www.netfilter.org/projects/conntrack-tools/files/
PKG_MD5SUM:=cd46ed2d5cd4797add0cd444a209c1e7

PKG_FIXUP:=libtool

include $(INCLUDE_DIR)/package.mk

define Package/conntrack-tools
  SECTION:=net
  CATEGORY:=Network
  DEPENDS:=+libnetfilter-conntrack
  TITLE:=Connection tracking userspace tools
  URL:=http://conntrack-tools.netfilter.org/
endef

define Package/conntrack-tools/description
 The conntrack-tools are a set of free software userspace tools for Linux 
 that allow system administrators interact with the Connection Tracking 
 System, which is the module that provides stateful packet inspection for 
 iptables. The conntrack-tools are the userspace daemon conntrackd and the 
 command line interface conntrack.
endef

define Package/conntrack-tools/conffiles
/etc/conntrackd/conntrackd.conf
endef


# uses GNU configure

define Build/Compile	
	$(MAKE) -C $(PKG_BUILD_DIR) \
		DESTDIR="$(PKG_INSTALL_DIR)" \
		all install
endef

define Package/conntrack-tools/install	
	$(INSTALL_DIR) $(1)/etc/conntrackd
	$(CP) \
		$(PKG_BUILD_DIR)/doc/stats/conntrackd.conf \
		$(1)/etc/conntrackd
	$(INSTALL_DIR) $(1)/usr/sbin
	$(CP) \
		$(PKG_INSTALL_DIR)/usr/sbin/conntrack \
		$(PKG_INSTALL_DIR)/usr/sbin/conntrackd \
		$(1)/usr/sbin/
endef

$(eval $(call BuildPackage,conntrack-tools))
