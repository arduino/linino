#
# Copyright (C) 2006 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
# $Id$

include $(TOPDIR)/rules.mk

PKG_NAME:=vpnc
PKG_VERSION:=0.3.3
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=http://www.unix-ag.uni-kl.de/~massar/vpnc/
PKG_MD5SUM:=e7518cff21326fe7eb9795b60c25ae6a
PKG_CAT:=zcat

PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)-$(PKG_VERSION)
PKG_INSTALL_DIR:=$(PKG_BUILD_DIR)/ipkg-install

include $(INCLUDE_DIR)/package.mk

define Package/vpnc
  SECTION:=net
  CATEGORY:=Network
  DEPENDS:=+libgpg-error +libgcrypt +kmod-tun
  TITLE:=VPN client for Cisco 3000
  URL:=http://www.unix-ag.uni-kl.de/~massar/vpnc/
endef

define Package/vpnc/conffiles
/etc/vpnc/vpnc.conf
/etc/vpnc/vpnc-script
endef

define Build/Compile
	$(call Build/Compile/Default, \
		OFLAGS="$(TARGET_CFLAGS)" \
		OS="Linux" \
		STAGING_DIR="$(STAGING_DIR)" \
		DESTDIR="$(PKG_INSTALL_DIR)" \
		PREFIX=/usr \
		all install \
	)
endef

define Package/vpnc/install
	$(INSTALL_DIR) $(1)/usr/sbin
	$(CP)	$(PKG_INSTALL_DIR)/usr/sbin/vpnc \
		$(PKG_INSTALL_DIR)/usr/sbin/vpnc-disconnect \
		$(1)/usr/sbin/
	install -d -m0700 $(1)/etc/vpnc
	$(INSTALL_CONF) $(PKG_INSTALL_DIR)/etc/vpnc/vpnc.conf $(1)/etc/vpnc/
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/etc/vpnc/vpnc-script $(1)/etc/vpnc/
endef

$(eval $(call BuildPackage,vpnc))
