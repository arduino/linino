#
# Copyright (C) 2006 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
# $Id: Makefile 5624 2006-11-23 00:29:07Z nbd $

include $(TOPDIR)/rules.mk

PKG_NAME:=xl2tpd
PKG_VERSION:=1.1.09
PKG_RELEASE:=1.0

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=http://www.xelerance.com/software/xl2tpd
PKG_CAT:=zcat

PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)-$(PKG_VERSION)
PKG_INSTALL_DIR:=$(PKG_BUILD_DIR)/ipkg-install

include $(INCLUDE_DIR)/package.mk

define Package/xl2tpd
  SECTION:=net
  CATEGORY:=Network
  TITLE:=An L2TP (Layer 2 Tunneling Protocol) daemon
  DESCRIPTION:=\
	l2tpd is the open source implementation of the L2TP tunneling \\\
	protocol (RFC2661). It does implement both LAC and LNS role \\\
	in a L2TP networking architecture. The main goal of this protocol is \\\
	to tunnel PPP frame trough an ip network.
  URL:=http://www.xelerance.com/software/xl2tpd
endef

define Package/xl2tpd/conffiles
/etc/xl2tpd/xl2tpd.conf
endef

define Build/Compile
	$(call Build/Compile/Default, \
		CFLAGS="$(TARGET_CFLAGS) -I. -DLINUX -DSANITY -DIP_ALLOCATION" \
	)
endef

define Package/xl2tpd/install	
	$(INSTALL_DIR) $(1)/usr/sbin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/$(PKG_NAME) $(1)/usr/sbin/
	$(INSTALL_DIR) $(1)/etc/xl2tpd
	$(INSTALL_DATA) ./files/xl2tpd.conf $(1)/etc/xl2tpd/
	$(INSTALL_DATA) ./files/l2tp-secrets $(1)/etc/xl2tpd/
	$(INSTALL_DATA) ./files/options.l2tp $(1)/etc/xl2tpd/
#	$(INSTALL_DIR) $(1)/etc/ppp
#	$(INSTALL_DATA) ./files/options.l2tpd $(1)/etc/ppp/
	$(INSTALL_DIR) $(1)/etc/init.d
	$(INSTALL_BIN) ./files/xl2tpd.init $(1)/etc/init.d/xl2tpd
endef

$(eval $(call BuildPackage,xl2tpd))

