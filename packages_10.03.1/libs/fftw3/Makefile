#
# Copyright (C) 2007-2010 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=fftw3
PKG_VERSION:=3.2.2
PKG_RELEASE:=2

PKG_SOURCE:=fftw-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=http://www.fftw.org
PKG_MD5SUM:=b616e5c91218cc778b5aa735fefb61ae

PKG_BUILD_DIR:=$(BUILD_DIR)/fftw-$(PKG_VERSION)
PKG_FIXUP:=libtool

include $(INCLUDE_DIR)/package.mk

define Package/fftw3
  SECTION:=libs
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
	$(INSTALL_DIR) $(1)/usr/include
	$(CP) $(PKG_INSTALL_DIR)/usr/include/fftw3.h $(1)/usr/include
	$(INSTALL_DIR) $(1)/usr/lib
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/libfftw3*.{a,la} $(1)/usr/lib
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/libfftw3*.so* $(1)/usr/lib
endef

define Package/fftw3/install
	$(INSTALL_DIR) $(1)/usr/lib
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/libfftw3.so* $(1)/usr/lib/
endef

$(eval $(call BuildPackage,fftw3))
