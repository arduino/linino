# 
# Copyright (C) 2006-2008 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
# $Id: Makefile 12228 2008-08-06 22:43:15Z nbd $

include $(TOPDIR)/rules.mk

PKG_NAME:=ecore
PKG_REV:=40853
PKG_VERSION:=r$(PKG_REV)
PKG_RELEASE:=1

PKG_SOURCE_PROTO:=svn
PKG_SOURCE_VERSION:=$(PKG_REV)
PKG_SOURCE_SUBDIR:=$(PKG_NAME)-$(PKG_VERSION)
PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=http://svn.enlightenment.org/svn/e/trunk/$(PKG_NAME)
PKG_BUILD_DIR=$(BUILD_DIR)/Xorg/$(_CATEGORY)/$(PKG_NAME)-$(PKG_VERSION)/

HOST_BUILD_DEPENDS:=eina/host evas/host fribidi/host

PKG_FIXUP = libtool

include $(INCLUDE_DIR)/host-build.mk
include $(INCLUDE_DIR)/package.mk
include $(INCLUDE_DIR)/nls.mk

define Package/ecore
  SECTION:=xorg-lib
  CATEGORY:=Xorg
  SUBMENU:=libraries
  TITLE:=Ecore is the core event abstraction layer and X abstraction layer
  URL:=http://wiki.enlightenment.org/index.php/Ecore
  DEPENDS:=+fribidi +eina +evas +libXtst +libXrandr +libX11 \
	+libXcursor +libXdpms @!LINUX_2_4 $(ICONV_DEPENDS) $(INTL_DEPENDS)
endef

define Package/ecore/description
  Ecore is the core event abstraction layer and X abstraction layer that makes doing selections, Xdnd, general X stuff, and event loops, timeouts and idle handlers fast, optimized, and convenient. It's a separate library so anyone can make use of the work put into Ecore to make this job easy for applications.
endef

# iconv needed for ecore-txt
TARGET_LDFLAGS+= \
	-liconv \
	-Wl,-rpath-link=$(STAGING_DIR)/usr/lib \
	-Wl,-rpath=/usr/lib \

define Build/Configure
	( cd $(PKG_BUILD_DIR); NOCONFIGURE=YES ./autogen.sh );
	$(call Build/Configure/Default, \
		--disable-simple-x11 \
		--disable-doc \
		--disable-ecore-x-xcb \
		--disable-atfile-source \
		--enable-ecore-job \
		--disable-curl \
		--disable-gnutls \
		--disable-openssl \
		--disable-poll \
		--enable-inotify \
		--enable-ecore-evas-software-buffer \
		--enable-ecore-evas-software-x11 \
		--enable-ecore-evas-xrender-x11 \
		--disable-ecore-evas-opengl-x11 \
		--disable-ecore-evas-software-16-x11 \
		--disable-ecore-evas-software-xcb \
		--disable-ecore-evas-xrender-xcb \
		--disable-ecore-evas-software-gdi \
		--disable-ecore-evas-software-ddraw \
		--disable-ecore-evas-direct3d \
		--disable-ecore-evas-opengl-glew \
		--disable-ecore-evas-software-16-ddraw \
		--disable-ecore-evas-quartz \
		--disable-ecore-evas-software-sdl \
		--disable-ecore-evas-directfb \
		--disable-ecore-evas-fb \
		--disable-ecore-evas-software-16-wince \
		--enable-ecore-x \
		--with-iconv-link=-liconv \
		--with-x \
		, \
		ac_cv_header_X11_extensions_Print_h=no \
		ac_cv_header_X11_extensions_Xinerama_h=no \
		ac_cv_header_X11_extensions_Xfixes_h=no \
		ac_cv_header_X11_extensions_Xdamage_h=no \
		ac_cv_header_X11_extensions_Xcomposite_h=no \
	)
endef

define Host/Configure
	( cd $(HOST_BUILD_DIR); NOCONFIGURE=YES ./autogen.sh );
	$(call Host/Configure/Default, \
		--disable-simple-x11 \
		--disable-doc \
		--disable-ecore-x-xcb \
		--disable-atfile-source \
		--enable-ecore-job \
		--disable-curl \
		--disable-gnutls \
		--disable-openssl \
		--disable-poll \
		--disable-inotify \
		--enable-ecore-evas-software-buffer \
		--disable-ecore-evas-software-x11 \
		--disable-ecore-evas-xrdisder-x11 \
		--disable-ecore-evas-opengl-x11 \
		--disable-ecore-evas-software-16-x11 \
		--disable-ecore-evas-software-xcb \
		--disable-ecore-evas-xrender-xcb \
		--disable-ecore-evas-software-gdi \
		--disable-ecore-evas-software-ddraw \
		--disable-ecore-evas-direct3d \
		--disable-ecore-evas-opengl-glew \
		--disable-ecore-evas-software-16-ddraw \
		--disable-ecore-evas-quartz \
		--disable-ecore-evas-software-sdl \
		--disable-ecore-evas-directfb \
		--disable-ecore-evas-fb \
		--disable-ecore-evas-software-16-wince \
		--disable-ecore-x \
		--without-x \
	)
endef

define Build/Compile
	DESTDIR="$(PKG_INSTALL_DIR)" $(MAKE) -C $(PKG_BUILD_DIR) all install
endef

define Build/InstallDev
	mkdir -p $(1)/usr/include $(1)/usr/lib
	$(CP) $(PKG_INSTALL_DIR)/usr/include/* $(1)/usr/include/
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/* $(1)/usr/lib/
endef

define Package/ecore/install
	$(INSTALL_DIR) $(1)/usr/lib
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/libecore*.so* $(1)/usr/lib/
endef

$(eval $(call HostBuild))
$(eval $(call BuildPackage,ecore))
