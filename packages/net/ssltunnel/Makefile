#
# Copyright (C) 2006 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
# $Id$

include $(TOPDIR)/rules.mk

PKG_NAME:=ssltunnel
PKG_VERSION:=1.15
PKG_RELEASE:=1
PKG_MD5SUM:=bfe529edb9b6c97bc03d213676b1f35d

PKG_SOURCE_URL:=http://www.hsc.fr/ressources/outils/ssltunnel/download
PKG_SOURCE:=${PKG_NAME}-$(PKG_VERSION).tar.gz
PKG_CAT:=zcat

PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)-$(PKG_VERSION)
PKG_INSTALL_DIR:=$(PKG_BUILD_DIR)/ipkg-install

include $(INCLUDE_DIR)/package.mk

define Package/ssltunnel
  SECTION:=net
  CATEGORY:=Network
  DEPENDS:=+ppp +libopenssl
  TITLE:=A PPP over SSL vpn tool
  DESCRIPTION:=A PPP over SSL vpn tool
  URL:=http://www.hsc.fr/ressources/outils/ssltunnel/index.html
endef

define Build/Configure
$(call Build/Configure/Default,,BUILD_CC=$(TARGET_CC) HOSTCC=$(HOSTCC))
endef

define Build/Compile
$(call Build/Compile/Default,CCOPT="$(TARGET_CFLAGS)" INCLS="-I. -I$(STAGING_DIR)/usr/include" \
		DESTDIR="$(PKG_INSTALL_DIR)" \
		all install)
endef

define Package/ssltunnel/install	
	install -m0755 -d $(1)/usr/bin
	install -m0755 -d $(1)/usr/sbin
	install -m0755 -d $(1)/usr/lib
	install -m0755 $(PKG_INSTALL_DIR)/usr/bin/pppclient $(1)/usr/bin/
	install -m0755 $(PKG_INSTALL_DIR)/usr/sbin/pppwho $(1)/usr/sbin/
	install -m0755 $(PKG_INSTALL_DIR)/usr/lib/pppserver $(1)/usr/lib/
endef

$(eval $(call BuildPackage,ssltunnel))
