# 
# Copyright (C) 2006 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
# $Id: $

include $(TOPDIR)/rules.mk

PKG_NAME:=libgphoto2
PKG_VERSION:=2.2.1
PKG_RELEASE:=1

PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)-$(PKG_VERSION)
PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.bz2
PKG_SOURCE_URL:=@SF/gphoto
PKG_MD5SUM:=69827311733e39fafa9f77bb05e55b77
PKG_CAT:=bzcat

PKG_INSTALL_DIR:=$(PKG_BUILD_DIR)/ipkg-install

include $(INCLUDE_DIR)/package.mk

define Package/libgphoto2
  SECTION:=libs
  CATEGORY:=Libraries
  MENU:=1
  TITLE:=The basic library of the gphoto2 program.
  DESCRIPTION:=The ports library of the gphoto2 program.
  URL:=http://www.gphoto.org/
  DEPENDS:=+libusb +libexif +libjpeg +libpthread
endef

define Package/libgphoto2-drivers
  SECTION:=libs
  CATEGORY:=Libraries
  TITLE:=Gphoto2 drivers for various cameras
  DESCRIPTION:=Gphoto2 drivers for various cameras
  URL:=http://www.gphoto.org/
  DEPENDS:=libgphoto2
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
	(cd $(PKG_BUILD_DIR); rm -f config.cache; \
		$(TARGET_CONFIGURE_OPTS) \
		CFLAGS="$(TARGET_CFLAGS)" \
		CPPFLAGS="-I$(STAGING_DIR)/usr/include"  \
		LDFLAGS="-L$(STAGING_DIR)/usr/lib" \
		LIBUSB_CFLAGS="-I$(STAGING_DIR)/usr/include" \
		LIBUSB_LIBS="-L$(STAGING_DIR)/usr/lib -lusb" \
		LIBEXIF_CFLAGS="-I$(STAGING_DIR)/usr/include" \
		LIBEXIF_LIBS="-L$(STAGING_DIR)/usr/lib -lexif" \
		ac_cv_c_gettext_without_libintl=yes \
		ac_cv_c_bigendian=$(BIG_ENDIAN) \
		./configure \
			--target=$(GNU_TARGET_NAME) \
			--host=$(GNU_TARGET_NAME) \
			--build=$(GNU_HOST_NAME) \
			--program-prefix="" \
			--program-suffix="" \
			--prefix=/usr \
			--exec-prefix=/usr \
			--bindir=/usr/bin \
			--datadir=/usr/share \
			--includedir=/usr/include \
			--infodir=/usr/share/info \
			--libdir=/usr/lib \
			--libexecdir=/usr/lib \
			--localstatedir=/var \
			--mandir=/usr/share/man \
			--sbindir=/usr/sbin \
			--sysconfdir=/etc \
			--without-libiconv-prefix \
			--without-libintl-prefix \
			--without-libiconv \
			--without-libintl \
			--disable-nls \
			$(DISABLE_LARGEFILE) \
			--enable-shared \
			--enable-static \
			--with-drivers=all \
	);
endef

define Build/Compile
$(call Build/Compile/Default,-j$(CONFIG_JLEVEL) \
		CC=$(TARGET_CC) LD=$(TARGET_CROSS)ld ARCH=$(ARCH) \
		DESTDIR="$(PKG_INSTALL_DIR)" \
		all install)
endef

define Package/libgphoto2/install
	install -m0755 -d $(1)/usr/lib
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/*.so* $(1)/usr/lib/
endef

define Package/libgphoto2-drivers/install
	install -m0755 -d $(1)/usr/lib/
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/libgphoto2 $(1)/usr/lib/
endef

define Build/InstallDev
	mkdir -p $(STAGING_DIR)/usr/bin
	$(CP) $(PKG_INSTALL_DIR)/usr/bin/gphoto2-config $(STAGING_DIR)/usr/bin/
	$(CP) $(PKG_INSTALL_DIR)/usr/bin/gphoto2-port-config $(STAGING_DIR)/usr/bin/
	mkdir -p $(STAGING_DIR)/usr/include
	$(CP) $(PKG_INSTALL_DIR)/usr/include/gphoto2 $(STAGING_DIR)/usr/include/
	mkdir -p $(STAGING_DIR)/usr/lib
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/libgphoto*.{a,so*} $(STAGING_DIR)/usr/lib/
endef

define Build/UninstallDev
	rm -rf \
		$(STAGING_DIR)/usr/bin/gphoto2-config \
		$(STAGING_DIR)/usr/bin/gphoto2-port-config \
		$(STAGING_DIR)/usr/include/gphoto2* \
		$(STAGING_DIR)/usr/lib/libgphoto*.{a,so*}
endef

$(eval $(call BuildPackage,libgphoto2))
$(eval $(call BuildPackage,libgphoto2-drivers))
