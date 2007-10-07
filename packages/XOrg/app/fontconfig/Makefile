# 
# Copyright (C) 2007 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
# blogic@openwrt.org

include $(TOPDIR)/rules.mk

PKG_NAME:=fontconfig
PKG_VERSION:=2.3.95
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=http://fontconfig.org/release/

include $(INCLUDE_DIR)/package.mk

CONFIGURE_ARGS+=LIBS="-Wl,-rpath-link=$(STAGING_DIR)/usr/lib" --disable-docs

define Package/fontconfig
  SECTION:=xorg-util
  CATEGORY:=Xorg
  SUBMENU:=font-utils
  TITLE:=fontconfig
  DEPENDS:=+xorg-server-essentials +libexpat 
endef

define Build/Configure
	cd  $(PKG_BUILD_DIR)/; \
		$(TARGET_CONFIGURE_OPTS) \
		$(CONFIGURE_VARS) \
		$(CONFIGURE_CMD) \
			$(CONFIGURE_ARGS_XTRA) \
			$(CONFIGURE_ARGS) 
endef

define Build/Compile
	$(foreach dir,fc-case fc-lang fc-glyphname, $(MAKE) -C $(PKG_BUILD_DIR)/$(dir) CFLAGS="";)
	$(MAKE) -C $(PKG_BUILD_DIR) 
	$(MAKE) -C $(PKG_BUILD_DIR) DESTDIR="$(PKG_INSTALL_DIR)" install
endef

define Package/fontconfig/install
	$(INSTALL_DIR) $(1)/usr/lib
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/lib*so* $(1)/usr/lib
endef

define Build/InstallDev
	$(INSTALL_DIR) $(1)/usr/{lib,include}
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/lib* $(1)/usr/lib
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/pkgconfig/ $(1)/usr/lib/
	$(CP) $(PKG_INSTALL_DIR)/usr/include/* $(1)/usr/include/
	$(SED)  "s,"libdir\=\'/usr/lib\'",libdir='$(1)/usr/lib\'," $(1)/usr/lib/libfontconfig.la
endef

$(eval $(call BuildPackage,fontconfig))
