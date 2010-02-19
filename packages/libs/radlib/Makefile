# Copyright (C) 2006-2010 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=radlib
PKG_VERSION:=2.8.5
PKG_RELEASE:=2

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=@SF/radlib
PKG_MD5SUM:=82ab0c702e55a860b69ad76e2aac748f

ifeq ($(CONFIG_EXTERNAL_KERNEL_TREE),)
PATCH_DIR:=
else
PATCH_DIR:=./patches
endif

PKG_FIXUP:=libtool

include $(INCLUDE_DIR)/package.mk

define Package/radlib
  SECTION:=libs
  CATEGORY:=Libraries
  TITLE:=Rapid Application Development Library
endef

define Package/radlib/description
	radlib is a rapid application development library for unix multi-process applications
endef

CONFIGURE_ARGS += \
		  --prefix="$(TOOLCHAIN_DIR)/usr"

define Package/radlib/install
	$(INSTALL_DIR) $(1)/usr/lib
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/src/.libs/librad.so $(1)/usr/lib/
endef


$(eval $(call BuildPackage,radlib))
