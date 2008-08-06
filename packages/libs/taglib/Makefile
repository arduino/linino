# 
# Copyright (C) 2007 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
# $Id$

include $(TOPDIR)/rules.mk

PKG_NAME:=taglib
PKG_VERSION:=1.4
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=http://developer.kde.org/~wheeler/files/src/
PKG_MD5SUM:=dcd50ddb2544faeae77f194804559404

include $(INCLUDE_DIR)/package.mk

define Package/taglib
  SECTION:=libs
  CATEGORY:=Libraries
  DEPENDS:= +uclibcxx +zlib @!TARGET_avr32
  TITLE:=Audio output library
  URL:=http://developer.kde.org/~wheeler/taglib.html
endef

TARGET_CFLAGS += $(FPIC)

CONFIGURE_ARGS += \
	--enable-shared \
	--enable-static \
	--enable-final \

CONFIGURE_VARS += \
        CPPFLAGS="$$$$CPPFLAGS -I$(STAGING_DIR)/usr/include/uClibc++" \
        CXXFLAGS="$$$$CXXFLAGS -fno-builtin -fno-rtti -nostdinc++" \
	LDFLAGS="$$$$LDFLAGS" \
	LIBS="-nodefaultlibs -lz -luClibc++" \

define Build/Compile
	$(MAKE) -C $(PKG_BUILD_DIR) \
		DESTDIR="$(PKG_INSTALL_DIR)" \
		all install
endef

define Build/InstallDev
	mkdir -p $(1)/usr/bin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/usr/bin/taglib-config $(1)/usr/bin/
	mkdir -p $(1)/usr/lib
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/libtag.{a,so*} $(1)/usr/lib/
	mkdir -p $(1)/usr/include/taglib
	$(CP) $(PKG_INSTALL_DIR)/usr/include/taglib/* $(1)/usr/include/taglib/
endef

define Package/taglib/install
	$(INSTALL_DIR) $(1)/usr/lib
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/libtag.so.* $(1)/usr/lib/
endef

$(eval $(call BuildPackage,taglib))
