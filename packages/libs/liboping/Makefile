#
# Copyright (C) 2009 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=liboping
PKG_VERSION:=1.3.2
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.bz2
PKG_SOURCE_URL:=http://verplant.org/liboping/files
PKG_MD5SUM:=f549c6f1f4d1dbef4dc7cc823badc20b

PKG_FIXUP = libtool

include $(INCLUDE_DIR)/host-build.mk
include $(INCLUDE_DIR)/package.mk

define Package/liboping
  SECTION:=libs
  CATEGORY:=Libraries
  TITLE:=liboping is a C library to generate ICMP echo requests.
  URL:=http://verplant.org/liboping/
endef


TARGET_CFLAGS += $(FPIC)

CONFIGURE_ARGS += \
	--without-perl-bindings \
	--enable-shared \
	--enable-static

define Build/Compile
	$(MAKE) -C $(PKG_BUILD_DIR) \
		DESTDIR="$(PKG_INSTALL_DIR)" \
		all install
endef

define Build/InstallDev
	$(INSTALL_DIR) $(1)/usr/include
	$(CP) $(PKG_INSTALL_DIR)/usr/include/oping.h $(1)/usr/include/
	$(INSTALL_DIR) $(1)/usr/lib
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/liboping.{a,so*} $(1)/usr/lib/
endef

define Package/liboping/install	
	$(INSTALL_DIR) $(1)/usr/lib
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/liboping.so* $(1)/usr/lib/
endef

$(eval $(call BuildPackage,liboping))
