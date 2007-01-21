#
# Copyright (C) 2006 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
# $Id$

include $(TOPDIR)/rules.mk

PKG_NAME:=gettext
PKG_VERSION:=0.16.1
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=@GNU/gettext
PKG_MD5SUM:=
PKG_CAT:=zcat

PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)-$(PKG_VERSION)
PKG_INSTALL_DIR:=$(PKG_BUILD_DIR)/ipkg-install

include $(INCLUDE_DIR)/package.mk

define Package/libintl
  SECTION:=libs
  CATEGORY:=Libraries
  TITLE:=GNU Internationalization library
  URL:=http://www.gnu.org/software/gettext/
endef

define Build/Configure
	$(call Build/Configure/Default, \
		--enable-shared \
		--enable-static \
		--disable-rpath \
		--enable-nls \
		--disable-java \
		--disable-native-java \
		--disable-openmp \
		--with-included-gettext \
		--without-libintl-prefix \
		--without-libexpat-prefix \
		--without-emacs \
	)
endef

define Build/Compile
	$(MAKE) -C $(PKG_BUILD_DIR) \
		DESTDIR="$(PKG_INSTALL_DIR)" \
		all install
endef

define Build/InstallDev
	mkdir -p $(STAGING_DIR)/usr/lib/libintl/include
	$(CP) $(PKG_INSTALL_DIR)/usr/include/libintl.h $(STAGING_DIR)/usr/lib/libintl/include/
	mkdir -p $(STAGING_DIR)/usr/lib/libintl/lib
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/libintl.{a,so*} $(STAGING_DIR)/usr/lib/libintl/lib/
endef

define Build/UninstallDev	
	rm -rf	$(STAGING_DIR)/usr/lib/libintl
endef

define Package/libintl/install
	$(INSTALL_DIR) $(1)/usr/lib
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/libintl.so.* $(1)/usr/lib/
endef

$(eval $(call BuildPackage,libintl))
