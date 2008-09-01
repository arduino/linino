# 
# Copyright (C) 2006 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
# blogic@openwrt.org

include $(TOPDIR)/rules.mk

PKG_NAME:=pango
PKG_VERSION:=1.20.5
PKG_RELEASE:=2

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.bz2
PKG_SOURCE_URL:=@GNOME/$(PKG_NAME)/1.20/
PKG_MD5SUM:=052b60a12f6b2eb4f251ab961f2b2b84
PKG_FIXUP:=libtool

include $(INCLUDE_DIR)/package.mk

EXTRA_LDFLAGS:=-Wl,-rpath-link=$(STAGING_DIR)/usr/lib \
               -L$(STAGING_DIR)/usr/lib/libiconv/lib/ \
			   -L$(STAGING_DIR)/usr/lib/libintl/lib/ 

define Package/pango
  SECTION:=xorg-libs
  CATEGORY:=Xorg
  SUBMENU:=libraries
  TITLE:=Text layout and rendering library
  DEPENDS:=+xorg-server-essentials +cairo +glib2
endef

define Package/pango/description
Pango is a library for layout and rendering of text, with an emphasis
on internationalization. Pango can be used anywhere that text layout
is needed; however, most of the work on Pango so far has been done using
the GTK+ widget toolkit as a test platform. Pango forms the core of text
and font handling for GTK+-2.x.
endef

define Build/Compile
	$(MAKE) -C $(PKG_BUILD_DIR)
	$(INSTALL_DIR) $(PKG_INSTALL_DIR)/usr/{lib/pkgconfig,include/pango-1.0/pango/,bin/,lib/pango/1.6.0/modules}
	$(CP) $(PKG_BUILD_DIR)/pango/.libs/*so* $(PKG_INSTALL_DIR)/usr/lib/
	rm -f $(PKG_INSTALL_DIR)/usr/lib/*T
	$(CP) $(PKG_BUILD_DIR)/pango/.libs/pango-querymodules $(PKG_INSTALL_DIR)/usr/bin/
	cd $(PKG_BUILD_DIR) ;for a in `find -name pango-*.so`; do cp $$$$a $(PKG_INSTALL_DIR)/usr/lib/pango/1.6.0/modules/;done
	$(CP) $(PKG_BUILD_DIR)/pango/*.la $(PKG_INSTALL_DIR)/usr/lib/
	$(CP) $(PKG_BUILD_DIR)/*.pc $(PKG_INSTALL_DIR)/usr/lib/pkgconfig/
	rm $(PKG_INSTALL_DIR)/usr/lib/pkgconfig/*uninstalled.pc
	$(CP) $(PKG_BUILD_DIR)/pango/*.h $(PKG_INSTALL_DIR)/usr/include/pango-1.0/pango/
endef

define Build/InstallDev
	$(INSTALL_DIR) $(1)/usr/{lib,include}
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/lib* $(1)/usr/lib
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/pango/ $(1)/usr/lib
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/pkgconfig/ $(1)/usr/lib/
	$(CP) $(PKG_INSTALL_DIR)/usr/include/* $(1)/usr/include/
	$(SED) 's,Libs:,Libs: -L$$$${libdir}/libiconv/lib/ -L$$$${libdir}/libintl/lib/ ,g' $(1)/usr/lib/pkgconfig/pango*.pc
endef

define Package/pango/install
	$(INSTALL_DIR) $(1)/usr/{lib,bin}
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/lib*so* $(1)/usr/lib/
	$(CP) $(PKG_INSTALL_DIR)/usr/bin/* $(1)/usr/bin
	$(CP) -r $(PKG_INSTALL_DIR)/usr/lib/pango/ $(1)/usr/lib
	$(INSTALL_DIR) $(1)/etc/init.d/
	$(INSTALL_BIN) ./files/pango-querymodules.init $(1)/etc/init.d/pango-querymodules
endef

$(eval $(call BuildPackage,pango))
