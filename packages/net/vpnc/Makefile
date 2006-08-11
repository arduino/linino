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

PKG_MD5SUM:=e7518cff21326fe7eb9795b60c25ae6a
PKG_SOURCE_URL:=http://www.unix-ag.uni-kl.de/~massar/vpnc/

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)-$(PKG_VERSION)
PKG_CAT:=zcat

PKG_INSTALL_DIR:=$(PKG_BUILD_DIR)/ipkg-install

include $(INCLUDE_DIR)/package.mk

define Package/vpnc
  SECTION:=net
  CATEGORY:=Network
  DEPENDS:=+libgpg-error +libgcrypt
  TITLE:=VPN client for Cisco 3000
  DESCRIPTION:=Client for cisco3000 VPN Concentrator
  URL:=http://www.unix-ag.uni-kl.de/~massar/vpnc/
endef

define Package/vpnc/conffiles
/etc/vpnc/vpnc.conf
/etc/vpnc/vpnc-script
endef

define Build/Compile
$(call Build/Compile/Default,CC="$(TARGET_CC)" \
		OFLAGS="$(TARGET_CFLAGS)" \
		OS="Linux" \
		STAGING_DIR="$(STAGING_DIR)" \
		DESTDIR="$(PKG_INSTALL_DIR)" \
		PREFIX=/usr \
		all install)
endef

define Package/vpnc/install
	install -d -m0755 $(1)
	$(CP) $(PKG_INSTALL_DIR)/* $(1)/
endef

$(eval $(call BuildPackage,vpnc))
