#
# Copyright (C) 2006 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=xl2tpd
PKG_VERSION:=1.2.4
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=http://www.xelerance.com/software/xl2tpd
PKG_MD5SUM:=d94fc8a13596f12a561240dfcea9f977

include $(INCLUDE_DIR)/package.mk

define Package/xl2tpd
  SECTION:=net
  CATEGORY:=Network
  DEPENDS:=+libpcap
  TITLE:=An L2TP (Layer 2 Tunneling Protocol) daemon
  URL:=http://www.xelerance.com/software/xl2tpd
  SUBMENU:=VPN
endef

define Package/xl2tpd/description
 l2tpd is the open source implementation of the L2TP tunneling protocol
 (RFC2661). It does implement both LAC and LNS role in a L2TP networking
 architecture. The main goal of this protocol is to tunnel PPP frame trough
 an ip network.
endef

# XXX: CFLAGS are already set by Build/Compile/Default
MAKE_FLAGS+= \
	OFLAGS=""

define Package/xl2tpd/conffiles
/etc/xl2tpd/ppp.options
/etc/xl2tpd/ppp.secrets
/etc/xl2tpd/xl2tpd.conf
endef

define Package/xl2tpd/install
	$(INSTALL_DIR) $(1)/usr/sbin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/xl2tpd $(1)/usr/sbin/
	$(INSTALL_DIR) $(1)/etc/init.d
	$(INSTALL_BIN) ./files/xl2tpd.init $(1)/etc/init.d/xl2tpd
	$(INSTALL_DIR) $(1)/etc/xl2tpd
	$(INSTALL_DATA) ./files/ppp.options $(1)/etc/xl2tpd/
	$(INSTALL_DATA) ./files/ppp.secrets $(1)/etc/xl2tpd/
	$(INSTALL_DATA) ./files/xl2tpd.conf $(1)/etc/xl2tpd/
	chmod 0600 $(1)/etc/xl2tpd/ppp.secrets
endef

$(eval $(call BuildPackage,xl2tpd))
