#
# Copyright (C) 2006 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
# $Id$

include $(TOPDIR)/rules.mk

PKG_NAME:=siproxd
PKG_VERSION:=0.5.12
PKG_RELEASE:=1
PKG_MD5SUM:=2fa02bd6f83070593bfc2d383ce614fa

PKG_SOURCE_URL:=@SF/siproxd
PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_CAT:=zcat

PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)-$(PKG_VERSION)
PKG_INSTALL_DIR:=$(PKG_BUILD_DIR)/ipkg-install

include $(INCLUDE_DIR)/package.mk

define Package/siproxd
  SECTION:=net
  CATEGORY:=Network
  DEPENDS:=+libosip2
  TITLE:=SIP (Session Initiation Protocol) proxy
  DESCRIPTION:=A SIP (Session Initiation Protocol) proxy
  URL:=http://siproxd.sourceforge.net/
endef

define Package/siproxd/conffiles
/etc/siproxd.conf
endef

define Build/Configure
$(call Build/Configure/Default,--enable-static --enable-shared)
endef
	
define Build/Compile
	rm -rf $(PKG_INSTALL_DIR)
	mkdir -p $(PKG_INSTALL_DIR)
	$(MAKE) -C $(PKG_BUILD_DIR) \
		DESTDIR="$(PKG_INSTALL_DIR)" \
		SUBDIRS="src scripts contrib" \
		all install
endef

define Package/siproxd/install
	install -d -m0755 $(1)/etc
	$(CP) $(PKG_BUILD_DIR)/doc/siproxd.conf.example $(1)/etc/siproxd.conf
	$(CP) $(PKG_BUILD_DIR)/doc/siproxd_passwd.cfg $(1)/etc/
	install -d -m0755 $(1)/etc/init.d
	install -m0755 files/siproxd.init $(1)/etc/init.d/siproxd
	install -d -m0755 $(1)/usr/sbin
	$(CP) $(PKG_INSTALL_DIR)/usr/sbin/siproxd $(1)/usr/sbin/
endef

$(eval $(call BuildPackage,siproxd))
