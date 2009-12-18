#
# Copyright (C) 2006-2009 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=popt
PKG_VERSION:=1.7
PKG_RELEASE:=4

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=http://downloads.openwrt.org/sources/
PKG_MD5SUM:=5988e7aeb0ae4dac8d83561265984cc9

include $(INCLUDE_DIR)/package.mk

define Package/libpopt
  SECTION:=libs
  CATEGORY:=Libraries
  TITLE:=A command line option parsing library
  URL:=http://rpm5.org/files/popt/
endef

define Build/Configure
	$(call Build/Configure/Default, \
		--enable-shared \
		--enable-static \
	)
endef

TARGET_CFLAGS += $(FPIC)

define Build/Compile
	$(MAKE) -C $(PKG_BUILD_DIR) \
		DESTDIR="$(PKG_INSTALL_DIR)" \
		all install
endef

define Build/InstallDev
	$(INSTALL_DIR) $(1)/usr/include
	$(CP) $(PKG_INSTALL_DIR)/usr/include/popt.h $(1)/usr/include/
	$(INSTALL_DIR) $(1)/usr/lib
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/libpopt.{a,so*} $(1)/usr/lib/
endef

define Package/libpopt/install
	$(INSTALL_DIR) $(1)/usr/lib
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/libpopt.so.* $(1)/usr/lib/
endef

$(eval $(call RequireCommand,xgettext, \
	$(PKG_NAME) requires the GNU gettext development package installed on the local system to build. \
))

$(eval $(call BuildPackage,libpopt))

