#
# Copyright (C) 2006 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
# $Id$

include $(TOPDIR)/rules.mk

PKG_NAME:=openvpn
PKG_VERSION:=2.0.9
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=http://openvpn.net/release @SF/openvpn
PKG_MD5SUM:=60745008b90b7dbe25fe8337c550fec6
PKG_CAT:=zcat

PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)-$(PKG_VERSION)
PKG_INSTALL_DIR:=$(PKG_BUILD_DIR)/ipkg-install

include $(INCLUDE_DIR)/package.mk

define Package/openvpn
  SECTION:=net
  CATEGORY:=Network
  DEPENDS:=+kmod-tun +libopenssl +liblzo
  TITLE:=Open source VPN solution using SSL
  DESCRIPTION:=\
 	 Open source VPN solution using SSL
  URL:=http://openvpn.net
endef

define Package/openvpn-easy-rsa
  $(call Package/openvpn)
  DEPENDS:=openvpn +openssl-util
  TITLE:=Simple shell scripts to manage a Certificate Authority
endef

define Build/Configure
	$(call Build/Configure/Default, \
		--disable-pthread \
		--disable-debug \
		--disable-plugins \
		--enable-management \
		--disable-socks \
		--enable-password-save \
	)
endef

define Build/Compile	
	$(MAKE) -C $(PKG_BUILD_DIR) \
		DESTDIR="$(PKG_INSTALL_DIR)" \
		all install
endef

define Package/openvpn/install	
	$(INSTALL_DIR) $(1)/usr/sbin
	$(CP) $(PKG_INSTALL_DIR)/usr/sbin/openvpn $(1)/usr/sbin/
endef

define Package/openvpn-easy-rsa/install	
	$(INSTALL_DIR) $(1)/usr/sbin
	$(CP) $(PKG_BUILD_DIR)/easy-rsa/2.0/{build-*,clean-all,inherit-inter,list-crl,pkitool,revoke-full,sign-req} $(1)/usr/sbin/
	$(INSTALL_DIR) $(1)/etc/easy-rsa
	install -m 0644 $(PKG_BUILD_DIR)/easy-rsa/2.0/openssl.cnf $(1)/etc/easy-rsa/openssl.cnf
	install -m 0644 $(PKG_BUILD_DIR)/easy-rsa/2.0/vars $(1)/etc/easy-rsa/vars
endef

$(eval $(call BuildPackage,openvpn))
$(eval $(call BuildPackage,openvpn-easy-rsa))
