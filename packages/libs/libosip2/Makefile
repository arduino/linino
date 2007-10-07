# 
# Copyright (C) 2006,2007 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
# $Id$

include $(TOPDIR)/rules.mk

PKG_NAME:=libosip2
PKG_VERSION:=2.2.0
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=@GNU/osip
PKG_MD5SUM:=f1237af0250c59b318bd64a59f5750ea

include $(INCLUDE_DIR)/package.mk

define Package/libosip2
  SECTION:=libs
  CATEGORY:=Libraries
  TITLE:=GNU oSIP library
  URL:=http://www.gnu.org/software/osip/
  DEPENDS:=+libpthread
endef

define Package/libosip2description
 GNU oSIP library, a Session Initiation Protocol (SIP) implementation.
endef

CONFIGURE_ARGS+= \
	--enable-shared \
	--enable-static \
	--disable-debug \
	--disable-trace \
	--enable-pthread \
	--enable-semaphore \
	--enable-ntimer \

define Build/Configure
	$(call Build/Configure/Default)
	$(call libtool_disable_rpath)
endef

define Build/Compile
	$(MAKE) -C $(PKG_BUILD_DIR) all
	$(call libtool_fixup_libdir,$(PKG_INSTALL_DIR))
	$(MAKE) -C $(PKG_BUILD_DIR) DESTDIR="$(PKG_INSTALL_DIR)" install
endef

define Build/InstallDev
	mkdir -p $(1)/usr/include
	$(CP) $(PKG_INSTALL_DIR)/usr/include/osip{,parser}2 $(1)/usr/include/
	mkdir -p $(1)/usr/lib
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/libosip{,parser}2.{a,so*} $(1)/usr/lib/
	mkdir -p $(1)/usr/lib/pkgconfig
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/pkgconfig/libosip2.pc $(1)/usr/lib/pkgconfig/
endef

define Build/UninstallDev
	rm -rf	$(STAGING_DIR)/usr/include/osip{,parser}2 \
		$(STAGING_DIR)/usr/lib/libosip{,parser}2.{a,so*} \
		$(STAGING_DIR)/usr/lib/pkgconfig/libosip2.pc
endef

define Package/libosip2/install
	$(INSTALL_DIR) $(1)/usr/lib
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/libosip{,parser}2.so.* $(1)/usr/lib/
endef

$(eval $(call BuildPackage,libosip2))
