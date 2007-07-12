# 
# Copyright (C) 2007 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
# $Id$

include $(TOPDIR)/rules.mk

PKG_NAME:=libnfsidmap
PKG_VERSION:=0.20
PKG_RELEASE:=2

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=http://www.citi.umich.edu/projects/nfsv4/linux/libnfsidmap/
PKG_MD5SUM:=9233cb77876eb642374a0d2bcaba1170

include $(INCLUDE_DIR)/package.mk

define Package/libnfsidmap
  SECTION:=libs
  CATEGORY:=Libraries
  TITLE:=libnfsidmap, for compiling mount.nfs4
  DESCRIPTION:= needed for nfs-utils
  URL:=http://www.citi.umich.edu/projects/nfsv4
endef

TARGET_CFLAGS += -I$(PKG_BUILD_DIR)/lib

MAKE_FLAGS += \
	OPT="$(TARGET_CFLAGS)" \
	INSTALLSUID="install -m 4755" \
	DESTDIR="$(PKG_INSTALL_DIR)" \
	all install

define Build/InstallDev
	$(INSTALL_DIR) $(STAGING_DIR)/usr/include
	$(CP) $(PKG_INSTALL_DIR)/usr/include/nfsidmap.h $(STAGING_DIR)/usr/include/
	$(INSTALL_DIR) $(STAGING_DIR)/usr/lib
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/libnfsidmap.{a,so*} $(STAGING_DIR)/usr/lib
	$(INSTALL_DIR) $(STAGING_DIR)/usr/lib/pkgconfig
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/pkgconfig/libnfsidmap.pc $(STAGING_DIR)/usr/lib/pkgconfig
endef	

define Build/UninstallDev
	rm -rf \
		$(STAGING_DIR)/usr/include/nfsidmap.h \
		$(STAGING_DIR)/usr/lib/libnfsidmap.{a,so*} \
		$(STAGING_DIR)/usr/lib/pkgconfig/libnfsidmap.pc
endef

$(eval $(call BuildPackage,libnfsidmap))
