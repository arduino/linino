# 
# Copyright (C) 2012 OpenWrt.org
#
# This is free software, licensed under the wxWindows Library Licence, Version 3.1.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=libjpeg-turbo
PKG_VERSION:=1.1.1
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=@SF/libjpeg-turbo
PKG_MD5SUM:=03b9c1406c7bfdc204313c2917ce6962

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
#	$(CP) $(PKG_BUILD_DIR)/.libs/libturbojpeg.{a,so*} $(1)/usr/lib/
endef

define Package/jpeg-tools/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/.libs/{c,d}jpeg $(1)/usr/bin/
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/.libs/jpeg{tran,gut} $(1)/usr/bin/
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/.libs/{rd,wr}jpgcom $(1)/usr/bin/
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/.libs/jpgtest $(1)/usr/bin/
endef

$(eval $(call HostBuild))
$(eval $(call BuildPackage,libjpeg-turbo))
$(eval $(call BuildPackage,jpeg-tools))
