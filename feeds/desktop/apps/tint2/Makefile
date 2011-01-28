#
# Copyright (C) 2011 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=tint2
PKG_REV:=622
PKG_VERSION:=svn$(PKG_REV)
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=http://tint2.googlecode.com/svn/trunk/
PKG_SOURCE_PROTO:=svn
PKG_SOURCE_SUBDIR:=$(PKG_NAME)-$(PKG_VERSION)
PKG_SOURCE_VERSION:=$(PKG_REV)
PKG_INSTALL:=1
PKG_BUILD_PARALLEL:=1

include $(INCLUDE_DIR)/package.mk

define Package/tint2
  SECTION:=xorg-app
  CATEGORY:=Xorg
  SUBMENU:=app
  TITLE:=Tint2 - simple panel/taskbar
  MAINTAINER:=Michael Buesch <mb@bu3sch.de>
  URL:=http://code.google.com/p/tint2/
  DEPENDS:=+cairo +pango +glib2 +libX11 +libXrandr +libXrender +libXcomposite +libXdamage +imlib2 +python-mini +python-gtk
endef

define Package/tint2/description
  tint2 is a simple panel/taskbar unintrusive and light (memory / cpu / aestetic).
endef

EXTRA_CFLAGS:=\
	-I$(STAGING_DIR)/usr/include \
	-I$(STAGING_DIR)/usr/include/cairo \
	-I$(STAGING_DIR)/usr/include/pango-1.0 \
	-I$(STAGING_DIR)/usr/include/glib-2.0

MAKE_FLAGS+=\
	VERBOSE=1

define Build/Configure
	(cd $(PKG_BUILD_DIR); \
		cmake	-DCMAKE_SYSTEM_NAME=Linux \
			-DCMAKE_SYSTEM_VERSION=1 \
			-DCMAKE_SYSTEM_PROCESSOR=$(ARCH) \
			-DCMAKE_BUILD_TYPE=Release \
			-DCMAKE_C_FLAGS_RELEASE="-DNDEBUG" \
			-DCMAKE_CXX_FLAGS_RELEASE="-DNDEBUG" \
			-DCMAKE_C_COMPILER=$(TOOLCHAIN_DIR)/bin/$(TARGET_CC) \
			-DCMAKE_C_FLAGS="$(TARGET_CFLAGS) $(EXTRA_CFLAGS)" \
			-DCMAKE_CXX_COMPILER=$(TOOLCHAIN_DIR)/bin/$(TARGET_CXX) \
			-DCMAKE_CXX_FLAGS="$(TARGET_CFLAGS) $(EXTRA_CFLAGS)" \
			-DCMAKE_EXE_LINKER_FLAGS="$(TARGET_LDFLAGS)" \
			-DCMAKE_MODULE_LINKER_FLAGS="$(TARGET_LDFLAGS)" \
			-DCMAKE_SHARED_LINKER_FLAGS="$(TARGET_LDFLAGS)" \
			-DCMAKE_FIND_ROOT_PATH=$(STAGING_DIR) \
			-DCMAKE_FIND_ROOT_PATH_MODE_PROGRAM=$(STAGING_DIR_HOST) \
			-DCMAKE_FIND_ROOT_PATH_MODE_LIBRARY=$(STAGING_DIR) \
			-DCMAKE_FIND_ROOT_PATH_MODE_INCLUDE=$(STAGING_DIR) \
			-DCMAKE_STRIP=$(STRIP) \
			-DCMAKE_INSTALL_PREFIX=/usr \
		. \
	)
endef

define Package/tint2/install
	$(INSTALL_DIR) $(1)/usr/bin $(1)/usr/share $(1)/etc/xdg/tint2
	$(CP) ./files/tint2rc $(1)/etc/xdg/tint2/
	$(CP) $(PKG_INSTALL_DIR)/usr/bin/* $(1)/usr/bin/
	$(CP) $(PKG_INSTALL_DIR)/usr/share/* $(1)/usr/share/
endef

CMAKE_MAJOR:=$$$$(cmake --version | cut -d' ' -f 3 | cut -d'.' -f1)
CMAKE_MINOR:=$$$$(cmake --version | cut -d' ' -f 3 | cut -d'.' -f2)

define Require/cmake26
	[ "$(CMAKE_MAJOR)" -gt 2 ] || \
	[ "$(CMAKE_MAJOR)" -eq 2 -a "$(CMAKE_MINOR)" -ge 6 ]
endef

$(eval $(call Require,cmake26, \
	Please install CMake version 2.6 or later. \
))

$(eval $(call BuildPackage,tint2))
