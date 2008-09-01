# 
# Copyright (C) 2006 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
# blogic@openwrt.org
include $(TOPDIR)/rules.mk

PKG_NAME:=@NAME@
PKG_RELEASE:=2
PKG_VERSION:=@VER@
PKG_SOURCE_URL:=http://xorg.freedesktop.org/releases/X11R7.3/src/util/
PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.bz2
PKG_BUILD_DIR=$(BUILD_DIR)/Xorg/$(_CATEGORY)/${PKG_NAME}-$(PKG_VERSION)/

include $(INCLUDE_DIR)/package.mk

define Package/@NAME@
  SECTION:=xorg-utils
  CATEGORY:=Xorg
  SUBMENU:=utils
  DEPENDS:=@DEP@ @DISPLAY_SUPPORT
  TITLE:=${PKG_NAME}
  URL:=http://xorg.freedesktop.org/
endef

define Build/InstallDev
	DESTDIR=$(STAGING_DIR) $(MAKE) -C $(PKG_BUILD_DIR) $(MAKE_FLAGS) install
endef

define Build/Configure
	cd $(PKG_BUILD_DIR); \
		./configure \
			--prefix=${STAGING_DIR} \
			--sysconfdir=/etc \
			--mandir=${STAGING_DIR}/share/man \
			--localstatedir=/var
endef

define Build/Compile
	make -C $(PKG_BUILD_DIR)
endef

$(eval $(call BuildPackage,@NAME@))
