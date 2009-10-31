#
# Copyright (C) 2007 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=tinc
PKG_VERSION:=1.0.10
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=http://www.tinc-vpn.org/packages \
	http://ftp.yi.se/pub/tinc/ \
	http://www.mirrors.wiretapped.net/security/network-security/tinc/
PKG_MD5SUM:=da69d4f4c9a1b1ee44fd14a52a049141

include $(INCLUDE_DIR)/package.mk

define Package/tinc
  SECTION:=net
  CATEGORY:=Network
  DEPENDS:=+liblzo +libopenssl +kmod-tun
  TITLE:=VPN tunneling daemon
  URL:=http://www.tinc-vpn.org/
  SUBMENU:=VPN
endef

define Package/tinc/description
  tinc is a Virtual Private Network (VPN) daemon that uses tunnelling and
  encryption to create a secure private network between hosts on the Internet.
endef

define Build/Configure
	$(call Build/Configure/Default, \
		--with-kernel="$(LINUX_DIR)" \
		--with-zlib="$(STAGING_DIR)/usr" \
		--with-lzo-include="$(STAGING_DIR)/usr/include/lzo" \
	)
endef

define Build/Compile
	$(MAKE) -C $(PKG_BUILD_DIR) \
		DESTDIR="$(PKG_INSTALL_DIR)" \
		all install
endef

define Package/tinc/install
	$(INSTALL_DIR) $(1)/usr/sbin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/usr/sbin/tincd $(1)/usr/sbin/
endef

$(eval $(call BuildPackage,tinc))
