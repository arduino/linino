#
# Copyright (C) 2006 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
# $Id$

include $(TOPDIR)/rules.mk

PKG_NAME:=xsupplicant
PKG_VERSION:=1.2.8
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=@SF/open1x
PKG_MD5SUM:=75f89731b905eb8d36a52621661e1226
PKG_CAT:=zcat

PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)-$(PKG_VERSION)
PKG_INSTALL_DIR:=$(PKG_BUILD_DIR)/ipkg-install

PKG_BUILD_DEPENDS:=madwifi

include $(INCLUDE_DIR)/package.mk

define Package/xsupplicant
  SECTION:=net
  CATEGORY:=Network
  DEPENDS:=+libopenssl +wireless-tools
  TITLE:=A fully compliant 802.1x authenticator
  DESCRIPTION:=\
  	This software allows a GNU/Linux or BSD workstation to authenticate with \\\
	a RADIUS server using 802.1x and various EAP protocols.
  URL:=http://open1x.sourceforge.net/
endef

define Package/xsupplicant/conffiles
/etc/xsupplicant.conf
endef

define Build/Configure	
	(cd $(PKG_BUILD_DIR); touch \
		configure.in \
		aclocal.m4 \
		Makefile.in \
		configure \
	);
	$(call Build/Configure/Default, \
		--with-openssl="$(STAGING_DIR)/usr" \
		--with-madwifi-path="$(STAGING_DIR)/usr/include/madwifi" \
		, \
		CPPFLAGS="$$$$CPPFLAGS -I$(STAGING_DIR)/usr/include/madwifi" \
	)
endef

define Build/Compile	
	$(MAKE) -C $(PKG_BUILD_DIR) \
		DESTDIR="$(PKG_INSTALL_DIR)" \
		all install
endef

define Package/xsupplicant/install	
	$(INSTALL_DIR) $(1)/etc
	$(INSTALL_DATA) $(PKG_BUILD_DIR)/etc/xsupplicant.conf $(1)/etc/
	$(INSTALL_DIR) $(1)/usr/bin
	$(CP) $(PKG_INSTALL_DIR)/usr/bin/xsup_* $(1)/usr/bin/
	$(INSTALL_DIR) $(1)/usr/sbin
	$(CP) $(PKG_INSTALL_DIR)/usr/sbin/xsupplicant $(1)/usr/sbin/
endef

$(eval $(call BuildPackage,xsupplicant))
