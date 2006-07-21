# 
# Copyright (C) 2006 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
# $Id: Makefile 4153 2006-07-18 16:58:52Z florian $

include $(TOPDIR)/rules.mk

PKG_NAME:=jpeg
PKG_VERSION:=6b
PKG_RELEASE:=1

PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)-$(PKG_VERSION)
PKG_SOURCE:=$(PKG_NAME)src.v$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=http://www.ijg.org/files/ \
        ftp://ftp.uu.net/graphics/jpeg/
PKG_MD5SUM:=dbd5f3b47ed13132f04c685d608a7547
PKG_CAT:=zcat

PKG_INSTALL_DIR:=$(PKG_BUILD_DIR)/ipkg-install

include $(INCLUDE_DIR)/package.mk

define Package/libjpeg
  SECTION:=libs
  CATEGORY:=Libraries
  TITLE:=The Independent JPEG Group's JPEG runtime library
  DESCRIPTION:=The Independent JPEG Group's JPEG runtime library.
  URL:=http://www.ijg.org/
endef

define Build/Configure
$(call Build/Configure/Default,--enable-shared --enable-static)
endef

define Build/Compile
	rm -rf $(PKG_INSTALL_DIR)
	mkdir -p $(PKG_INSTALL_DIR)/usr/{include,lib}
	$(MAKE) -C $(PKG_BUILD_DIR) \
		prefix="$(PKG_INSTALL_DIR)/usr" \
		exec_prefix="$(PKG_INSTALL_DIR)/usr" \
		install-headers install-lib
endef

define Package/libjpeg/install
	install -m0755 -d $(1)/usr/lib
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/libjpeg.so.* $(1)/usr/lib/
endef

define Build/InstallDev
	mkdir -p $(STAGING_DIR)/usr/include
	$(CP) $(PKG_INSTALL_DIR)/usr/include/jpeglib.h $(STAGING_DIR)/usr/include/
	$(CP) $(PKG_BUILD_DIR)/jpegint.h $(STAGING_DIR)/usr/include
	$(CP) $(PKG_INSTALL_DIR)/usr/include/j{config,error,morecfg}.h $(STAGING_DIR)/usr/include
	mkdir -p $(STAGING_DIR)/usr/lib
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/libjpeg.{a,so*} $(STAGING_DIR)/usr/lib/
endef

define Build/UninstallDev
	rm -rf $(STAGING_DIR)/usr/include/jpeg{int,lib}.h \
		$(STAGING_DIR)/usr/include/j{config,error,morecfg}.h \
		$(STAGING_DIR)/usr/lib/libjpeg.{a,so*}
endef

$(eval $(call BuildPackage,libjpeg))
