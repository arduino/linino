# 
# Copyright (C) 2006 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
# $Id$

include $(TOPDIR)/rules.mk

PKG_NAME:=lcd4linux
PKG_VERSION:=0.10.0+cvs20051015
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)_$(PKG_VERSION).orig.tar.gz
PKG_SOURCE_URL:=http://ftp.debian.org/debian/pool/main/l/lcd4linux/ \
		http://ftp.de.debian.org/debian/pool/main/l/lcd4linux/
PKG_MD5SUM:=5b5ac629be4bb5c29104fb8f6b7fa444
PKG_CAT:=zcat

PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)-$(PKG_VERSION).orig

include $(INCLUDE_DIR)/package.mk

define Package/lcd4linux
  SECTION:=utils
  CATEGORY:=Utilities
  DEPENDS:=+libncurses
  TITLE:=LCD display utility
  DESCRIPTION:=\
	LCD4Linux is a small program that grabs information from the kernel and \\\
	some subsystems and displays it on an external liquid crystal display.
  URL:=http://lcd4linux.bulix.org/
endef

# commas are interpreted by the $(call ...) macro, so define an intermediate variable holding our drivers spec
PKG_CONFIGURE_DRIVERS:=all,!PNG,!RouterBoard,!X11

define Build/Configure
        (cd $(PKG_BUILD_DIR); touch \
		configure.in \
		aclocal.m4 \
		Makefile.in \
		config-h.in \
		configure \
	);
	$(call Build/Configure/Default, \
		--without-x \
		--with-drivers="$(PKG_CONFIGURE_DRIVERS)" \
		--with-plugins=wireless \
	)
endef

define Build/Compile
	$(MAKE) -C $(PKG_BUILD_DIR)
endef

define Package/lcd4linux/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/lcd4linux $(1)/usr/bin/
endef

$(eval $(call BuildPackage,lcd4linux))
