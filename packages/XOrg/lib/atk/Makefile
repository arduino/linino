# 
# Copyright (C) 2006 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
# blogic@openwrt.org

include $(TOPDIR)/rules.mk

PKG_NAME:=atk
PKG_VERSION:=1.11.4
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.bz2
PKG_SOURCE_URL:=http://ftp.gnome.org/pub/gnome/sources/atk/1.11/

include $(INCLUDE_DIR)/package.mk

define Package/atk
  SECTION:=xorg-libs
  CATEGORY:=Xorg
  SUBMENU:=libraries
  TITLE:=Accesibility library for gtk+ apps
  DEPENDS:=+xorg-server-essentials +glib2
endef

define Build/Configure
	(cd $(PKG_BUILD_DIR)/$(CONFIGURE_PATH); \
		if [ -x $(CONFIGURE_CMD) ]; then \
			$(CP) $(SCRIPT_DIR)/config.{guess,sub} $(PKG_BUILD_DIR)/ && \
			$(CONFIGURE_VARS) \
			$(CONFIGURE_CMD) \
			$(CONFIGURE_ARGS_XTRA) \
			$(CONFIGURE_ARGS) ;\
		fi \
	)
endef

define Build/Compile
	$(MAKE) -C $(PKG_BUILD_DIR)
	$(MAKE) -C $(PKG_BUILD_DIR)/ install DESTDIR=$(PKG_INSTALL_DIR)
endef

define Build/InstallDev
	$(INSTALL_DIR) $(STAGING_DIR)/usr/{lib,include}
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/lib* $(STAGING_DIR)/usr/lib
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/pkgconfig/ $(STAGING_DIR)/usr/lib/
	$(CP) $(PKG_INSTALL_DIR)/usr/include/* $(STAGING_DIR)/usr/include/
	$(SED)  "s,"prefix\=.*",prefix=$(STAGING_DIR)/usr," $(STAGING_DIR)/usr/lib/pkgconfig/atk.pc
	$(SED)  "s,"exec_prefix\=.*",exec_prefix=$(STAGING_DIR)/usr," $(STAGING_DIR)/usr/lib/pkgconfig/atk.pc
	$(SED)  "s,"libdir\=\'/usr/lib\'",libdir='$(STAGING_DIR)/usr/lib\'," $(STAGING_DIR)/usr/lib/libatk-1.0.la
	$(SED)  "s,Libs:,Libs: -L$(STAGING_DIR)/usr/lib/libiconv/lib/ -L$(STAGING_DIR)/usr/lib/libintl/lib/ ,g" $(STAGING_DIR)/usr/lib/pkgconfig/atk.pc
endef

define Package/atk/Install
	$(INSTALL_DIR) $(1)/usr/lib
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/lib*so* $(1)/usr/lib/
endef

$(eval $(call BuildPackage,atk))
