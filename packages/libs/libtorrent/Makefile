#
# Copyright (C) 2007-2010 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=libtorrent
PKG_REV:=1165
PKG_VERSION:=0.12.6_r$(PKG_REV)
PKG_RELEASE:=2

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
endef

define Package/libtorrent/description
 LibTorrent is a BitTorrent library written in C++ for *nix, with a focus
 on high performance and good code. The library differentiates itself from
 other implementations by transfering directly from file pages to the
 network stack. On high-bandwidth connections it is able to seed at 3 times
 the speed of the official client.
endef

ifneq ($(CONFIG_GCC_VERSION_3_4)$(CONFIG_GCC_VERSION_4_1),)
  TARGET_CPPFLAGS += -fno-strict-aliasing
endif

TARGET_CPPFLAGS += -fno-inline

# XXX: fixes the following error when configure from rtorrent is trying
# to link against libtorrent on arm (#7026)
#
# ./staging_dir/toolchain-arm_v5t_gcc-4.3.3+cs_uClibc-0.9.30.1_eabi/usr/lib/gcc/arm-openwrt-linux-uclibcgnueabi/4.3.3/../../../../arm-openwrt-linux-uclibcgnueabi/bin/ld: conftest: hidden symbol `__sync_add_and_fetch_4' in /media/Scratch/OpenWrt/backfire/build.d/orion/staging_dir/toolchain-arm_v5t_gcc-4.3.3+cs_uClibc-0.9.30.1_eabi/usr/lib/gcc/arm-openwrt-linux-uclibcgnueabi/4.3.3/libgcc.a(linux-atomic.o) is referenced by DSO
# ./staging_dir/toolchain-arm_v5t_gcc-4.3.3+cs_uClibc-0.9.30.1_eabi/usr/lib/gcc/arm-openwrt-linux-uclibcgnueabi/4.3.3/../../../../arm-openwrt-linux-uclibcgnueabi/bin/ld: final link failed: Nonrepresentable section on output
#
ifneq ($(CONFIG_arm)$(CONFIG_armeb),)
  TARGET_LDFLAGS += -Wl,--whole-archive -lgcc -lgcc_s -Wl,--no-whole-archive
endif

# XXX: rtorrent needs encryption (--enable-openssl)
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

