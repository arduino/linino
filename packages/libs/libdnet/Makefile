# 
# Copyright (C) 2006 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
# $Id$

include $(TOPDIR)/rules.mk

PKG_NAME:=libdnet
PKG_VERSION:=1.10
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=@SF/$(PKG_NAME)
PKG_MD5SUM:=416b765e9d9961501ac85e9a366fd219
PKG_CAT:=zcat

PKG_BUILD_DIR:=$(BUILD_DIR)/libdnet-$(PKG_VERSION)
PKG_INSTALL_DIR:=$(PKG_BUILD_DIR)/ipkg-install

include $(INCLUDE_DIR)/package.mk

define Package/libdnet
  SECTION:=libs
  CATEGORY:=Libraries
  TITLE:=Low-level network library
  DESCRIPTION:=\
	libdnet is a library of simplified, portable interface to several \\\
	low-level networking routines.
  URL:=http://sourceforge.net/projects/libdnet/
endef

define Build/Configure
	(cd $(PKG_BUILD_DIR); touch \
		configure.in \
		include.m4 \
		aclocal.m4 \
		Makefile.in \
		configure \
	);
	$(call Build/Configure/Default, \
		--enable-shared \
		--enable-static \
		, \
		ac_cv_dnet_bsd_bpf=no \
	)
endef

define Build/Compile
	$(MAKE) -C $(PKG_BUILD_DIR) \
		DESTDIR="$(PKG_INSTALL_DIR)" \
		all install
endef

define Build/InstallDev
	mkdir -p $(STAGING_DIR)/usr/bin
	$(CP) $(PKG_INSTALL_DIR)/usr/bin/dnet-config $(STAGING_DIR)/usr/bin/
	mkdir -p $(STAGING_DIR)/usr/include
	$(CP) $(PKG_INSTALL_DIR)/usr/include/dnet.h $(STAGING_DIR)/usr/include/
	$(CP) $(PKG_INSTALL_DIR)/usr/include/dnet $(STAGING_DIR)/usr/include/
	mkdir -p $(STAGING_DIR)/usr/lib
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/libdnet.{a,so*} $(STAGING_DIR)/usr/lib/
endef

define Build/UninstallDev
	rm -rf \
		$(STAGING_DIR)/usr/bin/dnet-config \
		$(STAGING_DIR)/usr/include/dnet.h  \
		$(STAGING_DIR)/usr/include/dnet  \
		$(STAGING_DIR)/usr/lib/libdnet.{a,so*}
endef

define Package/libdnet/install
	install -d -m0755 $(1)/usr/lib
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/libdnet.so.* $(1)/usr/lib/
	install -d -m0755 $(1)/usr/sbin
	$(CP) $(PKG_INSTALL_DIR)/usr/sbin/dnet $(1)/usr/sbin/
endef

$(eval $(call BuildPackage,libdnet))
