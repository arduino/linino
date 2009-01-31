# 
# Copyright (C) 2006 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
# $Id: Makefile 9050 2007-09-28 01:23:17Z nbd $

include $(TOPDIR)/rules.mk

PKG_NAME:=iputils
PKG_VERSION:=20071127
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-s$(PKG_VERSION).tar.bz2
PKG_SOURCE_URL:=http://www.skbuff.net/iputils
PKG_MD5SUM:=12245e9927d60ff5cf4a99d265bcb7d3

PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)-s$(PKG_VERSION)

include $(INCLUDE_DIR)/package.mk



define Package/iputils-arping
  SECTION:=net
  CATEGORY:=Network
  TITLE:=iputils - arping
  URL:=http://www.skbuff.net/iputils
endef

define Package/iputils-arping/description
  Program arping from iputils.
  Sends ARP REQUEST to a neighbour host.
endef

define Package/iputils-clockdiff
  SECTION:=net
  CATEGORY:=Network
  TITLE:=iputils - clockdiff
  URL:=http://www.skbuff.net/iputils
endef

define Package/iputils-clockdiff/description
  Program clockdiff from iputils.
  Measures clock difference between hosts.
endef

define Package/iputils-ping
  SECTION:=net
  CATEGORY:=Network
  TITLE:=iputils - ping
  URL:=http://www.skbuff.net/iputils
endef

define Package/iputils-ping/description
  Program ping from iputils.
  Sends ICMP ECHO_REQUEST to network hosts (IPv4).
endef

define Package/iputils-ping6
  SECTION:=net
  CATEGORY:=Network
  TITLE:=iputils - ping6
  URL:=http://www.skbuff.net/iputils
endef

define Package/iputils-ping6/description
  Program ping6 from iputils.
  Sends ICMP ECHO_REQUEST to network hosts (IPv6).
endef

define Package/iputils-tftpd
  SECTION:=net
  CATEGORY:=Network
  TITLE:=iputils - tftpd
  URL:=http://www.skbuff.net/iputils
endef

define Package/iputils-tftpd/description
  Program tftpd from iputils
  Trivial File Transfer Protocol server.
endef

define Package/iputils-tracepath
  SECTION:=net
  CATEGORY:=Network
  TITLE:=iputils - tracepath
  URL:=http://www.skbuff.net/iputils
endef

define Package/iputils-tracepath/description
  Program tracepath from iputils.
  Traces path to a network host discovering MTU along this path (IPv4).
endef

define Package/iputils-tracepath6
  SECTION:=net
  CATEGORY:=Network
  TITLE:=iputils - tracepath6
  URL:=http://www.skbuff.net/iputils
endef

define Package/iputils-tracepath6/description
  Program tracepath6 from iputils.
  Traces path to a network host discovering MTU along this path (IPv6).
endef

define Package/iputils-traceroute6
  SECTION:=net
  CATEGORY:=Network
  TITLE:=iputils - traceroute6
  URL:=http://www.skbuff.net/iputils
endef

define Package/iputils-traceroute6/description
  Program traceroute6 from iputils.
  Traces path to a network host (IPv6).
endef

MAKE_FLAGS += \
	CFLAGS="$(TARGET_CFLAGS)"

define Package/iputils-arping/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/arping $(1)/usr/bin/
endef

define Package/iputils-clockdiff/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/clockdiff $(1)/usr/bin/
endef

define Package/iputils-ping/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/ping $(1)/usr/bin/
endef

define Package/iputils-ping6/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/ping6 $(1)/usr/bin/
endef

define Package/iputils-tftpd/install
	$(INSTALL_DIR) $(1)/usr/sbin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/tftpd $(1)/usr/sbin/
endef

define Package/iputils-tracepath/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/tracepath $(1)/usr/bin/
endef

define Package/iputils-tracepath6/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/tracepath6 $(1)/usr/bin/
endef

define Package/iputils-traceroute6/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/traceroute6 $(1)/usr/bin/
endef

$(eval $(call BuildPackage,iputils-arping))
$(eval $(call BuildPackage,iputils-clockdiff))
$(eval $(call BuildPackage,iputils-ping))
$(eval $(call BuildPackage,iputils-ping6))
$(eval $(call BuildPackage,iputils-tftpd))
$(eval $(call BuildPackage,iputils-tracepath))
$(eval $(call BuildPackage,iputils-tracepath6))
$(eval $(call BuildPackage,iputils-traceroute6))
