#
# Copyright (C) 2008 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=check
PKG_VERSION:=0.9.5
PKG_RELEASE:=1
PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=http://dl.sourceforge.net/sourceforge/check/
PKG_FIXUP:=libtool

include $(INCLUDE_DIR)/package.mk

EXTRA_CFLAGS+=-I$(STAGING_DIR)/usr/lib/libintl/include/ -I$(STAGING_DIR)/usr/lib/libiconv/include/ -fPIC
EXTRA_LDFLAGS+=-Wl,-rpath-link=$(STAGING_DIR)/usr/lib -L$(STAGING_DIR)/usr/lib/libintl/lib/ -L$(STAGING_DIR)/usr/lib/libiconv/lib/

define Package/check
  SECTION:=lib
  CATEGORY:=Libraries
  TITLE:=check
  URL:=http://sf.net
  DEPENDS:=+libxml2
endef

define Package/check/description
  unit testinglibrary
endef

define Build/Configure
	$(CP) $(SCRIPT_DIR)/config.* $(PKG_BUILD_DIR)/build-aux/
	$(call Build/Configure/Default)
endef

define Build/Compile
	cd $(PKG_BUILD_DIR) ; DESTDIR=$(PKG_INSTALL_DIR) $(MAKE) all install
	cd $(PKG_INSTALL_DIR)/usr/lib/ ; ln -s libcheck.so libcheck_pic.so
endef

define Build/InstallDev
	mkdir -p $(1)
	cp -r $(PKG_INSTALL_DIR)/* $(1)
endef

define Package/check/install
	mkdir -p $(1)
	cp -r $(PKG_INSTALL_DIR)/* $(1)
endef

$(eval $(call BuildPackage,check))
