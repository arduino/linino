#
# Copyright (C) 2007 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=libmpd
PKG_VERSION:=0.19.0
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=http://download.sarine.nl/Programs/gmpc/$(PKG_VERSION)/
PKG_MD5SUM:=a994f5f25a22c778926a3684c3e3050d

include $(INCLUDE_DIR)/package.mk

define Package/libmpd
  SECTION:=libs
  CATEGORY:=Libraries
  TITLE:=Libmpd is an a library to easily connect to a mpd server
  URL:=http://gmpc.wikia.com/wiki/LIBMPD_RELEASES
endef

define Package/libmpd/description
It's wraps around libmpdclient and provides a higher level api.
endef

TARGET_CFLAGS += $(FPIC)

define Build/Compile
	$(MAKE) -C $(PKG_BUILD_DIR) \
	DESTDIR="$(PKG_INSTALL_DIR)" \
		all install
endef

define Build/InstallDev
	$(INSTALL_DIR) $(1)/usr/include
	$(CP) $(PKG_INSTALL_DIR)/usr/include/libmpd-1.0 $(1)/usr/include/
	$(INSTALL_DIR) $(1)/usr/lib
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/libmpd.{a,so*} $(1)/usr/lib/
	$(INSTALL_DIR) $(1)/usr/lib/pkgconfig
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/pkgconfig/libmpd.pc $(1)/usr/lib/pkgconfig/
endef

define Package/libmpd/install
	$(INSTALL_DIR) $(1)/usr/lib
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/libmpd.so.* $(1)/usr/lib/
endef

$(eval $(call BuildPackage,libmpd))
