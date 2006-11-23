#
# Copyright (C) 2006 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
# $Id$

include $(TOPDIR)/rules.mk

PKG_NAME:=tmsnc
PKG_VERSION:=0.3.1
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=@SF/tmsnc
PKG_MD5SUM:=3b30e5dab0b1b679d2b945c3a5713636
PKG_CAT:=zcat

PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)-$(PKG_VERSION)
PKG_INSTALL_DIR:=$(PKG_BUILD_DIR)/ipkg-install

include $(INCLUDE_DIR)/package.mk

define Package/tmsnc
  SECTION:=net
  CATEGORY:=Network
  DEPENDS:=+libncurses +libopenssl +libpthread
  TITLE:=text-based MSN client
  DESCRIPTION:=\
	TMSNC is a textbased (console) MSN client written in C.
  URL:=http://tmsnc.sourceforge.net
endef

define Build/Configure
	$(call Build/Configure/Default, \
		--disable-rpath \
		--with-openssl="$(STAGING_DIR)/usr" \
		--with-ncurses="$(STAGING_DIR)/usr" \
		--without-libiconv-prefix \
	)
endef

define Build/Compile
	$(MAKE) -C $(PKG_BUILD_DIR) \
		DESTDIR="$(PKG_INSTALL_DIR)" \
		all install
endef

define Package/tmsnc/install	
	$(INSTALL_DIR) $(1)/usr/bin
	$(CP) $(PKG_INSTALL_DIR)/usr/bin/tmsnc $(1)/usr/bin/
endef

$(eval $(call BuildPackage,tmsnc))
