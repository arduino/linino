# 
# Copyright (C) 2007 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
# blogic@openwrt.org
include $(TOPDIR)/rules.mk

PKG_BASE_NAME:=font
PKG_NAME:=font-bh-75dpi
PKG_RELEASE:=2
PKG_VERSION:=1.0.0
PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.bz2
PKG_BUILD_DIR=$(BUILD_DIR)/Xorg/$(_CATEGORY)/${PKG_NAME}-$(PKG_VERSION)/
PKG_SOURCE_URL:=http://xorg.freedesktop.org/releases/X11R7.3/src/font

include $(INCLUDE_DIR)/package.mk

define Package/font-bh-75dpi
  SECTION:=xorg-font
  CATEGORY:=Xorg
  SUBMENU:=font
  DEPENDS:= +xserver +font-util @DISPLAY_SUPPORT
  TITLE:=font-bh-75dpi
  URL:=http://xorg.freedesktop.org/
endef

define Build/InstallDev
	DESTDIR="$(1)" $(MAKE) -C $(PKG_BUILD_DIR) $(MAKE_FLAGS) install
endef

CONFIGURE_ARGS+=--disable-iso8859-2 --disable-iso8859-3 --disable-iso8859-4  --disable-iso8859-5 --disable-iso8859-7 --disable-iso8859-8 --disable-iso8859-9 --disable-iso8859-10 --disable-iso8859-11 --disable-iso8859-13 --disable-iso8859-14 --disable-iso8859-16 --disable-koi8-r --disable-jisx0201

define Build/Compile
	UTIL_DIR="$(STAGING_DIR)/usr/lib/X11/fonts/util/" make -e -C $(PKG_BUILD_DIR)
	DESTDIR=$(PKG_INSTALL_DIR) $(MAKE) -C $(PKG_BUILD_DIR) $(MAKE_FLAGS) install
	find $(PKG_INSTALL_DIR) -name fonts.dir | \
		xargs -i -t \
			sed -i '1d' {} 
	find $(PKG_INSTALL_DIR) -name fonts.dir | \
		xargs -i -t \
			mv {} {}.font-bh-75dpi
endef

define Package/font-bh-75dpi/install
	$(INSTALL_DIR) $(1)/usr/lib/
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/* $(1)/usr/lib/
endef

define Package/font-bh-75dpi/postinst
#!/bin/sh

FILE_NEW=`find $${IPKG_INSTROOT} -name fonts.dir.font-bh-75dpi`
FILE_OLD=`dirname $${FILE_NEW}`/fonts.dir

echo found $${FILE}

if [ ! -z $${FILE_NEW} ]; then
	if [ -f $${FILE_OLD} ]; then
		sed -i "1d" $${FILE_OLD}
		cat $${FILE_NEW} >> $${FILE_OLD}
		rm -rf $${FILE_NEW}
		mv $${FILE_OLD} $${FILE_OLD}.tmp
	else
		mv $${FILE_NEW} $${FILE_OLD}.tmp
	fi
	(echo `wc -l $${FILE_OLD}.tmp | awk '{print($$1)}'`; cat $${FILE_OLD}.tmp) > $${FILE_OLD}
	rm $${FILE_OLD}.tmp
fi
endef

ifeq (font-bh-75dpi,font-util)
define Build/Compile
	$(MAKE) -C $(PKG_BUILD_DIR)/ 
endef
endif

$(eval $(call BuildPackage,font-bh-75dpi))

