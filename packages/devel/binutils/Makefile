#
# Copyright (C) 2006 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
include $(TOPDIR)/rules.mk

PKG_NAME:=binutils
PKG_VERSION:=$(strip $(subst ",, $(CONFIG_BINUTILS_VERSION)))
#"))
PKG_RELEASE:=1
PKG_SOURCE_URL:=http://ftp.gnu.org/gnu/binutils/ \
	ftp://gatekeeper.dec.com/pub/GNU/ \
		ftp://ftp.uu.net/archive/systems/gnu/ \
		ftp://ftp.eu.uu.net/pub/gnu/ \
		ftp://ftp.funet.fi/pub/gnu/prep/ \
		ftp://ftp.leo.org/pub/comp/os/unix/gnu/

PKG_SOURCE:=binutils-$(PKG_VERSION).tar.bz2
PATCH_DIR:=$(TOPDIR)/toolchain/binutils/patches/$(PKG_VERSION)
PKG_INSTALL:=1

include $(INCLUDE_DIR)/package.mk

define Package/binutils
  SECTION:=devel
  CATEGORY:=Development
  TITLE:=binutils
  DEPENDS:=@TARGET_x86
endef

define Package/binutils/description
  The Binutils package contains a linker, an assembler, and other tools for handling object files
endef

define Package/libbfd
  SECTION:=libs
  CATEGORY:=Libraries
  TITLE:=libbfd
endef

define Build/Configure
	$(call Build/Configure/Default, \
		--disable-werror \
		--disable-nls \
	)
endef

define Build/InstallDev
	$(INSTALL_DIR) $(1)/usr/{lib,include}
	$(INSTALL_DATA) \
		$(PKG_INSTALL_DIR)/usr/lib/libbfd.a \
		$(1)/usr/lib/
	$(INSTALL_DATA) \
		$(PKG_INSTALL_DIR)/usr/include/{symcat,ansidecl,bfd,bfdlink}.h \
		$(1)/usr/include/
endef

define Build/Compile
	make -C $(PKG_BUILD_DIR)/bfd/doc/ CFLAGS="-I$(PKG_BUILD_DIR)/include" chew
	$(call Build/Compile/Default)
endef

define Package/binutils/install
	$(INSTALL_DIR) $(1)/usr
	$(CP) $(PKG_INSTALL_DIR)/usr/bin/ $(1)/usr/
	$(CP) $(PKG_INSTALL_DIR)/usr/*-linux $(1)/usr
endef

define Package/libbdf/install
    true
endef

$(eval $(call BuildPackage,binutils))
$(eval $(call BuildPackage,libbfd))
