# Copyright (C) 2006 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
# $Id$

include $(TOPDIR)/rules.mk

PKG_NAME:=l2tpd
PKG_VERSION:=0.70pre
PKG_UPSTREAM_VERSION:=0.70-pre20031121
PKG_RELEASE:=4.1
PKG_MD5SUM:=3f2707b6e16a8cb72e7bf64f574202fa

PKG_SOURCE_URL:=http://ftp.debian.org/debian/pool/main/l/l2tpd
PKG_SOURCE:=$(PKG_NAME)_$(PKG_UPSTREAM_VERSION).orig.tar.gz
PKG_CAT:=zcat

PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)-$(PKG_UPSTREAM_VERSION).orig
PKG_INSTALL_DIR:=$(PKG_BUILD_DIR)/ipkg-install

include $(INCLUDE_DIR)/package.mk

define Package/l2tpd
  SECTION:=net
  CATEGORY:=Network
  TITLE:=An L2TP (Layer 2 Tunneling Protocol) daemon
  DESCRIPTION:=A layer 2 tunneling protocol implementation.\\\
l2tpd is the open source implementation of the L2TP tunneling\\\
protocol (RFC2661). It does implement both LAC and LNS role\\\
in a L2TP networking architecture. The main goal of this protocol is\\\
to tunnel PPP frame trough an ip network.\\\
  URL:=http://l2tpd.sourceforge.net/
endef

define Package/l2tpd/conffiles
/etc/l2tpd/l2tpd.conf
/etc/ppp/options.l2tpd
endef

define Build/Compile
  $(call Build/Compile/Default,CFLAGS="$(TARGET_CFLAGS) -I. -DLINUX -DSANITY -DIP_ALLOCATION")
endef

define Package/l2tpd/install	
	install -d -m0755 $(1)/etc/l2tpd
	install -m0644 ./files/l2tpd.conf $(1)/etc/l2tpd/
	install -d -m0755 $(1)/etc/ppp
	install -m0644 ./files/options.l2tpd $(1)/etc/ppp/
	install -d -m0755 $(1)/etc/init.d
	install -m0755 ./files/l2tpd.init $(1)/etc/init.d/l2tpd
	install -d -m0755 $(1)/usr/sbin
	install -m0755 $(PKG_BUILD_DIR)/$(PKG_NAME) $(1)/usr/sbin/
endef

$(eval $(call BuildPackage,l2tpd))

