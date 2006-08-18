#
# Copyright (C) 2006 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
# $Id: Makefile 3843 2006-05-30 18:55:52Z florian $

include $(TOPDIR)/rules.mk

PKG_NAME:=uclibc++
PKG_VERSION:=0.2.0
PKG_RELEASE:=1

PKG_BUILD_DIR:=$(BUILD_DIR)/uClibc++-$(PKG_VERSION)
PKG_SOURCE:=uClibc++-$(PKG_VERSION).tbz2
PKG_SOURCE_URL:=http://cxx.uclibc.org/src/
PKG_MD5SUM:=33e01302511c9a1987fb104f12d173e1
PKG_CAT:=bzcat

include $(INCLUDE_DIR)/package.mk

define Package/uclibcxx
  NAME:=uclibc++
  SECTION:=libs
  CATEGORY:=Libraries
  TITLE:=C++ library for embedded systems
  DESCRIPTION:=A standard C++ library for embedded systems
  URL:=http://cxx.uclibc.org/src/
endef

UCLIBC_TARGET_ARCH:=$(shell echo $(ARCH) | sed -e s'/-.*//' \
                -e 's/i.86/i386/' \
                -e 's/sparc.*/sparc/' \
                -e 's/m68k.*/m68k/' \
                -e 's/ppc/powerpc/g' \
                -e 's/v850.*/v850/g' \
                -e 's/sh64/sh/' \
                -e 's/sh[234].*/sh/' \
                -e 's/mips.*/mips/' \
                -e 's/mipsel.*/mips/' \
                -e 's/cris.*/cris/' \
)

define Build/Configure
	cp ./files/config.$(UCLIBC_TARGET_ARCH) $(PKG_BUILD_DIR)/.config
endef

define Build/Compile
	$(MAKE) -C $(PKG_BUILD_DIR) \
		TOPDIR="$(PKG_BUILD_DIR)/" \
		$(TARGET_CONFIGURE_OPTS) \
		ARCH_CFLAGS="$(TARGET_CFLAGS)" \
		CROSS="$(TARGET_CROSS)" \
		all
endef

define Package/uclibcxx/install
	install -m0755 -d $(1)/lib
	$(CP) $(PKG_BUILD_DIR)/src/libuClibc++*.so.* $(1)/lib/
	$(CP) $(PKG_BUILD_DIR)/src/libuClibc++-*.so $(1)/lib/
endef

define Build/InstallDev
	mkdir -p $(STAGING_DIR)/usr/include
	$(MAKE) -C $(PKG_BUILD_DIR) \
		TOPDIR="$(PKG_BUILD_DIR)/" \
                $(TARGET_CONFIGURE_OPTS) \
                ARCH_CFLAGS="$(TARGET_CFLAGS)" \
                CROSS="$(TARGET_CROSS)" \
		DESTDIR="$(STAGING_DIR)" \
		install
endef
	
define Build/UninstallDev
	rm -rf $(STAGING_DIR)/lib/libuClibc++*.{a,so*}
endef

$(eval $(call BuildPackage,uclibcxx))
