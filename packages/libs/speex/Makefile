# 
# Copyright (C) 2006 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
# $Id$

include $(TOPDIR)/rules.mk

PKG_NAME:=speex
PKG_VERSION:=1.1.8
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=http://us.speex.org/download 
PKG_MD5SUM:=734892c8ca5e7e835828048a1289a0cc
PKG_CAT:=zcat

PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)-$(PKG_VERSION)
PKG_INSTALL_DIR:=$(PKG_BUILD_DIR)/ipkg-install

include $(INCLUDE_DIR)/package.mk

define Package/libspeex
  SECTION:=libs
  CATEGORY:=Libraries
  TITLE:=Open source speech compression codec library
  DESCRIPTION:=\
	Open source patent-free speech compression codec library.\\\
	Speex is an Open Source/Free Software patent-free audio compression \\\
	format designed for speech. The Speex Project aims to lower the \\\
	barrier of entry for voice applications by providing a free \\\
	alternative to expensive proprietary speech codecs. Moreover, Speex \\\
	is well-adapted to Internet applications and provides useful features \\\
	that are not present in most other codecs.\\\
	\\\
	This package contains the shared codec library, needed by other programs.
  URL:=http://www.speex.org/
endef

define Build/Configure
	$(call Build/Configure/Default, \
		--enable-shared \
		--enable-static \
		--disable-oggtest \
	)
endef

define Build/Compile
	$(MAKE) -C $(PKG_BUILD_DIR) \
		DESTDIR="$(PKG_INSTALL_DIR)" \
	  	bin_PROGRAMS="" \
		all install
endef

define Build/InstallDev
	mkdir -p $(STAGING_DIR)/usr/include
	$(CP) $(PKG_INSTALL_DIR)/usr/include/speex $(STAGING_DIR)/usr/include/
	mkdir -p $(STAGING_DIR)/usr/lib
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/libspeex.{a,so*} $(STAGING_DIR)/usr/lib/
	mkdir -p $(STAGING_DIR)/usr/lib/pkgconfig
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/pkgconfig/speex.pc $(STAGING_DIR)/usr/lib/pkgconfig/
	$(SED) 's,-I$$$${includedir},,g' $(STAGING_DIR)/usr/lib/pkgconfig/speex.pc
	$(SED) 's,-L$$$${libdir},,g' $(STAGING_DIR)/usr/lib/pkgconfig/speex.pc
endef

define Build/UninstallDev
	rm -rf \
		$(STAGING_DIR)/usr/include/speex \
		$(STAGING_DIR)/usr/lib/libspeex.{a,so*} \
		$(STAGING_DIR)/usr/lib/pkgconfig/speex.pc
endef

define Package/libspeex/install
	install -d -m0755 $(1)/usr/lib
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/libspeex.so.* $(1)/usr/lib/
endef

$(eval $(call BuildPackage,libspeex))
