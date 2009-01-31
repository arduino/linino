# 
# Copyright (C) 2006-2008 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
# $Id: Makefile 11018 2008-05-03 12:11:35Z nico $

include $(TOPDIR)/rules.mk

PKG_NAME:=bandwidthd
PKG_VERSION:=2.0.1
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tgz
PKG_SOURCE_URL:=@SF/bandwidthd
PKG_MD5SUM:=aa79aad7bd489fd2cae1f7dc086ca8b6

include $(INCLUDE_DIR)/package.mk

define Package/bandwidthd
  SECTION:=utils
  CATEGORY:=Utilities
  TITLE:=Bandwidthd
  URL:=http://bandwidthd.sourceforge.net/
  DEPENDS:=+libpng +libgd +libpcap
endef

define Package/bandwidthd/daemon
 This package contains bandwidthd a bandwith tracking utility.
endef

CONFIGURE_ARGS += \
	ac_cv_file__sw_lib=no \
	ac_cv_file__sw_include=no \
	ac_cv_file__usr_pkg_lib=no \
	ac_cv_file__usr_pkg_include=no \
	ac_cv_file__usr_local_pgsql_lib=no \
	ac_cv_file__usr_local_pgsql_include=no \
	ac_cv_lib_pq_PQconnectdb=no \

EXTRA_CFLAGS+=-I$(STAGING_DIR)/usr/include -I$(STAGING_DIR)/include
EXTRA_LDFLAGS+=-L$(STAGING_DIR)/usr/lib -Wl,-rpath-link,$(STAGING_DIR)/usr/lib

define Package/bandwidthd/install
	$(INSTALL_DIR) $(1)/usr/sbin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/bandwidthd $(1)/usr/sbin/
	$(INSTALL_DIR) $(1)/etc/config
	$(INSTALL_DATA) ./files/bandwidthd.config $(1)/etc/config/bandwidthd
	$(INSTALL_DIR) $(1)/etc/init.d
	$(INSTALL_BIN) ./files/bandwidthd.init $(1)/etc/init.d/bandwidthd
	$(INSTALL_DIR) $(1)/www
	$(INSTALL_DATA) $(PKG_BUILD_DIR)/htdocs/legend.gif $(1)/www/
endef

$(eval $(call BuildPackage,bandwidthd))
