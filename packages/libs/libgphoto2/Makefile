# 
# Copyright (C) 2006 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
# $Id$

include $(TOPDIR)/rules.mk

PKG_NAME:=libgphoto2
PKG_VERSION:=2.3.1
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.bz2
PKG_SOURCE_URL:=@SF/gphoto
PKG_MD5SUM:=37f85e34e5b6031ddf6cac8b8782ac4f
PKG_CAT:=bzcat

PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)-$(PKG_VERSION)
PKG_INSTALL_DIR:=$(PKG_BUILD_DIR)/ipkg-install

include $(INCLUDE_DIR)/package.mk


define Package/libgphoto2/Default
  SECTION:=libs
  CATEGORY:=Libraries
  URL:=http://www.gphoto.org/
endef

define Package/libgphoto2
  $(call Package/libgphoto2/Default)
  DEPENDS:=+libusb +libexif +libjpeg +libpthread +libltdl +libiconv
  TITLE:=The basic library of the gphoto2 program.
  MENU:=1
endef

define Package/libgphoto2-drivers
  $(call Package/libgphoto2/Default)
  DEPENDS:=libgphoto2
  TITLE:=Gphoto2 drivers for various cameras
endef

define Build/Configure
	$(call Build/Configure/Default, \
		--enable-shared \
		--enable-static \
		--disable-rpath \
		--with-drivers=all \
		--without-included-ltdl \
		--without-libiconv-prefix \
		--without-libintl-prefix \
		, \
		CPPFLAGS="$$$$CPPFLAGS -I$(STAGING_DIR)/usr/lib/libiconv/include" \
		LDFLAGS="$$$$LDFLAGS -L$(STAGING_DIR)/usr/lib/libiconv/lib" \
		LIBEXIF_CFLAGS="$$$$CPPFLAGS" \
		LIBEXIF_LIBS="$$$$LDFLAGS -lexif" \
		LIBUSB_CFLAGS="$$$$CPPFLAGS" \
		LIBUSB_LIBS="$$$$LDFLAGS -lusb" \
		LIBS="-lltdl" \
	)
endef

define Build/Compile
	$(MAKE) -C $(PKG_BUILD_DIR) -j$(CONFIG_JLEVEL) \
		DESTDIR="$(PKG_INSTALL_DIR)" \
		LIBLTDL="" \
		all install
endef

define Build/InstallDev
	mkdir -p $(STAGING_DIR)/usr/bin
	$(CP) $(PKG_INSTALL_DIR)/usr/bin/gphoto2{,-port}-config $(STAGING_DIR)/usr/bin/
	mkdir -p $(STAGING_DIR)/usr/include
	$(CP) $(PKG_INSTALL_DIR)/usr/include/gphoto2 $(STAGING_DIR)/usr/include/
	mkdir -p $(STAGING_DIR)/usr/lib
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/libgphoto2{,_port}.{a,so*} $(STAGING_DIR)/usr/lib/
	mkdir -p $(STAGING_DIR)/usr/lib/pkgconfig
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/pkgconfig/libgphoto2.pc $(STAGING_DIR)/usr/lib/pkgconfig/
	$(SED) 's,-I$$$${prefix}/include/gphoto2,,g' $(STAGING_DIR)/usr/bin/gphoto2{,-port}-config
	$(SED) 's,-I$$$${prefix}/include,,g' $(STAGING_DIR)/usr/bin/gphoto2{,-port}-config
	$(SED) 's,-L$$$${exec_prefix}/lib,,g' $(STAGING_DIR)/usr/lib/pkgconfig/libgphoto2.pc
	$(SED) 's,-I$$$${includedir}/gphoto2,,g' $(STAGING_DIR)/usr/lib/pkgconfig/libgphoto2.pc
	$(SED) 's,-L$$$${libdir},,g' $(STAGING_DIR)/usr/lib/pkgconfig/libgphoto2.pc
	# remove annoying recursive symlink
	rm -f $(STAGING_DIR)/usr/include/gphoto2/gphoto2
endef

define Build/UninstallDev
	rm -rf \
		$(STAGING_DIR)/usr/bin/gphoto2-config \
		$(STAGING_DIR)/usr/bin/gphoto2-port-config \
		$(STAGING_DIR)/usr/include/gphoto2* \
		$(STAGING_DIR)/usr/lib/libgphoto*.{a,so*}
endef

define Package/libgphoto2/install
	$(INSTALL_DIR) $(1)/usr/lib
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/libgphoto2{,_port}.so.* $(1)/usr/lib/
endef

define Package/libgphoto2-drivers/install
	$(INSTALL_DIR) $(1)/usr/lib/
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/libgphoto2{,_port} $(1)/usr/lib/
	rm -rf $(1)/usr/lib/libgphoto2{,_port}/*/*.{,l}a
endef

$(eval $(call BuildPackage,libgphoto2))
$(eval $(call BuildPackage,libgphoto2-drivers))
