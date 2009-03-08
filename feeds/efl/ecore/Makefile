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
  DEPENDS:=+eet +evas +libXcursor +libXrandr +libXtst +libiconv @!LINUX_2_4 \
  +libXdamage +libXfixes +libXrender +libXtest
endef

define Package/ecore/description
  Ecore is the core event abstraction layer and X abstraction layer that makes doing selections, Xdnd, general X stuff, and event loops, timeouts and idle handlers fast, optimized, and convenient. It's a separate library so anyone can make use of the work put into Ecore to make this job easy for applications.
endef

EXTRA_CFLAGS+=-I$(STAGING_DIR)/usr/lib/libiconv/include
EXTRA_LDFLAGS+= \
	-liconv -L$(STAGING_DIR)/usr/lib/libiconv/lib \
	-Wl,-rpath-link=$(STAGING_DIR)/usr/lib \
	-Wl,-rpath=/usr/lib

define Build/Configure
	(cd $(PKG_BUILD_DIR); NOCONFIGURE=YES ./autogen.sh );
	$(call Build/Configure/Default, \
        --with-iconv-link \
        --enable-ecore-txt \
        --disable-ecore-config \
        --disable-ecore-x-xcb \
        --enable-ecore-x \
        --enable-ecore-job \
        --disable-ecore-directfb \
        --disable-ecore-sdl \
        --enable-ecore-fb \
        --enable-ecore-evas \
        --enable-ecore-evas-fb \
        --disable-ecore-evas-x11-gl \
        --enable-ecore-evas-xrender \
        --disable-ecore-evas-dfb \
        --disable-ecore-evas-sdl \
        --disable-openssl \
        --enable-abstract-sockets \
        --enable-ecore-con \
        --enable-ecore-ipc \
        --enable-ecore-file \
        --enable-inotify \
        --disable-poll \
        --disable-curl \
        --disable-ecore-desktop \
        --disable-gnutls \
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
endef

$(eval $(call BuildPackage,ecore))
