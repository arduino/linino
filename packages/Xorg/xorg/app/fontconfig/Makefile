#
# Copyright (C) 2008 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=fontconfig
PKG_VERSION:=2.3.95
PKG_RELEASE:=2

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=http://fontconfig.org/release/
PKG_MD5SUM:=6860be35882f6d34636d52345efd5944
PKG_FIXUP:=libtool

include $(INCLUDE_DIR)/package.mk

define Package/fontconfig
  SECTION:=xorg-util
  CATEGORY:=Xorg
  SUBMENU:=font-utils
  TITLE:=fontconfig
  DEPENDS:=+libX11 +libexpat +libfreetype
endef

define Build/Configure
	$(call Build/Configure/Default, \
		--disable-docs, \
		ac_cv_prog_HASDOCBOOK=no \
	)
endef

define Build/Compile
	$(foreach dir,fc-case fc-lang fc-glyphname src fc-cache fc-list, $(MAKE) -C $(PKG_BUILD_DIR)/$(dir) CFLAGS="-I$(STAGING_DIR)/usr/include"  \
			CPPFLAGS="" LDFLAGS="-L$(STAGING_DIR)/usr/lib";)
	$(MAKE) -C $(PKG_BUILD_DIR) DESTDIR="$(PKG_INSTALL_DIR)" DOCSRC="" install
endef

define Package/fontconfig/install
	$(INSTALL_DIR) $(1)/usr/lib
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/lib*so* $(1)/usr/lib
	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/usr/bin/* $(1)/usr/bin
	$(INSTALL_DIR) $(1)/etc/fonts/conf.d
	$(INSTALL_DATA) $(PKG_INSTALL_DIR)/etc/fonts/fonts.* $(1)/etc/fonts
	$(INSTALL_DATA) $(PKG_INSTALL_DIR)/etc/fonts/conf.d/* $(1)/etc/fonts/conf.d
endef

define Build/InstallDev
	$(INSTALL_DIR) $(1)/usr/{lib,include}
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/lib* $(1)/usr/lib
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/pkgconfig/ $(1)/usr/lib/
	$(CP) $(PKG_INSTALL_DIR)/usr/include/* $(1)/usr/include/
endef

$(eval $(call BuildPackage,fontconfig))
