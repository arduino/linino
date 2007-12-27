#
# Copyright (C) 2007 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
# $Id$

include $(TOPDIR)/rules.mk

PKG_NAME:=lcd4linux
PKG_REV:=847
PKG_VERSION:=r$(PKG_REV)
PKG_RELEASE:=3

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.bz2
PKG_SOURCE_URL:=https://ssl.bulix.org/svn/lcd4linux/trunk/
PKG_SOURCE_SUBDIR:=lcd4linux-$(PKG_VERSION)
PKG_SOURCE_VERSION:=$(PKG_REV)
PKG_SOURCE_PROTO:=svn

PKG_FIXUP = libtool

include $(INCLUDE_DIR)/package.mk

define Package/lcd4linux
  SECTION:=utils
  CATEGORY:=Utilities
  DEPENDS:=+libncurses +libusb +libgd
  TITLE:=LCD display utility
  URL:=http://lcd4linux.bulix.org/
endef

define Package/lcd4linux/description
	LCD4Linux is a small program that grabs information from the kernel and 
	some subsystems and displays it on an external liquid crystal display.
endef

define Package/lcd4linux/conffiles
/etc/lcd4linux.conf
endef

# commas are interpreted by the $(call ...) macro, so define an intermediate variable holding our drivers and plugins spec
PKG_CONFIGURE_DRIVERS:=all,!PNG,!RouterBoard,!X11,!serdisplib,!G15
PKG_CONFIGURE_PLUGINS:=wireless

EXTRA_CFLAGS+=-I$(STAGING_DIR)/usr/include -I$(STAGING_DIR)/include
EXTRA_LDFLAGS+=-L$(STAGING_DIR)/usr/lib -Wl,-rpath-link,$(STAGING_DIR)/usr/lib

TARGET_CONFIGURE_OPTS+=\
        CC="$(TARGET_CC) $(EXTRA_CFLAGS) $(EXTRA_LDFLAGS)"

CONFIGURE_ARGS += \
	--without-x \
	--without-python \
	--with-drivers="$(PKG_CONFIGURE_DRIVERS)" \
	--with-plugins="$(PKG_CONFIGURE_PLUGINS)" \
	--disable-rpath \

define Build/Compile
	$(MAKE) -C $(PKG_BUILD_DIR) DESTDIR="$(PKG_INSTALL_DIR)" all install
endef

define Package/lcd4linux/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/$(PKG_NAME) $(1)/usr/bin/
	$(INSTALL_DIR) $(1)/etc
	$(INSTALL_CONF) ./files/$(PKG_NAME).conf $(1)/etc/$(PKG_NAME).conf
	$(INSTALL_DIR) $(1)/etc/init.d
	$(INSTALL_BIN) ./files/$(PKG_NAME).init $(1)/etc/init.d/$(PKG_NAME)
endef

$(eval $(call BuildPackage,lcd4linux))
