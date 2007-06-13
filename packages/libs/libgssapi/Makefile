# 
# Copyright (C) 2007 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
# $Id: $

include $(TOPDIR)/rules.mk

PKG_NAME:=libgssapi
PKG_VERSION:=0.11
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=http://www.citi.umich.edu/projects/nfsv4/linux/libgssapi/
PKG_MD5SUM:=0e5b4c7267724f8ddf64bc35514c272e

include $(INCLUDE_DIR)/package.mk

define Package/libgssapi
  SECTION:=libs
  CATEGORY:=Libraries
  TITLE:=required libraries for the nfs-utils
  DESCRIPTION:= Support libraries - for newer nfs mount command (nfs4)
  URL:=http://www.citi.umich.edu/projects/nfsv4/linux
endef

TARGET_CFLAGS += -I$(PKG_BUILD_DIR)/lib
define Build/Compile
	$(call Build/Compile/Default, \
		OPT="$(TARGET_CFLAGS)" \
		INSTALLSUID="install -m 4755" \
		DESTDIR="$(PKG_INSTALL_DIR)" \
		all install \
	)
endef

define Build/InstallDev
	mkdir -p $(STAGING_DIR)/usr/include/gssglue/gssapi
	$(CP) $(PKG_INSTALL_DIR)/usr/include/gssglue/gssapi/gssapi.h $(STAGING_DIR)/usr/include/gssglue/gssapi
	mkdir -p $(STAGING_DIR)/usr/lib
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/libgssapi.{a,so*} $(STAGING_DIR)/usr/lib
	mkdir -p $(STAGING_DIR)/usr/lib/pkgconfig
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/pkgconfig/libgssapi.pc $(STAGING_DIR)/usr/lib/pkgconfig
endef

define Build/UninstallDev
	rm -rf \
		$(STAGING_DIR)/usr/include/gssglue
		$(STAGING_DIR)/usr/lib/libgssapi.{a,so*}
		$(STAGING_DIR)/usr/lib/pkgconfig/libgssapi.pc
endef

$(eval $(call BuildPackage,libgssapi))
