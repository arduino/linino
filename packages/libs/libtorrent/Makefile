#
# Copyright (C) 2007-2011 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=libtorrent
PKG_REV:=1209
PKG_VERSION:=0.12.6_r$(PKG_REV)
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.bz2
PKG_SOURCE_URL:=svn://rakshasa.no/libtorrent/trunk/libtorrent
PKG_SOURCE_SUBDIR:=$(PKG_NAME)-$(PKG_VERSION)
PKG_SOURCE_VERSION:=$(PKG_REV)
PKG_SOURCE_PROTO:=svn

PKG_FIXUP:=libtool
PKG_INSTALL:=1

include $(INCLUDE_DIR)/package.mk

define Package/libtorrent
  SECTION:=libs
  CATEGORY:=Libraries
  TITLE:=Rakshasa's BitTorrent library
  URL:=http://libtorrent.rakshasa.no/
  DEPENDS:=+libopenssl +libsigcxx @!LINUX_2_4
  MAINTAINER:=Luka Perkov <openwrt@lukaperkov.net>
endef

define Package/libtorrent/description
 LibTorrent is a BitTorrent library written in C++ for *nix, with a focus
 on high performance and good code. The library differentiates itself from
 other implementations by transfering directly from file pages to the
 network stack. On high-bandwidth connections it is able to seed at 3 times
 the speed of the official client.
endef

TARGET_CPPFLAGS += -fno-strict-aliasing -fno-inline
TARGET_LDFLAGS += $(LIBGCC_S)

CONFIGURE_ARGS+= \
	--enable-shared \
	--enable-static \
	--enable-aligned \
	--disable-debug \
	--enable-openssl \

define Build/Configure
	(cd $(PKG_BUILD_DIR); ./autogen.sh );
	$(call Build/Configure/Default)
endef

define Build/InstallDev
	$(INSTALL_DIR) $(1)/usr/include
	$(CP) $(PKG_INSTALL_DIR)/usr/include/torrent $(1)/usr/include/
	$(INSTALL_DIR) $(1)/usr/lib
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/libtorrent.{a,so*} $(1)/usr/lib/
	$(INSTALL_DIR) $(1)/usr/lib/pkgconfig
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/pkgconfig/libtorrent.pc $(1)/usr/lib/pkgconfig/
endef

define Package/libtorrent/install
	$(INSTALL_DIR) $(1)/usr/lib
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/libtorrent.so.* $(1)/usr/lib/
endef

$(eval $(call BuildPackage,libtorrent))

