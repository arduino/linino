# 
# Copyright (C) 2006 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
# $Id: Makefile 8274 2007-07-31 11:22:44Z nbd $

include $(TOPDIR)/rules.mk

PKG_NAME:=opal
PKG_VERSION:=2.3.1
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.bz2
PKG_SOURCE_URL:=ftp://peternixon.net/pub/voxgratia
PKG_MD5SUM:=5a9d7f060527885bed3a26324de6dcfc

PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)-$(PKG_VERSION)

# Set location of pwlib (Which needs to have been built already)
PWLIBDIR=$(BUILD_DIR)/pwlib-1.11.1

include $(INCLUDE_DIR)/package.mk

define Package/libopal
  SECTION:=libs
  CATEGORY:=Libraries
  DEPENDS:=+pwlib +uclibcxx
  TITLE:=Open Phone Abstraction Library
  DESCRIPTION:=\
	Open Phone Abstraction Library, implementation of the ITU H.323\\\
	teleconferencing protocol, and successor of the openh323 library. It\\\
	supports not only the H.323 protocol but also SIP and IAX2.\\\
  URL:=http://www.voxgratia.org/
endef

CONFIGURE_ARGS += \
	--enable-minsize \
	--enable-audio \
	--disable-video

CONFIGURE_VARS += \
	CXXFLAGS="$(TARGET_CFLAGS) -fno-builtin -fno-rtti" \

MAKE_FLAGS += \
	CFLAGS="$(TARGET_CFLAGS)" \
	CCFLAGS="$(TARGET_CFLAGS)" \
	optnoshared

define Build/InstallDev
	ln -sf $(PKG_NAME)-$(PKG_VERSION) $(BUILD_DIR)/$(PKG_NAME)
endef

define Build/UninstallDev
	rm -rf $(BUILD_DIR)/$(PKG_NAME)
endef

$(eval $(call BuildPackage,libopal))
