#
# Copyright (C) 2006-2009 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
include $(TOPDIR)/rules.mk

PKG_NAME:=binutils
PKG_VERSION:=$(strip $(subst ",, $(CONFIG_BINUTILS_VERSION)))
#"))
PKG_RELEASE:=2
PKG_SOURCE_URL:=@GNU/binutils
PKG_SOURCE:=binutils-$(PKG_VERSION).tar.bz2
PATCH_DIR:=$(TOPDIR)/toolchain/binutils/patches/$(PKG_VERSION)

PKG_FIXUP:=libtool
PKG_LIBTOOL_PATHS:=. gas bfd opcodes gprof binutils ld
PKG_INSTALL:=1

include $(INCLUDE_DIR)/package.mk

define Package/binutils
  SECTION:=devel
  CATEGORY:=Development
  TITLE:=binutils
  DEPENDS:=+objdump
endef

define Package/objdump
  SECTION:=devel
  CATEGORY:=Development
  TITLE:=objdump
  DEPENDS:=+zlib
endef

define Package/binutils/description
  The Binutils package contains a linker, an assembler, and other tools for handling object files
endef

TARGET_CFLAGS += $(FPIC)

define Build/Configure
	$(call Build/Configure/Default, \
		--disable-werror \
		--disable-nls \
	)
	$(call Build/Compile/Default, \
		configure-bfd \
		configure-binutils \
		configure-etc \
		configure-gas \
		configure-gprof \
		configure-intl \
		configure-ld \
		configure-libiberty \
		configure-opcodes \
	)
	$(MAKE) -C $(PKG_BUILD_DIR)/bfd/po Makefile
endef

define Build/InstallDev
	$(INSTALL_DIR) $(1)/usr/{lib,include}
	$(CP) \
		$(PKG_INSTALL_DIR)/usr/lib/* \
		$(1)/usr/lib/
	$(CP) \
		$(PKG_BUILD_DIR)/include/*.h \
		$(1)/usr/include/
	$(CP) \
		$(PKG_INSTALL_DIR)/usr/include/* \
		$(1)/usr/include/
	rm -f $(1)/usr/include/gdbm.h
endef

define Build/Compile
	$(MAKE) -C $(PKG_BUILD_DIR)/bfd/doc/ CFLAGS="-I$(PKG_BUILD_DIR)/include" chew
	$(call Build/Compile/Default)
endef

define Package/objdump/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(CP) $(PKG_INSTALL_DIR)/usr/*-linux/bin/objdump $(1)/usr/bin/
endef

define Package/binutils/install
	$(INSTALL_DIR) $(1)/usr
	$(CP) $(PKG_INSTALL_DIR)/usr/bin/ $(1)/usr/
	$(CP) $(PKG_INSTALL_DIR)/usr/*-linux $(1)/usr
	rm -f $(1)/usr/bin/objdump
endef

$(eval $(call BuildPackage,binutils))
$(eval $(call BuildPackage,objdump))
