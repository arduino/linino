# 
# Copyright (C) 2006 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
# $Id$

include $(TOPDIR)/rules.mk

PKG_NAME:=libtool
PKG_VERSION:=1.5.22
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=@GNU/libtool
PKG_MD5SUM:=8e0ac9797b62ba4dcc8a2fb7936412b0

PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)-$(PKG_VERSION)
PKG_INSTALL_DIR:=$(PKG_BUILD_DIR)/ipkg-install

include $(INCLUDE_DIR)/package.mk

define Package/libltdl
  SECTION:=libs
  CATEGORY:=Libraries
  TITLE:=A generic dynamic object loading library
  URL:=http://www.gnu.org/software/libtool/
endef

define Build/Configure
	(cd $(PKG_BUILD_DIR); touch \
		libltdl/configure.ac \
		libltdl/acinclude.m4 \
		libltdl/aclocal.m4 \
		libltdl/Makefile.in \
		libltdl/config-h.in \
		libltdl/configure \
	);
	$(call Build/Configure/Default, \
		--enable-shared \
		--enable-static \
	)
endef

define Build/Compile
	$(MAKE) -C $(PKG_BUILD_DIR) \
		DESTDIR="$(PKG_INSTALL_DIR)" \
		all install
endef

define Build/InstallDev
	mkdir -p $(1)/usr/bin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/usr/bin/libtool $(1)/usr/bin/
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/usr/bin/libtoolize $(1)/usr/bin/
	mkdir -p $(1)/usr/share/
	$(CP) -R $(PKG_INSTALL_DIR)/usr/share/* $(1)/usr/share/
	mkdir -p $(1)/usr/include
	$(CP) $(PKG_INSTALL_DIR)/usr/include/ltdl.h $(1)/usr/include/
	mkdir -p $(1)/usr/lib
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/libltdl.{a,so*} $(1)/usr/lib/
	mkdir -p $(1)/usr/share/libtool
	$(CP) $(PKG_INSTALL_DIR)/usr/share/libtool/config.guess $(1)/usr/share/libtool/
	$(SED) 's|^sys_lib_dlsearch_path_spec=.*|sys_lib_dlsearch_path_spec="$(1)/usr/lib $(1)/lib"|g' \
		$(1)/usr/bin/libtool
	$(SED) 's|^prefix=.*|prefix=$(1)/usr|g' \
		$(1)/usr/bin/libtoolize
	$(SED) 's|^datadir=.*|datadir=$(1)/usr/share|g' \
		$(1)/usr/bin/libtoolize
endef

define Build/UninstallDev
	rm -rf \
		$(STAGING_DIR)/usr/bin/libtool \
		$(STAGING_DIR)/usr/include/ltdl.h \
		$(STAGING_DIR)/usr/lib/libltdl.{a,so*} \
		$(STAGING_DIR)/usr/share/libtool
endef

define Package/libltdl/install
	$(INSTALL_DIR) $(1)/usr/lib
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/libltdl.so.* $(1)/usr/lib/
endef

$(eval $(call BuildPackage,libltdl))
