#
# Copyright (C) 2008-2009 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=fontconfig
PKG_VERSION:=2.6.0
PKG_RELEASE:=2

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=http://fontconfig.org/release/
PKG_MD5SUM:=ab54ec1d4ddd836313fdbc0cd5299d6d
PKG_FIXUP:=libtool
PKG_INSTALL:=1

include $(INCLUDE_DIR)/package.mk

define Package/fontconfig
  SECTION:=xorg-util
  CATEGORY:=Xorg
  SUBMENU:=font-utils
  TITLE:=fontconfig
  DEPENDS:=+libX11 +libexpat +libfreetype
endef

CONFIGURE_ARGS+= \
	--disable-docs \
	--with-cache-dir=/usr/share/fontconfig/cache \
	--with-arch=$(ARCH) \

CONFIGURE_VARS+= \
	ac_cv_prog_HASDOCBOOK=no \

define Build/Compile
	$(foreach dir,fc-arch fc-case fc-lang fc-glyphname, \
		$(MAKE) -C $(PKG_BUILD_DIR)/$(dir) CFLAGS="$(HOST_CFLAGS)"  \
			CPPFLAGS="" LDFLAGS="$(HOST_LDFLAGS)" || exit 1;)
	$(MAKE) -C $(PKG_BUILD_DIR) DESTDIR="$(PKG_INSTALL_DIR)" DOCSRC="" install
endef

define Build/InstallDev
	$(INSTALL_DIR) $(1)/usr/include
	$(CP) $(PKG_INSTALL_DIR)/usr/include/fontconfig $(1)/usr/include/
	$(INSTALL_DIR) $(1)/usr/lib
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/libfontconfig.* $(1)/usr/lib/
	$(INSTALL_DIR) $(1)/usr/lib/pkgconfig
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/pkgconfig/fontconfig.pc $(1)/usr/lib/pkgconfig/
endef

define Package/fontconfig/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/usr/bin/* $(1)/usr/bin/
	$(INSTALL_DIR) $(1)/usr/lib
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/libfontconfig.so.* $(1)/usr/lib/
	$(INSTALL_DIR) $(1)/etc/fonts/conf.avail
	$(INSTALL_DATA) $(PKG_INSTALL_DIR)/etc/fonts/conf.avail/*.conf $(1)/etc/fonts/conf.avail/
	$(INSTALL_DIR) $(1)/etc/fonts/conf.d
	$(CP) $(PKG_INSTALL_DIR)/etc/fonts/conf.d/*.conf $(1)/etc/fonts/conf.d/
	$(INSTALL_DATA) $(PKG_INSTALL_DIR)/etc/fonts/fonts.{conf,dtd} $(1)/etc/fonts/
endef

$(eval $(call BuildPackage,fontconfig))
