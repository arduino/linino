# 
# Copyright (C) 2006 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
# $Id: Makefile 12228 2008-08-06 22:43:15Z nbd $

include $(TOPDIR)/rules.mk

PKG_NAME:=evas
PKG_VERSION:=r37637
PKG_RELEASE:=1

PKG_SOURCE_PROTO:=svn
PKG_SOURCE_VERSION:=$(PKG_VERSION)
PKG_SOURCE_SUBDIR:=$(PKG_NAME)-$(PKG_VERSION)
PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=https://svn.enlightenment.org/svn/e/trunk/$(PKG_NAME)
PKG_BUILD_DIR=$(BUILD_DIR)/Xorg/$(_CATEGORY)/$(PKG_NAME)-$(PKG_VERSION)/

PKG_FIXUP = libtool

include $(INCLUDE_DIR)/package.mk

define Package/evas
  SECTION:=xorg-lib
  CATEGORY:=Xorg
  SUBMENU:=lib
  TITLE:=Evas is a hardware-accelerated canvas API for X-Windows
  URL:=http://wiki.enlightenment.org/index.php/Evas
  DEPENDS:=+eet +libfreetype +libjpeg +libpng +libX11 +libXext +libXrender +fontconfig
endef

define Package/evas/description
  Evas is a hardware-accelerated canvas API for X-Windows that can draw anti-aliased text, smooth super and sub-sampled images, alpha-blend, as well as drop down to using normal X11 primitives such as pixmaps, lines and rectangles for speed if your CPU or graphics hardware are too slow.
endef

define Build/Configure
	(cd $(PKG_BUILD_DIR); NOCONFIGURE=YES ./autogen.sh );
	$(call Build/Configure/Default, \
		--disable-pthreads		\
		--enable-fb			\
		--disable-directfb		\
		--disable-sdl			\
		--enable-buffer			\
		--disable-software-ddraw	\
		--disable-software-qtopia	\
		--enable-simple-x11		\
		--enable-software-x11		\
		--enable-software-16-x11	\
		--disable-software-xcb		\
		--disable-gl-x11		\
		--enable-xrender-x11		\
		--disable-xrender-xcb		\
		--disable-glitz-x11		\
		--enable-image-loader-eet	\
		--disable-image-loader-edb	\
		--disable-image-loader-gif	\
		--enable-image-loader-png	\
		--enable-image-loader-jpeg	\
		--enable-image-loader-tiff	\
		--enable-image-loader-xpm	\
		--enable-image-loader-svg	\
		--enable-cpu-c			\
		--enable-fontconfig		\
		--enable-font-loader-eet	\
		--enable-scale-sample		\
		--enable-scale-smooth		\
		--enable-convert-yuv		\
		--enable-small-dither-mask	\
		--enable-no-dither-mask	\
		--enable-convert-8-rgb-332	\
		--enable-convert-8-rgb-666	\
		--enable-convert-8-rgb-232	\
		--enable-convert-8-rgb-222	\
		--enable-convert-8-rgb-221	\
		--enable-convert-8-rgb-121	\
		--enable-convert-8-rgb-111	\
		--enable-convert-16-rgb-565	\
		--enable-convert-16-rgb-555	\
		--enable-convert-16-rgb-444	\
		--enable-convert-16-rgb-ipq	\
		--enable-convert-16-rgb-rot-0	\
		--enable-convert-16-rgb-rot-90	\
		--enable-convert-16-rgb-rot-180\
		--enable-convert-16-rgb-rot-270	\
		--enable-convert-24-rgb-888	\
		--enable-convert-24-bgr-888	\
		--enable-convert-32-rgb-8888	\
		--enable-convert-32-rgbx-8888	\
		--enable-convert-32-bgr-8888	\
		--enable-convert-32-bgrx-8888	\
		--enable-convert-32-rgb-rot-0	\
		--enable-convert-32-rgb-rot-90	\
		--enable-convert-32-rgb-rot-180 \
		--enable-convert-32-rgb-rot-270 \
	)
endef

define Build/Compile
	DESTDIR="$(PKG_INSTALL_DIR)" $(MAKE) -C $(PKG_BUILD_DIR) all install
endef

define Build/InstallDev
	$(INSTALL_DIR) $(1)/usr/include $(1)/usr/lib
	$(CP) $(PKG_INSTALL_DIR)/usr/include/* $(1)/usr/include/
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/* $(1)/usr/lib/
endef

define Package/evas/install
	$(INSTALL_DIR) $(1)/usr/lib
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/libevas.so* $(1)/usr/lib/
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/evas $(1)/usr/lib/
	find $(1)/usr/lib/evas -name *.la | xargs rm -rf
	find $(1)/usr/lib/evas -name *.a | xargs rm -rf
endef

$(eval $(call BuildPackage,evas))
