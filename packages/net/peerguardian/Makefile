# Copyright (C) 2006 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
# $Id$

include $(TOPDIR)/rules.mk

PKG_NAME:=peerguardian
PKG_VERSION:=1.5beta
PKG_RELEASE:=1
PKG_MD5SUM:=0fb2bc5501b031604fc56eec3bd35fa4

PKG_SOURCE_URL:=@SF/peerguardian
PKG_SOURCE:=pglinux-$(PKG_VERSION).tar.gz
PKG_BUILD_DIR:=$(BUILD_DIR)/pglinux-$(PKG_VERSION)
PKG_CAT:=zcat
PKG_INSTALL_DIR:=$(PKG_BUILD_DIR)/ipkg-install

include $(INCLUDE_DIR)/package.mk

define Package/peerguardian
  SECTION:=net
  CATEGORY:=Network
  DEPENDS:=@BROKEN +libpthread +libncurses +iptables
  TITLE:=PeerGuardian for Linux
  DESCRIPTION:=PeerGuardian helps protect your privacy by blocking many ranges\\\
	of aggressive IPs while you use P2P.\\\
  URL:=http://phoenixlabs.org/
endef

define Package/peerguardian/conffiles
/etc/PG.conf
/etc/p2p.p2b.p2p
endef

define Package/peerguardian/install
	install -d -m0755 $(1)/usr/sbin $(1)/etc/init.d
	install -m0755 $(PKG_BUILD_DIR)/peerguardnf $(1)/usr/sbin/
	install -m0755 $(PKG_BUILD_DIR)/pgtext $(1)/usr/sbin/
	install -m0644 $(PKG_BUILD_DIR)/PG.conf $(1)/etc/
	install -m0644 $(PKG_BUILD_DIR)/p2p.p2b.p2p $(1)/etc/
	install -m0644 files/peerguardian.init $(1)/etc/init.d/peerguardian
endef

$(eval $(call BuildPackage,peerguardian))
