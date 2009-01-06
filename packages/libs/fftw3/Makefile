# 
# Copyright (C) 2007 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
# $Id: $

include $(TOPDIR)/rules.mk

PKG_NAME:=fftw3
PKG_VERSION:=3.1.2


PKG_SOURCE_URL:=http://www.fftw.org/
PKG_SOURCE:=fftw-3.1.2.tar.gz
PKG_MD5SUM:=08f2e21c9fd02f4be2bd53a62592afa4

PKG_BUILD_DIR:=$(BUILD_DIR)/fftw-$(PKG_VERSION)
PKG_INSTALL_DIR:=$(PKG_BUILD_DIR)/ipkg-install

include $(INCLUDE_DIR)/package.mk

define Package/fftw3
  SECTION:=Libraries
  CATEGORY:=Libraries
  DEPENDS:=@!avr32
  TITLE:=Fast Fourier transform library
  URL:=http://www.fftw.org/
endef

define Package/fftw3/description
	FFTW is a collection of fast C routines for computing the
	Discrete Fourier Transform in one or more dimensions. It
	includes complex, real, and parallel transforms, and can
	handle arbitrary array sizes efficiently.
	http://www.fftw.org/
endef

TARGET_CFLAGS += $(FPIC)

CONFIGURE_ARGS += \
	--prefix=/usr \
	--without-libiconv-prefix \
	--without-libintl-prefix \
	--disable-nls \
	--enable-shared \
	--enable-threads \
	--enable-double \
	--enable-type-prefix \
	--disable-debug \
	--disable-fortran \

define Build/Compile
	$(MAKE) -C $(PKG_BUILD_DIR) DESTDIR="$(PKG_INSTALL_DIR)" install
endef

define Build/InstallDev
	mkdir -p $(1)/usr/include
	$(CP) $(PKG_INSTALL_DIR)/usr/include/fftw3.h $(1)/usr/include
	mkdir -p $(1)/usr/lib
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/libfftw3*.{a,so,la} $(1)/usr/lib
endef

define Package/fftw3/install
	$(INSTALL_DIR) $(1)/usr/lib
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/libfftw3.so* $(1)/usr/lib/
endef

$(eval $(call BuildPackage,fftw3))
