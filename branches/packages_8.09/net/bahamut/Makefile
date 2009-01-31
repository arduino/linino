#
# Copyright (C) 2008 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
# $Id: $

include $(TOPDIR)/rules.mk

PKG_NAME:=bahamut
PKG_VERSION:=1.8.4
PKG_RELEASE:=1
PKG_MD5SUM:=6b9a805f4408f3887e75a9d14c69ab93

PKG_SOURCE_URL:=http://bahamut.dal.net/download/
PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION)-release.tar.gz

include $(INCLUDE_DIR)/package.mk

define Package/bahamut
  SECTION:=net
  CATEGORY:=Network
  DEPENDS:=+libopenssl +zlib
  TITLE:=Bahamut IRC server
  URL:=http://bahamut.dal.net
endef

define Build/Configure
	$(call Build/Configure/Default,\
		--with-maxconnections=64 \
		--with-openssl="$(STAGING_DIR)/usr/lib" \
		,\
		ac_cv_func_dn_skipname=yes \
	)
endef

define Build/Compile
	$(call Build/Compile/Default,\
		prefix="$(PKG_INSTALL_DIR)/usr" \
		INSTALL_DIR="$(PKG_INSTALL_DIR)" \
		STAGING_DIR="$(STAGING_DIR)" \
		all \
	)
endef

define Package/bahamut/install	
	$(INSTALL_DIR) $(1)/usr/sbin
	$(INSTALL_DIR) $(1)/etc/$(PKG_NAME)
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/src/ircd $(1)/usr/sbin
	$(INSTALL_CONF) $(PKG_BUILD_DIR)/doc/*.{txt,conf} $(1)/etc/$(PKG_NAME)
endef

$(eval $(call BuildPackage,bahamut))
