#
# Copyright (C) 2006-2008 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
# $Id$

include $(TOPDIR)/rules.mk

PKG_NAME:=libgphoto2
PKG_VERSION:=2.4.1
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.bz2
PKG_SOURCE_URL:=@SF/gphoto
PKG_MD5SUM:=70c7d2c3e84997f29b4e988e56bd02aa

PKG_FIXUP = libtool

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

TARGET_CFLAGS += $(FPIC)

CONFIGURE_ARGS += \
	--enable-shared \
	--enable-static \
	--disable-rpath \
	--with-drivers=all \
	--without-included-ltdl \
	--without-libiconv-prefix \
	--without-libintl-prefix \

CONFIGURE_VARS += \
	CPPFLAGS="$$$$CPPFLAGS -I$(STAGING_DIR)/usr/lib/libiconv/include" \
	LDFLAGS="$$$$LDFLAGS -L$(STAGING_DIR)/usr/lib/libiconv/lib" \
	LIBEXIF_CFLAGS="$$$$CPPFLAGS" \
	LIBEXIF_LIBS="$$$$LDFLAGS -lexif" \
	LIBUSB_CFLAGS="$$$$CPPFLAGS" \
	LIBUSB_LIBS="$$$$LDFLAGS -lusb" \
	LIBS="-lltdl" \

define Build/Compile
	$(MAKE) -C $(PKG_BUILD_DIR) \
		DESTDIR="$(PKG_INSTALL_DIR)" \
		LIBLTDL="" \
		all install
endef

define Build/InstallDev
	mkdir -p $(1)/usr/bin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/usr/bin/gphoto2{,-port}-config $(1)/usr/bin/
	mkdir -p $(1)/usr/include
	$(CP) $(PKG_INSTALL_DIR)/usr/include/gphoto2 $(1)/usr/include/
	mkdir -p $(1)/usr/lib
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/libgphoto2{,_port}.{a,so*} $(1)/usr/lib/
	mkdir -p $(1)/usr/lib/pkgconfig
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/pkgconfig/libgphoto2.pc $(1)/usr/lib/pkgconfig/
	$(SED) 's,-I$$$${prefix}/include/gphoto2,,g' $(1)/usr/bin/gphoto2{,-port}-config
	$(SED) 's,-I$$$${prefix}/include,,g' $(1)/usr/bin/gphoto2{,-port}-config
	# remove annoying recursive symlink
	rm -f $(1)/usr/include/gphoto2/gphoto2
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
