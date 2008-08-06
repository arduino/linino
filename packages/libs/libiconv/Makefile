#
# Copyright (C) 2006 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
# $Id$

include $(TOPDIR)/rules.mk

PKG_NAME:=libiconv
PKG_VERSION:=1.9.1
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=@GNU/libiconv
PKG_MD5SUM:=0c99a05e0c3c153bac1c960f78711155

PKG_FIXUP = libtool

include $(INCLUDE_DIR)/package.mk

define Package/libiconv
  SECTION:=libs
  CATEGORY:=Libraries
  TITLE:=Character set conversion library
  URL:=http://www.gnu.org/software/libiconv/
endef

TARGET_CFLAGS += $(FPIC)

CONFIGURE_ARGS += \
	--enable-shared \
	--enable-static \
	--disable-rpath \

define Build/Compile
	$(MAKE) -C $(PKG_BUILD_DIR) CC="$(TARGET_CC)"
	$(MAKE) -C $(PKG_BUILD_DIR) \
		includedir="$(PKG_INSTALL_DIR)/usr/include" \
		libdir="$(PKG_INSTALL_DIR)/usr/lib" \
		install-lib
endef

define Build/InstallDev
	mkdir -p $(1)/usr/lib/libiconv/include
	$(CP) $(PKG_INSTALL_DIR)/usr/include/iconv.h $(1)/usr/lib/libiconv/include/
	mkdir -p $(1)/usr/lib/libiconv/lib
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/libiconv.{a,so*} $(1)/usr/lib/libiconv/lib/
endef

define Package/libiconv/install
	$(INSTALL_DIR) $(1)/usr/lib
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/libiconv.so.* $(1)/usr/lib/
endef

$(eval $(call BuildPackage,libiconv))
