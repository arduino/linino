# 
# Copyright (C) 2011-2013 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=libjpeg-turbo
PKG_VERSION:=1.2.1
PKG_RELEASE:=2

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=@SF/libjpeg-turbo
PKG_MD5SUM:=f61e60ff01381ece4d2fe65eeb52669e

PKG_LICENSE:=BSD-3c
PKG_LICENSE_FILES:=README-turbo.txt

PKG_BUILD_PARALLEL:=1

include $(INCLUDE_DIR)/host-build.mk
include $(INCLUDE_DIR)/package.mk

define Package/libjpeg-turbo/Default
  TITLE:=Fork of libjpeg with performance improvements
  URL:=http://libjpeg-turbo.virtualgl.org/
endef

define Package/libjpeg-turbo
  $(call Package/libjpeg-turbo/Default)
  SECTION:=libs
  CATEGORY:=Libraries
  TITLE+= runtime library
endef

define Package/jpeg-tools
  $(call Package/libjpeg-turbo/Default)
  SECTION:=utils
  CATEGORY:=Utilities
  DEPENDS:=+libjpeg-turbo
  TITLE+= manipulation tools
endef

define Package/libjpeg-turbo-tests
  $(call Package/libjpeg-turbo/Default)
  SECTION:=utils
  CATEGORY:=Utilities
  DEPENDS:=+libjpeg-turbo
  TITLE+= testing utilities
endef

TARGET_CFLAGS += $(FPIC)

CONFIGURE_ARGS += \
	--enable-shared \
	--enable-static \
	--with-jpeg8 \
	--without-simd \

#
# libjpegturbo.{a,so} provides the TurboJPEG/OSS interface. 
# No known use in OpenWRT at this time. 14/11/11
#

define Build/InstallDev
	$(INSTALL_DIR) $(1)/usr/include
	$(CP) $(PKG_BUILD_DIR)/jpeglib.h $(1)/usr/include/
	$(CP) $(PKG_BUILD_DIR)/jpegint.h $(1)/usr/include/
	$(CP) $(PKG_BUILD_DIR)/j{config,error,morecfg}.h $(1)/usr/include/
	$(INSTALL_DIR) $(1)/usr/lib
	$(CP) $(PKG_BUILD_DIR)/.libs/libjpeg.{a,so*} $(1)/usr/lib/
#	$(CP) $(PKG_BUILD_DIR)/.libs/libturbojpeg.{a,so*} $(1)/usr/lib/
endef

define Package/libjpeg-turbo/install
	$(INSTALL_DIR) $(1)/usr/lib
	$(CP) $(PKG_BUILD_DIR)/.libs/libjpeg.{a,so*} $(1)/usr/lib/
endef

define Package/jpeg-tools/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/.libs/{c,d}jpeg $(1)/usr/bin/
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/.libs/jpegtran $(1)/usr/bin/
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/.libs/{rd,wr}jpgcom $(1)/usr/bin/
endef

define Package/libjpeg-turbo-tests/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/.libs/tjbench $(1)/usr/bin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/.libs/tjunittest $(1)/usr/bin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/.libs/jcstest $(1)/usr/bin
	$(INSTALL_DIR) $(1)/usr/lib
	$(CP) $(PKG_BUILD_DIR)/.libs/libturbojpeg.{a,so*} $(1)/usr/lib/
endef

$(eval $(call HostBuild))
$(eval $(call BuildPackage,libjpeg-turbo))
$(eval $(call BuildPackage,jpeg-tools))
$(eval $(call BuildPackage,libjpeg-turbo-tests))
