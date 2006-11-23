# 
# Copyright (C) 2006 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
# $Id$

include $(TOPDIR)/rules.mk

PKG_NAME:=matrixtunnel
PKG_VERSION:=0.1
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=http://znerol.ch/files
PKG_MD5SUM:=ffbbe0c50cc1863f6080aca302f7e2c8
PKG_CAT:=zcat

PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)
PKG_INSTALL_DIR:=$(PKG_BUILD_DIR)/ipkg-install

include $(INCLUDE_DIR)/package.mk

define Package/matrixtunnel
  SECTION:=net
  CATEGORY:=Network
  DEPENDS:=+libmatrixssl
  TITLE:=SSL tunnel based on matrixssl
  DESCRIPTION:=\
	matrixtunnel is a stripped down version of stunnel \\\
	based on matrixssl library.
  URL:=http://znerol.ch/svn/matrixtunnel/trunk/
endef

define Build/Configure
	$(call Build/Configure/Default, \
		--without-libiconv-prefix \
		--without-libintl-prefix \
		--with-matrixssl-src="$(BUILD_DIR)/matrixssl" \
	)
endef

define Build/Compile
	$(MAKE) -C $(PKG_BUILD_DIR)/src \
		DESTDIR="$(PKG_INSTALL_DIR)" \
		all install
endef

define Package/matrixtunnel/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(CP) $(PKG_INSTALL_DIR)/usr/bin/matrixtunnel $(1)/usr/bin/
endef

$(eval $(call BuildPackage,matrixtunnel))
