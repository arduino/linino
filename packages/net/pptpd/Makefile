# 
# Copyright (C) 2006 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=pptpd
PKG_VERSION:=1.3.4
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=@SF/poptop
#PKG_MD5SUM:=75d494e881f7027f4e60b114163f6b67 #1.3.0

include $(INCLUDE_DIR)/package.mk

define Package/pptpd
  SECTION:=net
  CATEGORY:=Network
  DEPENDS:=+kmod-ppp +kmod-gre +ppp
  TITLE:=PopTop pptp server
  URL:=http://www.poptop.org/
  SUBMENU:=VPN
endef

define Build/Configure
	$(call Build/Configure/Default, \
		--with-bcrelay \
	)
endef

define Build/Compile
	$(call Build/Compile/Default, \
		COPTS="$(TARGET_CFLAGS)" \
		DESTDIR="$(PKG_INSTALL_DIR)" \
		INSTALL="install" \
		all install \
	)
endef

define Package/pptpd/install
	$(INSTALL_DIR) $(1)/usr/sbin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/usr/sbin/pptpd $(1)/usr/sbin/
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/usr/sbin/pptpctrl $(1)/usr/sbin/
	$(INSTALL_DIR) $(1)/usr/lib/pptpd
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/pptpd/* $(1)/usr/lib/pptpd
	$(INSTALL_DIR) $(1)/etc
	$(INSTALL_DATA) ./files/pptpd.conf $(1)/etc/
	$(INSTALL_DIR) $(1)/etc/init.d
	$(INSTALL_BIN) ./files/pptpd.init $(1)/etc/init.d/pptpd
	$(INSTALL_DIR) $(1)/etc/ppp
	$(INSTALL_DATA) ./files/options.pptpd $(1)/etc/ppp/
endef

$(eval $(call BuildPackage,pptpd))
