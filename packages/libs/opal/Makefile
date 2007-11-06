# 
# Copyright (C) 2006 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
# $Id: Makefile 8274 2007-07-31 11:22:44Z nbd $

include $(TOPDIR)/rules.mk

PKG_NAME:=opal-snapshot
PKG_VERSION:=18818
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.bz2
PKG_SOURCE_URL:=ftp://peternixon.net/pub/voxgratia
PKG_MD5SUM:=121b77a82f9a4eb289e2351d588185e9

PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)-$(PKG_VERSION)

# Set location of ptlib (Which needs to have been built already)
export PWLIBDIR=$(BUILD_DIR)/ptlib-snapshot
export PTLIBDIR=$(BUILD_DIR)/ptlib-snapshot

include $(INCLUDE_DIR)/package.mk

define Package/libopal
  SECTION:=libs
  CATEGORY:=Libraries
  DEPENDS:=+ptlib +uclibcxx
  TITLE:=Open Phone Abstraction Library
  URL:=http://www.opalvoip.org/
endef

define Package/libopal/description
	Open Phone Abstraction Library, implementation of the ITU H.323
	teleconferencing protocol, and successor of the openh323 library. It
	supports not only the H.323 protocol but also SIP and IAX2.

endef

CONFIGURE_ARGS += \
	--enable-audio \
	--disable-video \
	--enable-sip \
	--enable-h323 \
	--disable-iax \
	--disable-h224 \
	--disable-h450 \
	--disable-h460 \
	--disable-ivr \
	--disable-rfc4175 \
	--disable-versioncheck

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
