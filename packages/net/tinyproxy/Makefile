#
# Copyright (C) 2006 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
# $Id: $

include $(TOPDIR)/rules.mk

PKG_NAME:=tinyproxy
PKG_VERSION:=1.6.3
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=@SF/tinyproxy
PKG_MD5SUM:=bd14d029b12621bcfd7ee71b2f4893da
PKG_CAT:=zcat

PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)-$(PKG_VERSION)
PKG_INSTALL_DIR:=$(PKG_BUILD_DIR)/ipkg-install

include $(INCLUDE_DIR)/package.mk

define Package/tinyproxy
  SECTION:=net
  CATEGORY:=Network
  TITLE:=Tinyproxy is a lightweight HTTP and HTTPS proxy.
  DESCRIPTION:=\
  	Tinyproxy is a lightweight HTTP and HTTPS proxy.\
  URL:=http://tinyproxy.sourceforge.net
endef

define Build/Configure
$(call Build/Configure/Default,\
	--disable-static \
	--enable-transparent-proxy \
)
endef

define Build/Compile
$(call Build/Compile/Default,DESTDIR="$(PKG_INSTALL_DIR)" install)
endef

define Package/tinyproxy/install
	install -d -m0755 $(1)/usr/sbin \
				$(1)/etc/tinyproxy \
				$(1)/etc/init.d \
				$(1)/var/log \
				$(1)/usr/share
	$(CP) $(PKG_INSTALL_DIR)/usr/sbin/tinyproxy $(1)/usr/sbin/
	$(CP) $(PKG_INSTALL_DIR)/usr/share/tinyproxy $(1)/usr/share/
	$(CP) $(PKG_INSTALL_DIR)/etc/tinyproxy $(1)/etc/
	$(CP) files/tinyproxy.init $(1)/etc/init.d/tinyproxy
endef

$(eval $(call BuildPackage,tinyproxy))
