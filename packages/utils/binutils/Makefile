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

include $(INCLUDE_DIR)/package.mk

CONFIGURE_ARGS_XTRA+=--disable-werror \
		--disable-nls 

define Package/binutils
  SECTION:=utils
  CATEGORY:=Utilities
  TITLE:=binutils
endef

define Package/binutils/description
  The Binutils package contains a linker, an assembler, and other tools for handling object files
endef

define Build/Configure
	(cd  $(PKG_BUILD_DIR)/; \
		$(TARGET_CONFIGURE_OPTS) \
		$(CONFIGURE_VARS) \
		$(CONFIGURE_CMD) \
		$(CONFIGURE_ARGS_XTRA) \
		$(CONFIGURE_ARGS) \
	);
endef

define Build/Compile
	make -C $(PKG_BUILD_DIR)/bfd/doc/ CFLAGS="-I$(PKG_BUILD_DIR)/include" chew
	$(MAKE) -C $(PKG_BUILD_DIR) all
	$(MAKE) -C $(PKG_BUILD_DIR) install DESTDIR=$(PKG_INSTALL_DIR)
endef

define Package/binutils/install
	$(INSTALL_DIR) $(1)/usr
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/usr/bin/ $(1)/usr
	$(CP) $(PKG_INSTALL_DIR)/usr/*-linux $(1)/usr
endef

$(eval $(call BuildPackage,binutils))
