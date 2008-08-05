#
# Copyright (C) 2006 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
# $Id$

include $(TOPDIR)/rules.mk

PKG_NAME:=opendchub
PKG_VERSION:=0.7.15
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=@SF/opendchub
PKG_MD5SUM:=8f9ab5bb7f85730f4b1ce7cceb6aef96

include $(INCLUDE_DIR)/package.mk

define Package/opendchub
  SUBMENU:=P2P
  SECTION:=net
  CATEGORY:=Network
  DEPENDS:=+libopenssl +libpthread
  TITLE:=software for the Direct Connect network
  URL:=http://opendchub.sourceforge.net
endef

define Package/opendchub/description
	Open DC hub is a Unix/Linux version of the hub software
	for the Direct Connect network
endef

define Build/Configure
	$(call Build/Configure/Default,\
		--disable-perl \
	)
endef

define Build/Compile	
	$(call Build/Compile/Default,\
		DESTDIR="$(PKG_INSTALL_DIR)" \
		all install \
	)
endef

define Package/opendchub/install	
	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/usr/bin/opendchub $(1)/usr/bin/
endef

$(eval $(call BuildPackage,opendchub))
