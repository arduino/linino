# 
# Copyright (C) 2007 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
# $Id$


include $(TOPDIR)/rules.mk

PKG_NAME:=tsocks
PKG_VERSION:=1.8
PKG_RELEASE:=1
PKG_MD5SUM:=51caefd77e5d440d0bbd6443db4fc0f8

PKG_SOURCE_URL:=http://ftp1.sourceforge.net/tsocks/
PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION)beta5.tar.gz
PKG_CAT:=zcat

PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)-$(PKG_VERSION)
PKG_INSTALL_DIR:=$(PKG_BUILD_DIR)/ipkg-install

include $(INCLUDE_DIR)/package.mk

define Package/tsocks
  SECTION:=net
  CATEGORY:=Network
  TITLE:=Transparent SOCKS v4 proxying library
  DESCRIPTION:=Transparent SOCKS v4 proxying library
  URL:=http://tsocks.sourceforge.net/
endef

define Build/Configure
	$(call Build/Configure/Default,\
                  --with-conf=/etc/tsocks.conf \
	)
endef

define Build/Compile
	$(call Build/Compile/Default,\
		DESTDIR="$(PKG_INSTALL_DIR)" \
		all install \
	)
endef

define Package/tsocks/install
	$(INSTALL_DIR) $(1)/usr/bin $(1)/usr/lib
	$(CP) $(PKG_INSTALL_DIR)/usr/bin/tsocks $(1)/usr/bin/
	$(CP) $(PKG_INSTALL_DIR)/lib/libtsocks.so{,*} $(1)/usr/lib/
endef

$(eval $(call BuildPackage,tsocks))
