#
# Copyright (C) 2006-2008 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=fltk2
PKG_REV:=6671
PKG_VERSION:=r$(PKG_REV)
PKG_RELEASE:=2

PKG_SOURCE_PROTO:=svn
PKG_SOURCE_VERSION:=$(PKG_REV)
PKG_SOURCE_SUBDIR:=$(PKG_NAME)-$(PKG_VERSION)
PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=http://svn.easysw.com/public/fltk/fltk/trunk
PKG_BUILD_DIR=$(BUILD_DIR)/Xorg/$(_CATEGORY)/$(PKG_NAME)-$(PKG_VERSION)/

PKG_FIXUP:=libtool
PKG_BUILD_PARALLEL:=1

include $(INCLUDE_DIR)/package.mk

define Package/fltk2
  SECTION:=xorg-framework
  CATEGORY:=Xorg
  SUBMENU:=framework
  TITLE:=Fltk2
  URL:=http://fltk.org/
  DEPENDS:=+libXi +libstdcpp +libfreetype
endef

define Package/fltk2/description
    FLTK (pronounced <fulltick>) is a cross-platform C++ GUI toolkit for UNIX/Linux (X11), Microsoft Windows, and MacOS X. FLTK provides modern GUI functionality without the bloat and supports 3D graphics via OpenGL and its built-in GLUT emulation.
endef

define Build/Configure
	(cd $(PKG_BUILD_DIR); autoconf );
	$(call Build/Configure/Default, --disable-jpeg --disable-zlib --disable-png --disable-gl --disable-xinerama --enable-shared --x-libraries=$(STAGING_DIR)/usr/lib --x-includes=$(STAGING_DIR)/usr/include)
endef

define Build/Compile
	$(MAKE) $(PKG_JOBS) -C $(PKG_BUILD_DIR) all
endef

define Build/Install
	DESTDIR="$(PKG_INSTALL_DIR)" $(MAKE) -C $(PKG_BUILD_DIR) install
endef

define Build/InstallDev
	$(INSTALL_DIR) $(1)/usr/lib $(1)/usr/bin $(1)/usr/include
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/* $(1)/usr/lib/
	$(CP) $(PKG_INSTALL_DIR)/usr/include/fltk $(1)/usr/include/
	$(CP) $(PKG_INSTALL_DIR)/usr/bin/fltk2-config $(1)/usr/bin/
endef

define Package/fltk2/install
	$(INSTALL_DIR) $(1)/usr/lib
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/*.so* $(1)/usr/lib/
endef

$(eval $(call BuildPackage,fltk2))
