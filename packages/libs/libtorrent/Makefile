# 
# Copyright (C) 2007 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
# $Id$

include $(TOPDIR)/rules.mk

PKG_NAME:=libtorrent
PKG_VERSION:=0.11.7
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=http://libtorrent.rakshasa.no/downloads/
PKG_MD5SUM:=86cdfca2d1c3cfb3b6b316d9beaa25e0

PKG_BUILD_DEPENDS:=libtool

include $(INCLUDE_DIR)/package.mk

define Package/libtorrent
  SECTION:=libs
  CATEGORY:=Libraries
  TITLE:=Rakshasa's BitTorrent library
  URL:=http://libtorrent.rakshasa.no/
  DEPENDS:=+libsigcxx
endef

define Package/libtorrent/description
 LibTorrent is a BitTorrent library written in C++ for *nix, with a focus 
 on high performance and good code. The library differentiates itself from 
 other implementations by transfering directly from file pages to the 
 network stack. On high-bandwidth connections it is able to seed at 3 times 
 the speed of the official client.
endef

CONFIGURE_ARGS+= \
	--enable-shared \
	--enable-static \
	--enable-aligned \
	--disable-debug \
	--disable-openssl \

CONFIGURE_VARS += \
	CXX="g++-uc+std" \
	CXXFLAGS="$$$$CXXFLAGS -fno-rtti"  \

define Build/Configure
	$(call Build/Configure/Default,)
	$(call libtool_disable_rpath)
	$(SED) 's|^sys_lib_dlsearch_path_spec=.*|sys_lib_dlsearch_path_spec="$(STAGING_DIR)/usr/lib"|g' \
		$(PKG_BUILD_DIR)/libtool
	$(SED) 's|^postdeps=.*|postdeps=|g' $(PKG_BUILD_DIR)/libtool
endef

define Build/Compile
	$(MAKE) -C $(PKG_BUILD_DIR) all
	$(call libtool_fixup_libdir,$(PKG_INSTALL_DIR))
	$(MAKE) -C $(PKG_BUILD_DIR) DESTDIR="$(PKG_INSTALL_DIR)" install
endef

define Build/InstallDev
	mkdir -p $(1)/usr/include
	$(CP) $(PKG_INSTALL_DIR)/usr/include/torrent $(1)/usr/include/
	mkdir -p $(1)/usr/lib
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/libtorrent.{a,so*} $(1)/usr/lib/
	mkdir -p $(1)/usr/lib/pkgconfig
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/pkgconfig/libtorrent.pc $(1)/usr/lib/pkgconfig/
	$(SED) 's,$(TARGET_LDFLAGS),,g' $(1)/usr/lib/pkgconfig/libtorrent.pc
endef

define Build/UninstallDev
	rm -rf	$(STAGING_DIR)/usr/include/torrent \
		$(STAGING_DIR)/usr/lib/libtorrent.{a,so*} \
		$(STAGING_DIR)/usr/lib/pkgconfig/libtorrent.pc
endef

define Package/libtorrent/install
	$(INSTALL_DIR) $(1)/usr/lib
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/libtorrent.so.* $(1)/usr/lib/
endef

$(eval $(call BuildPackage,libtorrent))

