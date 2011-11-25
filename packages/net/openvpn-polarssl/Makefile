#
# Copyright (C) 2011 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=openvpn-polarssl
PKG_VERSION:=v2.2-RC2-345-g03ab4ea
PKG_RELEASE=$(PKG_SOURCE_VERSION)
PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.bz2
PKG_SOURCE_SUBDIR:=$(PKG_NAME)-$(PKG_VERSION)
PKG_SOURCE_URL:=git://openvpn.git.sourceforge.net/gitroot/openvpn/openvpn.git
PKG_SOURCE_PROTO:=git
PKG_SOURCE_VERSION:=03ab4ead8295e005f72dbffcffdaa74487d9668c

PKG_INSTALL:=1
PKG_FIXUP:=autoreconf
PKG_BUILD_PARALLEL:=1

include $(INCLUDE_DIR)/package.mk

define Package/openvpn-polarssl
  SECTION:=net
  CATEGORY:=Network
  DEPENDS:=+kmod-tun +kmod-ipv6 +libpolarssl +liblzo +ip
  TITLE:=Open source VPN solution using PolarSSL (Git version)
  URL:=http://openvpn.net
  SUBMENU:=VPN
endef

define Package/openvpn-polarssl/conffiles
/etc/config/openvpn
endef

define Package/openvpn-polarssl/description
	 Open source VPN solution using PolarSSL - DEVEL VERSION, Git $(PKG_VERSION)
endef

CONFIGURE_ARGS += \
	--disable-debug \
	--disable-plugins \
	--enable-management \
	--enable-small \
	--disable-socks \
	--enable-password-save \
	--enable-iproute2 \
	--with-ssl-headers=$(STAGING_DIR)/usr/include \
	--with-ssl-lib=$(STAGING_DIR)/usr/lib \
	--with-ssl-type=polarssl

define Package/openvpn-polarssl/install
	$(INSTALL_DIR) $(1)/usr/sbin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/usr/sbin/openvpn $(1)/usr/sbin/
	$(INSTALL_DIR) $(1)/etc/init.d/
	$(INSTALL_BIN) files/openvpn.init $(1)/etc/init.d/openvpn
	$(INSTALL_DIR) $(1)/etc/config
	$(INSTALL_CONF) files/openvpn.config $(1)/etc/config/openvpn
	$(INSTALL_DIR) $(1)/etc/openvpn
endef

$(eval $(call BuildPackage,openvpn-polarssl))
