# 
# Copyright (C) 2006-2008 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
# $Id: Makefile 12228 2008-08-06 22:43:15Z nbd $

include $(TOPDIR)/rules.mk

PKG_NAME:=embryo
PKG_REV:=38886
PKG_VERSION:=r$(PKG_REV)
PKG_RELEASE:=1

PKG_SOURCE_PROTO:=svn
PKG_SOURCE_VERSION:=$(PKG_REV)
PKG_SOURCE_SUBDIR:=$(PKG_NAME)-$(PKG_VERSION)
PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=http://svn.enlightenment.org/svn/e/trunk/$(PKG_NAME)
PKG_BUILD_DIR=$(BUILD_DIR)/Xorg/$(_CATEGORY)/$(PKG_NAME)-$(PKG_VERSION)/

PKG_FIXUP = libtool

include $(INCLUDE_DIR)/package.mk

define Package/embryo
  SECTION:=xorg-lib
  CATEGORY:=Xorg
  SUBMENU:=libraries
  TITLE:=Embryo implements a C like scripting language used in various parts of the Enlightenment project (edje)
  URL:=http://wiki.enlightenment.org/index.php/Embryo
endef

define Package/embryo/description
  Embryo implements a C like scripting language used in various parts of the Enlightenment project, namely Edje. Embryo's scripting language is based on CompuPhase's Small language that was introduced in Dr Dobb's Journal in 1999. Embryo allows scripting capabilities in places that otherwise wouldn't support basic programming structures such as in Edje EDCs.
endef

define Build/Configure
	( cd $(PKG_BUILD_DIR); NOCONFIGURE=YES ./autogen.sh );
	$(call Build/Configure/Default, \
		--disable-doc \
	)
endef

define Build/Compile
	DESTDIR="$(PKG_INSTALL_DIR)" $(MAKE) -C $(PKG_BUILD_DIR) all install
endef

define Build/InstallDev
	mkdir -p $(1)/usr/include $(1)/usr/lib
	$(CP) $(PKG_INSTALL_DIR)/usr/include/* $(1)/usr/include/
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/* $(1)/usr/lib/
endef

define Package/embryo/install
	$(INSTALL_DIR) $(1)/usr/lib $(1)/usr/bin
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/libembryo.so* $(1)/usr/lib/
	$(CP) $(PKG_INSTALL_DIR)/usr/bin/embryo_cc $(1)/usr/bin/
endef

$(eval $(call BuildPackage,embryo))
