# Copyright (C) 2006 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
# $Id$

include $(TOPDIR)/rules.mk

PKG_NAME:=l2tpns
PKG_VERSION:=2.1.14
PKG_RELEASE:=1
PKG_MD5SUM:=2a0ee2a3678160c335f1d68c17c4f871

PKG_SOURCE_URL:=@SF/l2tpns
PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_CAT:=zcat

PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)-$(PKG_VERSION)
PKG_INSTALL_DIR:=$(PKG_BUILD_DIR)/ipkg-install

include $(INCLUDE_DIR)/package.mk

define Package/l2tpns
  SECTION:=net
  CATEGORY:=Network
  DEPENDS:=+libcli
  TITLE:=An L2TP enhanced server
  DESCRIPTION:=l2tpns is a layer 2 tunneling protocol network server (LNS).\\\
	it supports up to 65535 concurrent sessions per server/cluster\\\
	plus ISP features such as rate limiting, walled garden, usage\\\
	accounting, and more.\\\
  URL:=http://sourceforge.net/projects/l2tpns
endef

define Package/l2tpns/conffiles
/etc/l2tpns/ip_pool
/etc/l2tpns/startup-config
/etc/l2tpns/users
endef
	
define Build/Compile
	$(MAKE) -C $(PKG_BUILD_DIR) \
		CC="$(TARGET_CC)" \
		LD="$(TARGET_CC)" \
		OPTIM="$(TARGET_CFLAGS)" \
		DESTDIR=$(PKG_INSTALL_DIR) \
		STAGING_DIR=$(STAGING_DIR) \
		all install
endef

define Package/l2tpns/install	
	install -d -m0755 $(1)/etc/l2tpns
	$(CP) $(PKG_INSTALL_DIR)/etc/l2tpns/* $(1)/etc/l2tpns/
	install -d -m0755 $(1)/usr/lib/l2tpns
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/l2tpns/* $(1)/usr/lib/l2tpns/
	install -d -m0755 $(1)/usr/sbin
	$(CP) $(PKG_INSTALL_DIR)/usr/sbin/* $(1)/usr/sbin/
endef

$(eval $(call BuildPackage,l2tpns))
