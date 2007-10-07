# 
# Copyright (C) 2006 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
# $Id$

include $(TOPDIR)/rules.mk

PKG_NAME:=libxml2
PKG_VERSION:=2.6.20
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=http://xmlsoft.org/sources/ \
	ftp://fr.rpmfind.net/pub/libxml/
PKG_MD5SUM:=8f0b3ce721bda11401e656b90ba4e78c
PKG_CAT:=zcat

PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)-$(PKG_VERSION)
PKG_INSTALL_DIR:=$(PKG_BUILD_DIR)/ipkg-install

include $(INCLUDE_DIR)/package.mk


define Package/libxml2
  SECTION:=libs
  CATEGORY:=Libraries
  DEPENDS:=+libpthread +zlib
  TITLE:=Gnome XML library
  URL:=http://xmlsoft.org/
endef

define Package/libxml2/description
 A library for manipulating XML and HTML resources.
endef


CONFIGURE_ARGS += \
	--enable-shared \
	--enable-static \
	--without-c14n \
	--without-catalog \
	--without-debug \
	--without-docbook \
	--with-html \
	--without-ftp \
	--without-http \
	--without-iconv \
	--without-iso8859x \
	--without-legacy \
	--with-output \
	--without-pattern \
	--without-push \
	--without-python \
	--with-reader \
	--without-readline \
	--without-regexps \
	--with-sax1 \
	--with-schemas \
	--with-threads \
	--with-tree \
	--with-valid \
	--with-writer \
	--with-xinclude \
	--with-xpath \
	--with-xptr \
	--with-zlib \


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
	mkdir -p $(1)/usr/bin
	$(CP) $(PKG_INSTALL_DIR)/usr/bin/xml2-config $(1)/usr/bin/
	mkdir -p $(1)/usr/include
	$(CP) $(PKG_INSTALL_DIR)/usr/include/libxml2 $(1)/usr/include/
	mkdir -p $(1)/usr/lib
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/libxml2.{a,so*} $(1)/usr/lib/
	mkdir -p $(1)/usr/lib/pkgconfig
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/pkgconfig/libxml-2.0.pc $(1)/usr/lib/pkgconfig/
	$(SED) 's,-I$$$${includedir}/libxml2,-I$(1)/usr/include/libxml2,g' $(1)/usr/bin/xml2-config
	$(SED) 's,-L$$$${libdir},,g' $(1)/usr/bin/xml2-config
endef

define Build/UninstallDev
	rm -rf	$(STAGING_DIR)/usr/bin/xml2-config \
		$(STAGING_DIR)/usr/include/libxml2 \
		$(STAGING_DIR)/usr/lib/libxml2.{a,so*} \
		$(STAGING_DIR)/usr/lib/pkgconfig/libxml-2.0.pc
endef


define Package/libxml2/install
	$(INSTALL_DIR) $(1)/usr/lib
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/libxml2.so.* $(1)/usr/lib/
endef


$(eval $(call BuildPackage,libxml2))

