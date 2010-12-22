#
# Copyright (C) 2009-2010 Thomas Heil <heil@terminal-consulting.de>
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.

include $(TOPDIR)/rules.mk

PKG_NAME:=l2tpv3tun
PKG_VERSION:=0.1
PKG_RELEASE:=3

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=ftp://www.openl2tp.org/releases/
PKG_MD5SUM:=bed89be19360a76186f80fa7e98d57b3

include $(INCLUDE_DIR)/kernel.mk
include $(INCLUDE_DIR)/package.mk

define Package/l2tpv3tun
  SECTION:=net
  CATEGORY:=Network
  DEPENDS:=+libnl +ip +kmod-l2tp +kmod-l2tp-ip +kmod-l2tp-eth
  TITLE:=Control utility for static L2TP v3 (Pseudowire) tunnels
  MAINTAINER:=Thomas Heil <heil@terminal-consulting.de>
  URL:=http://www.openl2tp.org
endef

define Package/l2tpv3tun/description
  The l2tpv3tun utility is a command line frontend for configuring static
  L2TP v3 pseudowire tunnels.
endef

define Build/Compile
	$(MAKE) KERNEL_HEADERS="$(LINUX_DIR)/include" -C $(PKG_BUILD_DIR) \
		DESTDIR="$(PKG_INSTALL_DIR)" \
		CC="$(TARGET_CC)" \
		CFLAGS="$(TARGET_CFLAGS) -I$(STAGING_DIR)/usr/include -I$(LINUX_DIR)/include" \
		LD="$(TARGET_CC)" \
		LDFLAGS="$(TARGET_LDFLAGS) -L$(STAGING_DIR)/usr/lib -lnl" 
endef


define Package/l2tpv3tun/install
		$(INSTALL_DIR) $(1)/usr/sbin
		$(INSTALL_BIN) $(PKG_BUILD_DIR)/l2tpv3tun $(1)/usr/sbin/
		$(INSTALL_DIR) $(1)/lib/network
		$(INSTALL_BIN) ./files/l2tp.sh $(1)/lib/network/
endef

$(eval $(call BuildPackage,l2tpv3tun))
