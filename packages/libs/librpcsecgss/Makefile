# 
# Copyright (C) 2007 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
# $Id$

include $(TOPDIR)/rules.mk

PKG_NAME:=librpcsecgss
PKG_VERSION:=0.14
PKG_RELEASE:=1

PKG_SOURCE:=librpcsecgss-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=http://www.citi.umich.edu/projects/nfsv4/linux/librpcsecgss/
PKG_MD5SUM:=0d4cdee46a98731b1b71e30504589281

include $(INCLUDE_DIR)/package.mk

define Package/librpcsecgss
  SECTION:=libs
  CATEGORY:=Libraries
  TITLE:=required libraries for the nfs-utils
  DESCRIPTION:= Support libraries - for newer nfs mount command (nfs4)
  URL:=http://www.citi.umich.edu/projects/nfsv4/linux
endef

TARGET_CFLAGS += -I$(PKG_BUILD_DIR)/lib -I$(STAGING_DIR)/usr/include/gssglue/
define Build/Compile
	$(call Build/Compile/Default, \
		OPT="$(TARGET_CFLAGS)" \
		INSTALLSUID="install -m 4755" \
		DESTDIR="$(PKG_INSTALL_DIR)" \
	        GSSAPI_LIBS="usr/lib/libgssapi.a" \
		all install \
	)
endef

define Build/InstallDev
	mkdir -p $(STAGING_DIR)/usr/include/rpcsecgss/rpc
	$(CP) $(PKG_INSTALL_DIR)/usr/include/rpcsecgss/rpc/*.h $(STAGING_DIR)/usr/include/rpcsecgss/rpc/
	mkdir -p $(STAGING_DIR)/usr/lib
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/librpcsecgss.{a,so*} $(STAGING_DIR)/usr/lib
	mkdir -p $(STAGING_DIR)/usr/lib/pkgconfig
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/pkgconfig/librpcsecgss.pc $(STAGING_DIR)/usr/lib/pkgconfig
endef	

define Build/UninstallDev
	rm -rf \
		$(STAGING_DIR)/usr/include/rpcsecgss
		$(STAGING_DIR)/usr/lib/librpcsecgss.{a,so*}
		$(STAGING_DIR)/usr/lib/pkgconfig/librpcsecgss.pc
endef

$(eval $(call BuildPackage,librpcsecgss))
