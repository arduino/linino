# 
# Copyright (C) 2009-2010 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=mtd-utils
PKG_REV:=a2d010f8fca904fffa3c6e5a5d148cc96a37a08a
PKG_VERSION:=20090227
PKG_RELEASE:=1
PKG_INSTALL:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.bz2
PKG_SOURCE_URL:=git://git.infradead.org/mtd-utils.git
PKG_SOURCE_PROTO:=git
PKG_SOURCE_SUBDIR:=$(PKG_NAME)-$(PKG_VERSION)
PKG_SOURCE_VERSION:=$(PKG_REV)

include $(INCLUDE_DIR)/package.mk

define Package/mtd-utils
  SECTION:=utils
  CATEGORY:=Utilities
  TITLE:=Utilities for flash info/debug
  URL:=http://www.linux-mtd.infradead.org/
  DEPENDS:=+zlib +liblzo +libuuid
endef

define Package/mtd-utils/description
  Utilities for manipulating memory technology devices.
endef

MAKE_FLAGS += \
	DESTDIR="$(PKG_INSTALL_DIR)" \
	BUILDDIR="$(PKG_BUILD_DIR)" \
	WITHOUT_XATTR=1

define Package/mtd-utils/install
	$(INSTALL_DIR) $(1)/usr/sbin
	$(CP) $(PKG_INSTALL_DIR)/usr/sbin/* $(1)/usr/sbin/
endef

$(eval $(call BuildPackage,mtd-utils))
