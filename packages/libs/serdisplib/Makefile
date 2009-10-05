# 
# Copyright (C) 2006-2009 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=serdisplib
PKG_VERSION:=1.97.8
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=@SF/serdisplib
PKG_MD5SUM:=2aa91c43d01d2dfc9fbc1116e3063ae1

include $(INCLUDE_DIR)/package.mk

define Package/serdisplib
  SECTION:=libs
  CATEGORY:=Libraries
  TITLE:=A display control library
  DEPENDS:=@!LINUX_2_4
  URL:=http://serdisplib.sourceforge.net/
endef

define Package/serdisplib/description
	serdisplib is a library to drive serial and parallel displays 
	with built-in controllers.
endef

CONFIGURE_ARGS+= \
	--enable-shared \
	--enable-static \

TARGET_CFLAGS += $(FPIC)

define Build/Compile
	$(MAKE) -C $(PKG_BUILD_DIR) \
		CFLAGS="$(TARGET_CFLAGS) -Wall -Wno-implicit -I../include -I.." \
		all
endef

define Build/InstallDev
	mkdir -p $(1)/usr/include
	$(CP) $(PKG_BUILD_DIR)/include/serdisplib $(1)/usr/include/
	mkdir -p $(1)/usr/lib
	$(CP) $(PKG_BUILD_DIR)/lib/libserdisp.{a,so*} $(1)/usr/lib/
endef

define Package/serdisplib/install
	$(INSTALL_DIR) $(1)/usr/lib
	$(CP) $(PKG_BUILD_DIR)/lib/libserdisp.so.* $(1)/usr/lib
endef

$(eval $(call BuildPackage,serdisplib))
