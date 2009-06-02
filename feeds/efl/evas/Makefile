# 
# Copyright (C) 2006-2008 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
# $Id: Makefile 12228 2008-08-06 22:43:15Z nbd $

include $(TOPDIR)/rules.mk

PKG_NAME:=evas
PKG_REV:=40853
PKG_VERSION:=r$(PKG_REV)
PKG_RELEASE:=1

PKG_SOURCE_PROTO:=svn
PKG_SOURCE_VERSION:=$(PKG_REV)
PKG_SOURCE_SUBDIR:=$(PKG_NAME)-$(PKG_VERSION)
PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=http://svn.enlightenment.org/svn/e/trunk/$(PKG_NAME)
PKG_BUILD_DIR=$(BUILD_DIR)/Xorg/$(_CATEGORY)/$(PKG_NAME)-$(PKG_VERSION)/

HOST_BUILD_DEPENDS:=fribidi/host jpeg/host libpng/host libfreetype/host eet/host

PKG_FIXUP = libtool

include $(INCLUDE_DIR)/host-build.mk
include $(INCLUDE_DIR)/package.mk

define Package/evas
  SECTION:=xorg-lib
  CATEGORY:=Xorg
  SUBMENU:=libraries
  TITLE:=Evas is a hardware-accelerated canvas API for X-Windows
  URL:=http://wiki.enlightenment.org/index.php/Evas
  DEPENDS:=+fribidi +libXext +libfreetype +libX11 +fontconfig +eet +libjpeg +libpng +libXrender
endef

define Package/evas/description
  Evas is a hardware-accelerated canvas API for X-Windows that can draw anti-aliased text, smooth super and sub-sampled images, alpha-blend, as well as drop down to using normal X11 primitives such as pixmaps, lines and rectangles for speed if your CPU or graphics hardware are too slow.
endef

# magic-debug needs to be enabled, otherwise e17 segmentation faults randomly...

define Build/Configure
	( cd $(PKG_BUILD_DIR); NOCONFIGURE=YES ./autogen.sh );
	$(call Build/Configure/Default, \
		--disable-strict \
		--disable-evas-cserve \
		--disable-simple-x11 \
		--enable-fontconfig \
		--enable-buffer \
		--enable-software-x11 \
		--enable-xrender-x11 \
		--disable-gl-x11 \
		--disable-software-xcb \
		--disable-xrender-xcb \
		--disable-software-gdi \
		--disable-software-ddraw \
		--disable-direct3d \
		--disable-quartz \
		--disable-gl-glew \
		--disable-software-sdl \
		--disable-fb \
		--disable-directfb \
		--disable-software-16-x11 \
		--disable-software-16-ddraw \
		--disable-software-16-wince \
		--disable-sdl-primitive \
		--disable-image-loader-edb \
		--enable-image-loader-eet \
		--enable-font-loader-eet \
		--disable-image-loader-gif \
		--enable-image-loader-jpeg \
		--disable-image-loader-pmaps \
		--enable-image-loader-png \
		--disable-image-loader-svg \
		--disable-image-loader-tiff \
		--disable-image-loader-xpm \
		--enable-pthreads \
		--disable-pipe-render \
		--disable-async-events \
		--disable-async-preload \
		--disable-cpu-mmx \
		--disable-cpu-sse \
		--disable-cpu-altivec \
		--disable-cpu-neon \
		--enable-cpu-c \
		--disable-evas-magic-debug \
		--disable-scale-sample \
		--enable-scale-smooth \
		--disable-convert-yuv \
		--disable-small-dither-mask \
		--disable-line-dither-mask \
		--disable-no-dither-mask \
		--enable-convert-8-rgb-332 \
		--enable-convert-8-rgb-666 \
		--enable-convert-8-rgb-232 \
		--enable-convert-8-rgb-222 \
		--enable-convert-8-rgb-221 \
		--enable-convert-8-rgb-121 \
		--enable-convert-8-rgb-111 \
		--enable-convert-16-rgb-565 \
		--enable-convert-16-bgr-565 \
		--enable-convert-16-rgb-555 \
		--enable-convert-16-rgb-444 \
		--enable-convert-16-rgb-ipq \
		--enable-convert-16-rgb-rot-0 \
		--enable-convert-16-rgb-rot-180 \
		--enable-convert-16-rgb-rot-270 \
		--enable-convert-16-rgb-rot-90 \
		--enable-convert-24-rgb-888 \
		--enable-convert-24-bgr-888 \
		--enable-convert-32-rgb-8888 \
		--enable-convert-32-rgbx-8888 \
		--enable-convert-32-bgr-8888 \
		--enable-convert-32-bgrx-8888 \
		--enable-convert-24-rgb-ezx \
		--enable-convert-32-rgb-ezx \
		--enable-convert-32-rgb-rot-0 \
		--enable-convert-32-rgb-rot-180 \
		--enable-convert-32-rgb-rot-270 \
		--enable-convert-32-rgb-rot-90 \
		--disable-valgrind \
		--disable-doc \
		--with-x \
	)
