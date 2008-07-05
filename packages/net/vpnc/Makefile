#
# Copyright (C) 2006 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
# $Id$

include $(TOPDIR)/rules.mk

PKG_NAME:=vpnc
PKG_VERSION:=0.5.1
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=http://www.unix-ag.uni-kl.de/~massar/vpnc/
PKG_MD5SUM:=7a8e94dbe94f39a4fd89b72e0125f66f

include $(INCLUDE_DIR)/package.mk

define Package/vpnc
  SECTION:=net
  CATEGORY:=Network
  DEPENDS:=+libgpg-error +libgcrypt +kmod-tun +ip
  TITLE:=VPN client for Cisco EasyVPN
  URL:=http://www.unix-ag.uni-kl.de/~massar/vpnc/
  SUBMENU:=VPN
endef

define Package/vpnc/description
	A VPN client compatible with Cisco's EasyVPN equipment.

	Supports IPSec (ESP) with Mode Configuration and Xauth.  Supports only
	shared-secret IPSec authentication with Xauth, AES (256, 192, 128),
	3DES, 1DES, MD5, SHA1, DH1/2/5 and IP tunneling.
endef

define Package/vpnc/conffiles
/etc/vpnc/default.conf
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
	$(INSTALL_CONF) $(PKG_INSTALL_DIR)/etc/vpnc/default.conf $(1)/etc/vpnc/
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/etc/vpnc/vpnc-script $(1)/etc/vpnc/
endef

$(eval $(call BuildPackage,vpnc))
