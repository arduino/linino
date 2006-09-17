# 
# Copyright (C) 2006 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
# $Id: $

include $(TOPDIR)/rules.mk

PKG_NAME:=gphoto2
PKG_VERSION:=2.2.0
PKG_RELEASE:=1

PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)-$(PKG_VERSION)
PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.bz2
PKG_SOURCE_URL:=@SF/gphoto
PKG_MD5SUM:=f5c1f83185db598b4ca52889964a5e84
PKG_CAT:=bzcat

PKG_INSTALL_DIR:=$(PKG_BUILD_DIR)/ipkg-install

include $(INCLUDE_DIR)/package.mk

define Package/gphoto2
  SECTION:=multimedia
  CATEGORY:=Multimedia
  DEPENDS:=+libusb +libexif +libpopt +libgphoto2
  TITLE:=Gphoto Digital Camera Control
  DESCRIPTION:=For downloading and controlling digital cameras
  URL:=http://www.gphoto.org
endef

BIG_ENDIAN:=no
ifeq ($(ARCH),mips)
BIG_ENDIAN:=yes
endif
ifeq ($(ARCH),armeb)
BIG_ENDIAN:=yes
endif
ifeq ($(ARCH),powerpc)
BIG_ENDIAN:=yes
endif

define Build/Configure
$(call Build/Configure/Default,--without-libiconv-prefix \
		--without-libintl-prefix \
		$(DISABLE_LARGEFILE) \
		$(DISABLE_NLS) \
		--enable-shared \
		--enable-static,LIBGPHOTO2_CFLAGS="$(TARGET_CFLAGS) -I$(STAGING_DIR)/usr/include -I$(STAGING_DIR)/usr/include/gphoto2" \
		LIBGPHOTO2_LIBS="-L$(STAGING_DIR)/usr/lib -lgphoto2_port -lgphoto2" \
		LIBEXIF_CFLAGS="$(TARGET_CFLAGS) -I$(STAGING_DIR)/usr/include" \
		LIBEXIF_LIBS="-L$(STAGING_DIR)/usr/lib -lexif" \
		POPT_CFLAGS="$(TARGET_CFLAGS) -I$(STAGING_DIR)/usr/include" \
		POPT_LIBS="-L$(STAGING_DIR)/usr/lib -lpopt" \
		ac_cv_c_bigendian=$(BIG_ENDIAN) \
		ac_cv_func_malloc_0_nonnull=yes)
endef

define Build/Compile
$(call Build/Compile/Default,DESTDIR="$(PKG_INSTALL_DIR)" \
	all install)
endef

define Package/gphoto2/install
	install -d -m0755 $(1)/usr/bin
	$(CP) $(PKG_INSTALL_DIR)/usr/bin/gphoto2 $(1)/usr/bin/
endef


$(eval $(call BuildPackage,gphoto2))
