#
# Copyright (C) 2006 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=valgrind
PKG_VERSION:=3.3.1
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.bz2
PKG_SOURCE_URL:=http://valgrind.org/downloads/
PKG_MD5SUM:=0539e2fa4aadb2cd4ca4bba65b1fe8b5

include $(INCLUDE_DIR)/package.mk

define Package/valgrind
  SECTION:=utils
  CATEGORY:=Utilities
  DEPENDS:=@TARGET_x86||@TARGET_rdc||@TARGET_ps3||@TARGET_magicbox||@TARGET_amcc||@TARGET_uml
  TITLE:=debugging and profiling Linux programs
  URL:=http://www.valgrind.org
endef

define Package/valgrind/description
	Valgrind is an award-winning suite of tools for debugging and
	profiling Linux programs. With the tools that come with Valgrind,
	you can automatically detect many memory management and threading
	bugs, avoiding hours of frustrating bug-hunting, making your
	programs more stable. You can also perform detailed profiling,
	to speed up and reduce memory use of your programs.
endef

CONFIGURE_ARGS += \
	--disable-tls \
	--enable-only32bit \
	--without-x \
	--without-uiout \
	--disable-valgrindmi \
	--disable-tui \
	--disable-valgrindtk \
	--without-included-gettext

DEFAULT_SUPP += "uclibc.supp"

define Build/Compile
	$(TARGET_CC) $(TARGET_CFLAGS) -c -o $(PKG_BUILD_DIR)/abort.o ./src/abort.c
	$(TARGET_CROSS)ar rcu $(PKG_BUILD_DIR)/abort.a $(PKG_BUILD_DIR)/abort.o
	$(MAKE) -C $(PKG_BUILD_DIR) \
		$(TARGET_CONFIGURE_OPTS) \
		DESTDIR="$(PKG_INSTALL_DIR)" \
		CFLAGS="$(TARGET_CFLAGS)" \
		AM_CFLAGS_X86_LINUX="$(TARGET_CFLAGS) -I$(PKG_BUILD_DIR)/coregrind" \
		AM_CFLAGS_AMD64_LINUX="$(TARGET_CFLAGS) -I$(PKG_BUILD_DIR)/coregrind" \
		AM_CFLAGS_PPC32_LINUX="$(TARGET_CFLAGS) -I$(PKG_BUILD_DIR)/coregrind" \
		AM_CFLAGS_PPC64_LINUX="$(TARGET_CFLAGS) -I$(PKG_BUILD_DIR)/coregrind" \
		TOOL_LDADD_COMMON="$(LIBGCC_S) $(PKG_BUILD_DIR)/abort.a" \
		all install
endef

define Package/valgrind/install	
	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/usr/bin/* $(1)/usr/bin/
	$(INSTALL_BIN) ./files/valgrind.sh $(1)/usr/bin/
	$(INSTALL_DIR) $(1)/usr/lib/valgrind
	$(CP) ./files/uclibc.supp $(1)/usr/lib/valgrind/
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/valgrind/*-linux $(1)/usr/lib/valgrind/
endef

$(eval $(call BuildPackage,valgrind))
