#
# Copyright (C) 2011 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=libfakekey
PKG_REV:=2111
PKG_VERSION:=svn$(PKG_REV)
PKG_RELEASE:=1

PKG_SOURCE:=libfakekey-$(PKG_VERSION).tar.bz2
PKG_SOURCE_URL:=http://svn.o-hand.com/repos/matchbox/trunk/libfakekey
PKG_SOURCE_PROTO:=svn
PKG_SOURCE_SUBDIR:=$(PKG_NAME)-$(PKG_VERSION)
PKG_SOURCE_VERSION:=$(PKG_REV)
PKG_INSTALL:=1
PKG_BUILD_PARALLEL:=1
PKG_FIXUP:=libtool

include $(INCLUDE_DIR)/package.mk

define Package/libfakekey
  SECTION:=xorg-lib
  CATEGORY:=Xorg
  SUBMENU:=libraries
  TITLE:=libfakekey
  MAINTAINER:=Michael Buesch <mb@bu3sch.de>
  URL:=http://matchbox-project.org/?p=1
  DEPENDS:=+libX11 +libXtst
endef

define Package/libfakekey/description
  X11 keyboard faking library
endef

EXTRA_LDFLAGS:=\
	-Wl,-rpath-link=$(STAGING_DIR)/usr/lib

define Build/InstallDev
	$(INSTALL_DIR) $(1)/usr/include/fakekey $(1)/usr/lib/pkgconfig
	$(INSTALL_DATA) \
		$(PKG_INSTALL_DIR)/usr/include/fakekey/fakekey.h \
		$(1)/usr/include/fakekey/
	$(INSTALL_DATA) $(PKG_INSTALL_DIR)/usr/lib/*{.so,.a}* $(1)/usr/lib/
	$(INSTALL_DATA) \
		$(PKG_INSTALL_DIR)/usr/lib/pkgconfig/libfakekey.pc \
		$(1)/usr/lib/pkgconfig/
endef

define Package/libfakekey/install
	$(INSTALL_DIR) $(1)/usr/lib
	$(INSTALL_DATA) $(PKG_INSTALL_DIR)/usr/lib/*.so* $(1)/usr/lib/
endef

$(eval $(call BuildPackage,libfakekey))
