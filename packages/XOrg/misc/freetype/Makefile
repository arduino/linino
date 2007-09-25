# 
# Copyright (C) 2007 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
# blogic@openwrt.org

include $(TOPDIR)/rules.mk

PKG_NAME:=freetype
PKG_VERSION:=2.1.10
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.bz2
PKG_SOURCE_URL:=@SF/freetype/

include $(INCLUDE_DIR)/package.mk

define Package/freetype
  SECTION:=xorg-misc
  CATEGORY:=Xorg
  SUBMENU:=misc
  TITLE:=Freetype font rendering library
endef

define Build/Configure
	(cd $(PKG_BUILD_DIR)/builds/unix; \
		./configure --host=$(GNU_TARGET_NAME) ; \
		$(TARGET_CONFIGURE_OPTS) \
		AC_PROG_LIBTOOL="$(PKG_BUILD_DIR)/builds/unix/libtool"; \
		aclocal -I . ); 
	(cd  $(PKG_BUILD_DIR)/; \
		$(TARGET_CONFIGURE_OPTS) \
		./configure --host=$(GNU_TARGET_NAME) --without-zlib);
endef

define Build/Compile
	$(MAKE) -C $(PKG_BUILD_DIR)
	mkdir -p $(PKG_INSTALL_DIR)
		$(MAKE) -C $(PKG_BUILD_DIR) \
		DESTDIR="$(PKG_INSTALL_DIR)" \
		install
endef

define Build/InstallDev
	$(CP) -r $(PKG_BUILD_DIR)/include/* $(STAGING_DIR)/include/
	$(CP) $(PKG_INSTALL_DIR)/usr/local/lib/libfreetype.so* $(STAGING_DIR)/usr/lib/
	$(CP) $(PKG_BUILD_DIR)/builds/unix/freetype2.pc $(STAGING_DIR)/usr/lib/pkgconfig/
endef

define Package/freetype/install
	$(INSTALL_DIR) $(1)/usr/lib
	$(CP) $(PKG_INSTALL_DIR)/usr/local/lib/libfreetype.so* $(1)/usr/lib/
endef

$(eval $(call BuildPackage,freetype))
