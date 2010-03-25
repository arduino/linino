#
# Copyright (C) 2006-2009 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=unrar
PKG_VERSION:=3.8.5
PKG_RELEASE:=1

PKG_SOURCE:=unrarsrc-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=http://www.rarlab.com/rar
PKG_MD5SUM:=875688e6a144a3f75d2a6a0da3e43f8b

PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)-$(PKG_VERSION)/unrar

include $(INCLUDE_DIR)/package.mk

define Package/unrar
  SECTION:=utils
  CATEGORY:=Utilities
  TITLE:=unrar application
  URL:=http://www.rarlab.com/
  DEPENDS:=+libstdcpp
endef

define Package/unrar/description
   unrar is an application that can decompress files and archives created using the RAR compression scheme
endef

define Build/Configure
	$(call Build/Configure/Default, )
	ln -s $(PKG_BUILD_DIR)/makefile.unix $(PKG_BUILD_DIR)/Makefile
endef

define Package/unrar/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/unrar $(1)/usr/bin/
endef
 
$(eval $(call BuildPackage,unrar))
