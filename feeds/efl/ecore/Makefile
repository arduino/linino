# 
# Copyright (C) 2006-2008 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
# $Id: Makefile 12228 2008-08-06 22:43:15Z nbd $

include $(TOPDIR)/rules.mk

PKG_NAME:=ecore
PKG_REV:=38886
PKG_VERSION:=r$(PKG_REV)
PKG_RELEASE:=1

PKG_SOURCE_PROTO:=svn
PKG_SOURCE_VERSION:=$(PKG_REV)
PKG_SOURCE_SUBDIR:=$(PKG_NAME)-$(PKG_VERSION)
PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=http://svn.enlightenment.org/svn/e/trunk/$(PKG_NAME)
PKG_BUILD_DIR=$(BUILD_DIR)/Xorg/$(_CATEGORY)/$(PKG_NAME)-$(PKG_VERSION)/

PKG_FIXUP = libtool

include $(INCLUDE_DIR)/package.mk

define Package/ecore
  SECTION:=xorg-lib
  CATEGORY:=Xorg
  SUBMENU:=libraries
  TITLE:=Ecore is the core event abstraction layer and X abstraction layer
  URL:=http://wiki.enlightenment.org/index.php/Ecore
  DEPENDS:=+eet +evas +libiconv @!LINUX_2_4
endef

define Package/ecore/description
  Ecore is the core event abstraction layer and X abstraction layer that makes doing selections, Xdnd, general X stuff, and event loops, timeouts and idle handlers fast, optimized, and convenient. It's a separate library so anyone can make use of the work put into Ecore to make this job easy for applications.
endef

# iconv needed for ecore-txt
TARGET_CFLAGS+=-I$(STAGING_DIR)/usr/lib/libiconv/include
TARGET_LDFLAGS+=-liconv -L$(STAGING_DIR)/usr/lib/libiconv/lib

define Build/Configure
	( cd $(PKG_BUILD_DIR); NOCONFIGURE=YES ./autogen.sh );
	$(call Build/Configure/Default, \
		--with-x \
		--with-iconv-link \
		--disable-gnutls \
		--disable-openssl \
		--disable-curl \
		--disable-abstract-sockets \
		--enable-ecore-job \
		--enable-ecore-con \
		--enable-ecore-ipc \
		--disable-ecore-config \
		--enable-ecore-txt \
		--enable-ecore-evas \
		--enable-ecore-x \
		--enable-ecore-evas-xrender-x11 \
		--disable-ecore-evas-dfb \
		--disable-ecore-evas-fb \
		--disable-ecore-evas-sdl \
		--disable-ecore-evas-quartz \
		--enable-ecore-evas-buffer \
		--enable-ecore-file \
		--disable-inotify \
		--disable-poll \
		--enable-ecore-imf \
		--enable-ecore-imf_evas \
		--disable-doc \
		--disable-simple-x11 \
		--disable-ecore-x-xcb \
		--disable-ecore-evas-opengl-x11 \
		--disable-ecore-evas-software-16-x11 \
		--disable-ecore-evas-software-xcb \
		--disable-ecore-evas-xrender-xcb \
		--disable-ecore-win32 \
		--disable-ecore-evas-software-ddraw \
		--disable-ecore-evas-direct3d \
		--disable-ecore-evas-opengl-glew \
		--disable-ecore-evas-software-16-ddraw \
		--disable-ecore-wince \
		--disable-ecore-evas-software-16-wince \
		--disable-ecore-directfb \
		--disable-ecore-fb \
		--disable-ecore-sdl \
		--disable-ecore-quartz \
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
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/* $(1)/usr/lib/
	$(FIND) $(1)/ -name "*.la" | $(XARGS) rm
	$(FIND) $(1)/ -name "*.a" | $(XARGS) rm
endef

$(eval $(call BuildPackage,ecore))
