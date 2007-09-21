# 
# Copyright (C) 2006 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
# blogic@openwrt.org

PKG_SOURCE_URL:=http://xorg.freedesktop.org/releases/X11R7.2/src/util/

_CATEGORY:=utils

include ../../common.mk

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


