#
# Copyright (C) 2009 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
# $Id$

include $(TOPDIR)/rules.mk

PKG_NAME:=libglade
PKG_VERSION:=2.6.3
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.bz2
PKG_SOURCE_URL:=@GNOME/$(PKG_NAME)/2.6
PKG_MD5SUM:=1c359860b1a0f369f0b6e3f96fd985c2
PKG_FIXUP:=libtool
PKG_INSTALL:=1

include $(INCLUDE_DIR)/package.mk
include $(INCLUDE_DIR)/nls.mk

EXTRA_CFLAGS+=-I$(ICONV_PREFIX)/include \
			  -I$(INTL_PREFIX)/include

EXTRA_LDFLAGS+=-Wl,-rpath-link=$(STAGING_DIR)/usr/lib \
			   -L$(ICONV_PREFIX)/lib/ \
			   -L$(INTL_PREFIX)/lib/

define Package/libglade
  SECTION:=xorg-libs
  CATEGORY:=Xorg
  SUBMENU:=libraries
  TITLE:=libglade
  URL:=http://www.jamesh.id.au/software/libglade/
  DEPENDS:=+libxml2 +gtk2
endef

define Build/Configure
	$(call Build/Configure/Default, \
		--disable-gtktest \
	)
endef

define Build/InstallDev
	$(INSTALL_DIR) $(1)/usr/{lib/pkgconfig,include/libglade-2.0/glade}

	$(CP) \
		$(PKG_INSTALL_DIR)/usr/lib/libglade-2.0.{so*,la,a} \
		$(1)/usr/lib/

	$(INSTALL_DATA) \
		$(PKG_INSTALL_DIR)/usr/lib/pkgconfig/* \
		$(1)/usr/lib/pkgconfig/
	$(SED) \
		's,^moduledir=$$$${libdir},moduledir=/usr/lib,g' \
		$(1)/usr/lib/pkgconfig/libglade-2.0.pc

	$(INSTALL_DATA) \
		$(PKG_INSTALL_DIR)/usr/include/libglade-2.0/glade/*.h \
		$(1)/usr/include/libglade-2.0/glade/
endef

define Package/libglade/install
	$(INSTALL_DIR) $(1)/usr/lib
	$(CP) \
		$(PKG_INSTALL_DIR)/usr/lib/libglade-2.0.so* \
		$(1)/usr/lib/
endef

$(eval $(call BuildPackage,libglade))
