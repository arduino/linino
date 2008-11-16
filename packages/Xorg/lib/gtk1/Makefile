#
# Copyright (C) 2006-2008 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
# blogic@openwrt.org
# $Id: Makefile 12578 2008-09-12 20:50:05Z lars $

include $(TOPDIR)/rules.mk

PKG_NAME:=gtk1
PKG_VERSION:=1.2.10
PKG_RELEASE:=1

PKG_SOURCE:=gtk+-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=@GNOME/gtk+/1.2/
PKG_BUILD_DIR=$(BUILD_DIR)/gtk+-1.2.10
PKG_MD5SUM:=4d5cb2fc7fb7830e4af9747a36bfce20
PKG_FIXUP:=libtool

include $(INCLUDE_DIR)/package.mk

PKG_INSTALL=1

CONFIGURE_ARGS_XTRA+=--x-includes=$(STAGING_DIR)/usr/include/ \
		--x-libraries=$(STAGING_DIR)/usr/lib \
		--with-glib-prefix=$(STAGING_DIR)/usr/ \
		--enable-static=yes \
		--enable-static=yes

EXTRA_CFLAGS+=-Wl,-rpath-link=$(STAGING_DIR)/usr/lib
TARGET_CFLAGS+=-I$(STAGING_DIR)/usr/include/glib-1.2 -I$(STAGING_DIR)/usr/lib/glib/include
EXTRA_LDFLAGS+=-lnotimpl -lglib -lgmodule

define Package/gtk1
  SECTION:=xorg-framework
  CATEGORY:=Xorg
  SUBMENU:=framework
  TITLE:=GTK+ 1.2.10 package
  DEPENDS:=+glib1 +libX11 +libXt
endef

define Build/InstallDev
	$(INSTALL_DIR) $(1)
	$(CP) $(PKG_INSTALL_DIR)/* $(1)/
	$(INSTALL_DIR) $(2)/bin
	mv $(1)/usr/bin/gtk-config $(2)/bin/
	$(SED) "s,libdirs=-L.*,libdirs=,g" $(2)/bin/gtk-config
endef

$(eval $(call BuildPackage,gtk1))
