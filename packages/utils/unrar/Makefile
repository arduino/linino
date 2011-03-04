#
# Copyright (C) 2006-2011 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=unrar
PKG_VERSION:=4.0.6
PKG_RELEASE:=1

PKG_SOURCE:=unrarsrc-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=http://www.rarlab.com/rar
PKG_MD5SUM:=52c8b40a2f041b55baa508f2db091855

PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)-$(PKG_VERSION)/unrar
PKG_INSTALL:=1

include $(INCLUDE_DIR)/package.mk

define Package/unrar
  SECTION:=utils
  CATEGORY:=Utilities
  SUBMENU:=compression
  TITLE:=unrar application
  URL:=http://www.rarlab.com/
  DEPENDS:=+uclibcxx
endef

define Package/unrar/description
   unrar is an application that can decompress files and archives created using
   the RAR compression scheme
endef

define Build/Configure
	$(call Build/Configure/Default, )
	ln -s $(PKG_BUILD_DIR)/makefile.unix $(PKG_BUILD_DIR)/Makefile
endef

MAKE_FLAGS += \
	CXX="$(STAGING_DIR)/host/bin/g++-uc"

define Package/unrar/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/bin/unrar $(1)/usr/bin/
endef

$(eval $(call BuildPackage,unrar))