endef

define Host/Configure
	( cd $(HOST_BUILD_DIR); NOCONFIGURE=YES ./autogen.sh );
	$(call Host/Configure/Default, \
		--disable-strict \
		--disable-evas-cserve \
		--disable-simple-x11 \
		--disable-fontconfig \
		--enable-buffer \
		--disable-software-x11 \
		--disable-xrender-x11 \
		--disable-gl-x11 \
		--disable-software-xcb \
		--disable-xrender-xcb \
		--disable-software-gdi \
		--disable-software-ddraw \
		--disable-direct3d \
		--disable-quartz \
		--disable-gl-glew \
		--disable-software-sdl \
		--disable-fb \
		--disable-directfb \
		--disable-software-16-x11 \
		--disable-software-16-ddraw \
		--disable-software-16-wince \
		--disable-sdl-primitive \
		--disable-image-loader-edb \
		--enable-image-loader-eet \
		--disable-font-loader-eet \
		--disable-image-loader-gif \
		--enable-image-loader-jpeg \
		--disable-image-loader-pmaps \
		--enable-image-loader-png \
		--disable-image-loader-svg \
		--disable-image-loader-tiff \
		--disable-image-loader-xpm \
		--enable-pthreads \
		--disable-pipe-render \
		--disable-async-events \
		--disable-async-preload \
		--disable-cpu-mmx \
		--disable-cpu-sse \
		--disable-cpu-altivec \
		--disable-cpu-neon \
		--enable-cpu-c \
		--enable-evas-magic-debug \
		--disable-scale-sample \
		--enable-scale-smooth \
		--disable-convert-yuv \
		--disable-small-dither-mask \
		--disable-line-dither-mask \
		--disable-no-dither-mask \
		--disable-convert-8-rgb-332 \
		--disable-convert-8-rgb-666 \
		--disable-convert-8-rgb-232 \
		--disable-convert-8-rgb-222 \
		--disable-convert-8-rgb-221 \
		--disable-convert-8-rgb-121 \
		--disable-convert-8-rgb-111 \
		--disable-convert-16-rgb-565 \
		--disable-convert-16-bgr-565 \
		--disable-convert-16-rgb-555 \
		--disable-convert-16-rgb-444 \
		--disable-convert-16-rgb-ipq \
		--disable-convert-16-rgb-rot-0 \
		--disable-convert-16-rgb-rot-180 \
		--disable-convert-16-rgb-rot-270 \
		--disable-convert-16-rgb-rot-90 \
		--disable-convert-24-rgb-888 \
		--disable-convert-24-bgr-888 \
		--disable-convert-32-rgb-8888 \
		--disable-convert-32-rgbx-8888 \
		--disable-convert-32-bgr-8888 \
		--disable-convert-32-bgrx-8888 \
		--disable-convert-24-rgb-ezx \
		--disable-convert-32-rgb-ezx \
		--disable-convert-32-rgb-rot-0 \
		--disable-convert-32-rgb-rot-180 \
		--disable-convert-32-rgb-rot-270 \
		--disable-convert-32-rgb-rot-90 \
		--disable-valgrind \
		--disable-doc \
		--without-x \
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
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/libevas*.so* $(1)/usr/lib/
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/evas $(1)/usr/lib/
	$(FIND) $(1)/ -name "*.la" | $(XARGS) rm
	$(FIND) $(1)/ -name "*.a" | $(XARGS) rm
endef

$(eval $(call HostBuild))
$(eval $(call BuildPackage,evas))
