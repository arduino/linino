# 
# Copyright (C) 2006 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
# blogic@openwrt.org

include $(TOPDIR)/rules.mk

PKG_NAME:=pango
PKG_VERSION:=1.12.3
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.bz2
PKG_SOURCE_URL:=ftp://ftp.gnome.org/pub/gnome/sources/pango/1.12/ 

include $(INCLUDE_DIR)/package.mk

EXTRA_LDFLAGS:=-Wl,-rpath-link=$(STAGING_DIR)/usr/lib -L$(STAGING_DIR)/usr/lib/libiconv/lib/ -L$(STAGING_DIR)/usr/lib/libintl/lib/

define Package/pango
  SECTION:=xorg-libs
  CATEGORY:=Xorg
  SUBMENU:=libraries
  TITLE:=Text layout and rendering library
  DEPENDS:=+xorg-server-essentials +cairo +glib2
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
	#$(MAKE) -C $(PKG_BUILD_DIR)/ install DESTDIR=$(PKG_INSTALL_DIR)
	$(INSTALL_DIR) $(PKG_INSTALL_DIR)/usr/{lib/pkgconfig,include/pango-1.0/pango/}
	$(CP) $(PKG_BUILD_DIR)/pango/.libs/*so* $(PKG_INSTALL_DIR)/usr/lib/
	rm -f $(PKG_INSTALL_DIR)/usr/lib/*T
	$(CP) $(PKG_BUILD_DIR)/pango/*.la $(PKG_INSTALL_DIR)/usr/lib/
	$(CP) $(PKG_BUILD_DIR)/*.pc $(PKG_INSTALL_DIR)/usr/lib/pkgconfig/
	rm $(PKG_INSTALL_DIR)/usr/lib/pkgconfig/*uninstalled.pc
	$(CP) $(PKG_BUILD_DIR)/pango/*.h $(PKG_INSTALL_DIR)/usr/include/pango-1.0/pango/
endef

define Build/InstallDev
	$(INSTALL_DIR) $(1)/usr/{lib,include}
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/lib* $(1)/usr/lib
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/pkgconfig/ $(1)/usr/lib/
	$(CP) $(PKG_INSTALL_DIR)/usr/include/* $(1)/usr/include/
	$(SED)  "s,Libs:,Libs: -L$$$${libdir}/libiconv/lib/ -L$$$${libdir}/libintl/lib/ ,g" $(1)/usr/lib/pkgconfig/pango*.pc
	$(SED)  "s,"libdir\=\'/usr/lib\'",libdir='$(1)/usr/lib\'," $(1)/usr/lib/libpango*.la
endef

define Package/pango/Install
	$(INSTALL_DIR) $(1)/usr/lib
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/lib*so* $(1)/usr/lib/
endef

$(eval $(call BuildPackage,pango))
